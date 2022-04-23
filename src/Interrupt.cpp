//
// Created by os on 4/23/22.
//
#include "../h/Interrupt.hpp"
#include "../lib/console.h"



void Interrupt::doSomething() {
    uint64 scause = r_scause();
    if(scause == 0x0000000000000009UL) {
        uint64 sepc = r_sepc() + 4;
        uint64 scause = r_scause();
        __putc('A');
        __putc('\n');
        w_scause(scause);
        w_sepc(sepc);

    }
}

void Interrupt::ms_status(uint64 mask) {
    uint64 stat = r_status();
    stat|=mask;
    w_status(stat);
}


 uint64 Interrupt::r_status() {
    uint64 sstatus;
    __asm__ volatile ("csrr %[sstatus],sstatus":  [sstatus]"=r"(sstatus));
    return sstatus;
}

 void Interrupt::w_status(uint64 sstatus){

    __asm__ volatile ("csrw sstatus,%[sstatus]": : [sstatus]"r"(sstatus));

}
 uint64 Interrupt::r_stvec(){
    uint64 stvec;
    __asm__ volatile ("csrr %[stvec],stvec":  [stvec]"=r"(stvec));
    return stvec;
}


 void Interrupt::w_stvec(uint64 stvec) {
    __asm__ volatile ("csrw stvec,%[stvec]": : [stvec]"r"(stvec));

}

uint64 Interrupt::r_scause() {
    uint64 scause;
    __asm__ volatile ("csrr %[scause],scause":  [scause]"=r"(scause));
    return scause;
}

void Interrupt::w_scause(uint64 scause) {
    __asm__ volatile ("csrw scause,%[scause]": : [scause]"r"(scause));

}

void Interrupt::w_sepc(uint64 sepc) {
    __asm__ volatile ("csrw sepc,%[sepc]": : [sepc]"r"(sepc));

}

uint64 Interrupt::r_sepc() {
    uint64 sepc;
    __asm__ volatile ("csrr %[sepc],sepc":  [sepc]"=r"(sepc));
    return sepc;
}

