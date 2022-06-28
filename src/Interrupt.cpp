//
// Created by os on 4/23/22.
//
#include "../h/Interrupt.h"
#include "../h/Cons.hpp"

uint64 Interrupt::prevSstatus = 2;
int Interrupt::lock_var = 1;
Sem* PutCharThread::waitForPutSignal;
Sem* GetCharThread::waitForGetSignal;
void Interrupt::handleSysCall() {

    uint64 scause = r_scausei();
    if(scause == 0x0000000000000009UL || scause == 0x0000000000000008UL) {
        uint64 sepc = r_sepci() + 4;
        uint64 sscause = r_scausei();
        uint64 opCode;
        __asm__ volatile("mv %0,a0" : "=r"(opCode));
        callSys(opCode);
        w_scausei(sscause);
        w_sepci(sepc);
        mc_sip(SIP_SSIP);
        return;

    }
    else if(scause == 0x8000000000000001UL){
        PCB::sleeping_list->decTime();
        while (PCB::sleeping_list->getTimeLeft() == 0){
            PCB* pcb = PCB::sleeping_list->get();
            pcb->setSleeping(false);
            Scheduler::put(pcb);
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
            while (*((char *)CONSOLE_STATUS) & CONSOLE_RX_STATUS_BIT){
                char c = (*(char *) CONSOLE_RX_DATA);
                Cons::inputBuffer->put(c);
            }
        }
        plic_complete(irq);
       //console_handler();
    }

}

void Interrupt::callSys(uint64 opCode) {
    if(opCode == 0x1){
        uint64 size;
        __asm__ volatile ("mv %0,a1" : "=r"(size));
        size*=MEM_BLOCK_SIZE;
        void* retAdr = MemoryAllocator::mem_alloc((size_t) size);
        long* header = (long*) retAdr;
        size/=MEM_BLOCK_SIZE;
        *header = size;
        header++;
        __asm__ volatile("mv a0,%0" : : "r"((uint64)header));
        return;

    }
    else if(opCode == 0x2){
        uint64 adr;
        __asm__ volatile ("mv %0,a1" : "=r"(adr));
        int res = MemoryAllocator::mem_free((void*) adr);
        __asm__ volatile("mv a0,%0" : : "r"((uint64)res));
        return;
    }
    else if(opCode == 0x10){
        uint64 handle,body,args,stac,res;
        __asm__ volatile ("mv %0,a1" : "=r"(handle));
        __asm__ volatile ("mv %0,a2" : "=r"(body));
        __asm__ volatile ("mv %0,a6" : "=r"(args));
        __asm__ volatile ("mv %0,a7" : "=r"(stac));


        (*(thread_t*)handle)->PCB = PCB::allocatePCB();
        if((*(thread_t*)handle)->PCB == 0){
            res = -1;
            __asm__ volatile("mv a0,%0" : : "r"(res));
            return;
        }
        *(PCB*)(*(thread_t*)handle)->PCB = PCB((PCB::Body)body,(void*)args,(uint64*)stac,DEFAULT_TIME_SLICE);
        res = 0;
        __asm__ volatile("mv a0,%0" : : "r"(res));
        return;
    }
    else if(opCode == 0x11){
        uint64 handle,body,args,stac,res;
        __asm__ volatile ("mv %0,a1" : "=r"(handle));
        __asm__ volatile ("mv %0,a2" : "=r"(body));
        __asm__ volatile ("mv %0,a6" : "=r"(args));
        __asm__ volatile ("mv %0,a7" : "=r"(stac));
        (*(thread_t*)handle)->PCB = PCB::allocatePCB();
        if((*(thread_t*)handle)->PCB == 0){
            res = -1;
            __asm__ volatile("mv a0,%0" : : "r"(res));
            return;
        }
        *(PCB*)(*(thread_t*)handle)->PCB = PCB((PCB::Body)body,(void*)args,(uint64*)stac,DEFAULT_TIME_SLICE);
        //PCB::timeLeft = 0;
        if(PCB::running == nullptr){
            PCB::running = (PCB*)(*(thread_t*)handle)->PCB;
        } else{
            Scheduler::put((PCB*)(*(thread_t*)handle)->PCB);
        }
        //PCB::dispatch();
        res = 0;
        __asm__ volatile("mv a0,%0" : : "r"(res));
        return;
    }
    else if(opCode == 0x12){
        if(PCB::running!= nullptr) {
            PCB::running->setFinished(true);
            uint64 res = 0;
            __asm__ volatile("mv a0,%0" : : "r"(res));
            return;
        }
        uint64 res = -1;
        __asm__ volatile("mv a0,%0" : : "r"(res));
        return;

    }
    else if(opCode == 0x13){
        PCB::timeLeft = 0;
        PCB::dispatch();
        //return;
    }
    else if(opCode == 0x21){
        uint64 handle,init,res;
        __asm__ volatile ("mv %0,a1" : "=r"(handle));
        __asm__ volatile ("mv %0,a2" : "=r"(init));
        (*(sem_t *)handle)->Sem = Sem::allocateSem();
        if((*(sem_t *)handle)->Sem == 0){
            res = -1;
            __asm__ volatile("mv a0,%0" : : "r"(res));
            return;
        }
        *(Sem*)(*(sem_t *)handle)->Sem = Sem((int)init);
        res = 0;
        __asm__ volatile("mv a0,%0" : : "r"(res));
        return;

    }
    else if(opCode == 0x22){
        uint64 handle,res;
        __asm__ volatile ("mv %0,a1" : "=r"(handle));
        if((Sem*)((sem_t)handle)->Sem!= nullptr) {
            ((Sem *) ((sem_t ) handle)->Sem)->deblockAll();
            res = 0;
            __asm__ volatile("mv a0,%0" : : "r"(res));
            return;
        }
        res = -1;
        __asm__ volatile("mv a0,%0" : : "r"(res));
        return;
    }
    else if(opCode == 0x23){
        uint64 handle,res;
        __asm__ volatile ("mv %0,a1" : "=r"(handle));
        if((Sem*)((sem_t)handle)->Sem!= nullptr) {
            ((Sem *) ((sem_t ) handle)->Sem)->wait();
            if(!PCB::running->unblockError) {
                res = 0;
                __asm__ volatile("mv a0,%0" : : "r"(res));
                return;
            } else{
                res = -2;
                __asm__ volatile("mv a0,%0" : : "r"(res));
                return;
            }
        }
        res = -1;
        __asm__ volatile("mv a0,%0" : : "r"(res));
        return;
    }
    else if(opCode == 0x24){
        uint64 handle,res;
        __asm__ volatile ("mv %0,a1" : "=r"(handle));
        if((Sem*)((sem_t)handle)->Sem!= nullptr) {
            ((Sem *) ((sem_t ) handle)->Sem)->signal();
            res = 0;
            __asm__ volatile("mv a0,%0" : : "r"(res));
            return;
        }
        res = -1;
        __asm__ volatile("mv a0,%0" : : "r"(res));
        return;

    } else if(opCode == 0x31){
        uint64 time,res;
        __asm__ volatile ("mv %0,a1" : "=r"(time));
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
        return;
    }
    else if(opCode == 0x42){
        uint64 chr;
        __asm__ volatile ("mv %0,a1" : "=r"(chr));
        Cons::outputBuffer->put((char)chr);
        //PutCharThread::waitForPutSignal->signal();
        return;

    }
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

//void Interrupt::ms_sstatus(uint64 mask) {
//    __asm__ volatile("csrc sip, %[mask]" : : [mask]"r"(mask));
//
//}








