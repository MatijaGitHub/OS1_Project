//
// Created by os on 4/23/22.
//
#include "../h/Interrupt.hpp"
#include "../lib/console.h"



void Interrupt::handleSysCall() {
    uint64 scause = r_scausei();
    if(scause == 0x0000000000000009UL) {
        uint64 sepc = r_sepci() +4;
        uint64 scause = r_scausei();
        uint64 a0;
        __asm__ volatile("mv %0,a0":"=r"(a0));
        __putc('0'+ a0);
        __putc('\n');

        w_scause(scause);
        w_sepc(sepc);

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

