//
// Created by os on 4/23/22.
//
#include "../h/Interrupt.h"
#include "../lib/console.h"
#include "../h/MemoryAllocator.h"
#include "../h/PCB.h"
#include "../h/syscall_c.h"

uint64 sepc;

void Interrupt::handleSysCall() {
    uint64 scause = r_scausei();
    if(scause == 0x0000000000000009UL || scause == 0x0000000000000008UL) {
        sepc = r_sepci() + 4;
        uint64 scause = r_scausei();
        uint64 opCode;
        __asm__ volatile("mv %0,a0" : "=r"(opCode));
        callSys(opCode);
        w_scausei(scause);
        w_sepci(sepc);

    }
    else if(scause == 0x8000000000000001UL){
        return;
    }
}

void Interrupt::ms_status(uint64 mask) {
    uint64 stat = r_statusi();
    stat|=mask;
    w_statusi(stat);
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

void Interrupt::callSys(uint64 opCode) {
    if(opCode == 0x1){
        uint64 size;
        __asm__ volatile ("mv %0,a1" : "=r"(size));
        size*=MEM_BLOCK_SIZE;
        MemoryAllocator* mem = MemoryAllocator::getAllocator();
        void* retAdr = mem->mem_alloc((size_t) size);
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
        MemoryAllocator* mem = MemoryAllocator::getAllocator();
        int res = mem->mem_free((void*) adr);
        __asm__ volatile("mv a0,%0" : : "r"((uint64)res));
        return;
    }
    else if(opCode == 0x11){
        uint64 handle,body,args,stac,res;
        __asm__ volatile ("mv %0,a1" : "=r"(handle));
        __asm__ volatile ("mv %0,a2" : "=r"(body));
        __asm__ volatile ("mv %0,a3" : "=r"(args));
        __asm__ volatile ("mv %0,a6" : "=r"(stac));


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
}

void Interrupt::popSppSpie() {
    __asm__ volatile("csrw sepc,ra");
    __asm__ volatile("sret");
}








