//
// Created by os on 4/23/22.
//
#include "../h/Interrupt.h"
#include "../h/Cons.hpp"

uint64 Interrupt::prevSstatus = 2;
int Interrupt::lock_var = 1;
bool Interrupt::enableSystemStack = false;
void Interrupt::handleSysCall() {


    uint64 scause = r_scausei();
    if(scause == 0x0000000000000009UL || scause == 0x0000000000000008UL) {

        uint64 sepc = r_sepci() + 4;
        uint64 sscause = r_scausei();
        uint64 opCode,arg1,arg2,arg3,arg4;
        __asm__ volatile("ld %0,80(s0)" : "=r"(opCode));
        __asm__ volatile("ld %0,88(s0)" : "=r"(arg1));
        __asm__ volatile("ld %0,96(s0)" : "=r"(arg2));
        __asm__ volatile("ld %0,104(s0)" : "=r"(arg3));
        __asm__ volatile("ld %0,112(s0)" : "=r"(arg4));
        callSys(opCode,arg1,arg2,arg3,arg4);
        w_scausei(sscause);
        w_sepci(sepc);



    }
    else if(scause == 0x8000000000000001UL){
        uint64 sie = r_siei();
        if((sie & 2) == 0){
            mc_sip(SIP_SSIP);
            return;
        }
        PCB::sleeping_list->decTime();
        while (PCB::sleeping_list->getTimeLeft() == 0){
            PCB* pcb = PCB::sleeping_list->get();
            if(pcb->isPeriodic && PCB::isPeriodicBlocked){
                PCB::sleeping_list->putTime(pcb,1);
            }
            else{
                pcb->setSleeping(false);
                Scheduler::put(pcb);
            }

        }
        PCB::timeLeft++;
        if(PCB::timeLeft >= PCB::running->getTimeSlice()){
          uint64 sepc = r_sepc();
          uint64 sscause = r_scausei();
          PCB::timeLeft = 0;
          PCB::dispatch();
          w_scausei(sscause);
         w_sepc(sepc);
        }
           mc_sip(SIP_SSIP);
    }
    else if(scause == 0x8000000000000009UL){
        int irq = plic_claim();
        if(irq == CONSOLE_IRQ){
            volatile char status = *((char *)CONSOLE_STATUS);
            while (status & CONSOLE_RX_STATUS_BIT){
                char c = (*(char *) CONSOLE_RX_DATA);
                Cons::inputBuffer->put(c);
                status = *((char *)CONSOLE_STATUS);
            }
        }
        plic_complete(irq);
    }

}

void Interrupt::callSys(uint64 opCode, uint64 arg1,uint64 arg2 , uint64 arg3 , uint64 arg4) {
    //switchToSystemStack();
    if(opCode == 0x1){
        uint64 size = arg1;
        size*=MEM_BLOCK_SIZE;
        void* retAdr = MemoryAllocator::mem_alloc((size_t) size);
        long* header = (long*) retAdr;
        size/=MEM_BLOCK_SIZE;
        *header = size;
        header++;
        __asm__ volatile("mv a0,%0" : : "r"((uint64)header));


    }
    else if(opCode == 0x2){
        uint64 adr = arg1;
        int res = MemoryAllocator::mem_free((void*) adr);
        __asm__ volatile("mv a0,%0" : : "r"((uint64)res));

    }
    else if(opCode == 0x10){
        uint64 handle = arg1,body = arg2,args = arg3,stac = arg4,res;
        (*(thread_t*)handle)->PCB = PCB::allocatePCB();
        if((*(thread_t*)handle)->PCB == 0){
            res = -1;
            __asm__ volatile("mv a0,%0" : : "r"(res));

        }
        else {
            *(PCB *) (*(thread_t *) handle)->PCB = PCB((PCB::Body) body, (void *) args, (uint64 *) stac,
                                                       DEFAULT_TIME_SLICE);
            res = 0;
            __asm__ volatile("mv a0,%0" : : "r"(res));
        }
    }
    else if(opCode == 0x11) {
        uint64 handle = arg1, body = arg2, args = arg3, stac = arg4, res;
        (*(thread_t *) handle)->PCB = PCB::allocatePCB();
        if ((*(thread_t *) handle)->PCB == 0) {
            res = -1;
            __asm__ volatile("mv a0,%0" : : "r"(res));

        } else {
            *(PCB *) (*(thread_t *) handle)->PCB = PCB((PCB::Body) body, (void *) args, (uint64 *) stac,
                                                       DEFAULT_TIME_SLICE);
            if (PCB::running == nullptr) {
                PCB::running = (PCB *) (*(thread_t *) handle)->PCB;
            } else {
                Scheduler::put((PCB *) (*(thread_t *) handle)->PCB);
            }
            res = 0;
            __asm__ volatile("mv a0,%0" : : "r"(res));
        }
    }
    else if(opCode == 0x12){
        if(PCB::running!= nullptr) {
            PCB::running->setFinished(true);
            uint64 res = 0;
            __asm__ volatile("mv a0,%0" : : "r"(res));
        } else {
            uint64 res = -1;
            __asm__ volatile("mv a0,%0" : : "r"(res));
        }

    }
    else if(opCode == 0x13){
        PCB::timeLeft = 0;
        PCB::dispatch();
    }
    else if(opCode == 0x21){
        uint64 handle = arg1,init = arg2,res;
        (*(sem_t *)handle)->Sem = Sem::allocateSem();
        if((*(sem_t *)handle)->Sem == 0){
            res = -1;
            __asm__ volatile("mv a0,%0" : : "r"(res));

        } else {
            *(Sem *) (*(sem_t *) handle)->Sem = Sem((int) init);
            res = 0;
            __asm__ volatile("mv a0,%0" : : "r"(res));
        }

    }
    else if(opCode == 0x22){
        uint64 handle = arg1,res;
        if((Sem*)((sem_t)handle)->Sem!= nullptr) {
            ((Sem *) ((sem_t ) handle)->Sem)->deblockAll();
            res = 0;
            __asm__ volatile("mv a0,%0" : : "r"(res));

        }
        else {
            res = -1;
            __asm__ volatile("mv a0,%0" : : "r"(res));
        }
    }
    else if(opCode == 0x23){
        uint64 handle = arg1,res;
        if((Sem*)((sem_t)handle)->Sem!= nullptr) {
            ((Sem *) ((sem_t ) handle)->Sem)->wait();
            if(!PCB::running->unblockError) {
                res = 0;
                __asm__ volatile("mv a0,%0" : : "r"(res));

            } else{
                res = -2;
                __asm__ volatile("mv a0,%0" : : "r"(res));

            }
        } else {
            res = -1;
            __asm__ volatile("mv a0,%0" : : "r"(res));
        }
    }
    else if(opCode == 0x24){
        uint64 handle = arg1,res;
        if((Sem*)((sem_t)handle)->Sem!= nullptr) {
            ((Sem *) ((sem_t ) handle)->Sem)->signal();
            res = 0;
            __asm__ volatile("mv a0,%0" : : "r"(res));
        }
        else {
            res = -1;
            __asm__ volatile("mv a0,%0" : : "r"(res));
        }


    } else if(opCode == 0x31){
        uint64 time = arg1,res;
        PCB::sleep((time_t) time);
        PCB::timeLeft = 0;
        PCB::dispatch();
        res = 0;
        __asm__ volatile("mv a0,%0" : : "r"(res));

    }
    else if(opCode == 0x41){
        uint64 chr;
        char c = Cons::inputBuffer->get();
        chr = (uint64)c;
        __asm__ volatile("mv a0,%0" : : "r"(chr));
    }
    else if(opCode == 0x42){
        uint64 chr = arg1;
        Cons::outputBuffer->put((char)chr);

    }
    else if(opCode == 0x50){
        mc_status(SSTATUS_SPP);
    }
    else if(opCode == 0x55){
        uint64 handle = arg1;
        ((PCB *) (*(thread_t *) handle)->PCB)->isPeriodic = true;

    }
    else if(opCode == 0x56){
        if(PCB::isPeriodicBlocked) {
            PCB::isPeriodicBlocked = false;
            PCB* periodicThread = PCB::perioThreads->get();
            while (periodicThread != nullptr) {
                Scheduler::put(periodicThread);
                periodicThread = PCB::perioThreads->get();
            }
        }
        else PCB::isPeriodicBlocked = true;
        PCB::dispatch();
    }
    //switchToUserStack();
}

inline void Interrupt::ms_status(uint64 mask) {
    __asm__ volatile("csrs sstatus, %[mask]" : : [mask]"r"(mask));
}
inline void Interrupt::mc_status(uint64 mask) {
    __asm__ volatile("csrc sstatus, %[mask]" : : [mask]"r"(mask));
}

uint64 Interrupt::r_status() {
    uint64 sstatus = r_statusi();
    return sstatus;
}
inline uint64 Interrupt::r_statusi(){
    uint64 sstatus;
    __asm__ volatile ("csrr %[sstatus],sstatus":  [sstatus]"=r"(sstatus));
    return sstatus;
}

 void Interrupt::w_status(uint64 sstatus){

     w_statusi(sstatus);

}
inline void Interrupt::w_statusi(uint64 sstatus){

    __asm__ volatile ("csrw sstatus,%[sstatus]": : [sstatus]"r"(sstatus));

}
uint64 Interrupt::r_stvec(){
    uint64 stvec = r_stveci();
    return stvec;
}
inline uint64 Interrupt::r_stveci(){
    uint64 stvec;
    __asm__ volatile ("csrr %[stvec],stvec":  [stvec]"=r"(stvec));
    return stvec;
}

void Interrupt::w_stvec(uint64 stvec) {
    w_stveci(stvec);
}
inline void Interrupt::w_stveci(uint64 stvec) {
    __asm__ volatile ("csrw stvec,%[stvec]": : [stvec]"r"(stvec));

}

 uint64 Interrupt::r_scause() {
    uint64 scause = r_scausei();
    return scause;
}

inline uint64 Interrupt::r_scausei() {
    uint64 scause;
    __asm__ volatile ("csrr %[scause],scause":  [scause]"=r"(scause));
    return scause;
}

 void Interrupt::w_scause(uint64 scause) {
     w_scausei(scause);
}
inline void Interrupt::w_scausei(uint64 scause) {
    __asm__ volatile ("csrw scause,%[scause]": : [scause]"r"(scause));

}

void Interrupt::w_sepc(uint64 sepc) {
    w_sepci(sepc);
}

inline void Interrupt::w_sepci(uint64 sepc) {
    __asm__ volatile ("csrw sepc,%[sepc]": : [sepc]"r"(sepc));

}

 uint64 Interrupt::r_sepc() {
    uint64 sepc = r_sepci();
    return sepc;
}

inline uint64 Interrupt::r_sepci() {
    uint64 sepc;
    __asm__ volatile ("csrr %[sepc],sepc":  [sepc]"=r"(sepc));
    return sepc;
}

void Interrupt::us_status(uint64 mask) {
    uint64 stat = r_statusi();
    stat= ~stat;
    stat|=mask;
    w_statusi(stat);
}



void Interrupt::popSppSpie() {
    __asm__ volatile("csrw sepc,ra");
    __asm__ volatile("sret");
}

void Interrupt::lock() {
    if(lock_var++ == 0){
        prevSstatus = r_status();
        mc_status(SSTATUS_SIE);
    }
}

void Interrupt::unlock() {
    if(--lock_var == 0){
            ms_status(prevSstatus&SSTATUS_SIE?SSTATUS_SIE:0);
//        ms_status(2);
//        ms_status(0b1000000000);
    }
}

void Interrupt::disable_sintr() {
        mc_status(SSTATUS_SIE);
}

void Interrupt::enable_sintr() {
    ms_status(SSTATUS_SIE);
}

inline void Interrupt::mc_sip(uint64 mask) {
    __asm__ volatile("csrc sip, %[mask]" : : [mask]"r"(mask));
}

 void Interrupt::userMaskSoft(){
    uint64 mask = 2;
    __asm__ volatile("csrc sie, %[mask]" : : [mask]"r"(mask));
}
 void Interrupt::userMaskHard(){
    uint64 mask = 512;
    __asm__ volatile("csrc sie, %[mask]" : : [mask]"r"(mask));
}
 void Interrupt::userUnmaskSoft(){
    uint64 mask = 2;
    __asm__ volatile("csrs sie, %[mask]" : : [mask]"r"(mask));
}
void Interrupt::userUnmaskHard(){
    uint64 mask = 512;
    __asm__ volatile("csrs sie, %[mask]" : : [mask]"r"(mask));
}

void Interrupt::switchToSystemStack() {
    if(PCB::running != nullptr && enableSystemStack)
    {
        uint64 sp, ssp = PCB::running->getSSP();
        __asm__ volatile("mv %[sp],sp" :  [sp]"=r"(sp));
        PCB::running->setSP(sp);
        __asm__ volatile("mv sp, %[ssp]" : : [ssp]"r"(ssp));
    }

}

void Interrupt::switchToUserStack() {
    if(PCB::running != nullptr && enableSystemStack)
    {
        uint64 sp = PCB::running->getSP();
        uint64 ssp;
        __asm__ volatile("mv %[ssp] , sp" : [ssp]"=r"(ssp));
        PCB::running->setSSP(ssp);
        __asm__ volatile("mv sp, %[sp]" : : [sp]"r"(sp));
    }
}

inline uint64 Interrupt::r_siei() {
    uint64 sie;
    __asm__ volatile ("csrr %[sie],sie":  [sie]"=r"(sie));
    return sie;
}







