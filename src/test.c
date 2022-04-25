#include "../lib/console.h"
#include "../lib/hw.h"
#include "../lib/mem.h"
#include "../h/interrupt.hpp"

uint64 pc;
uint64 stvec;

void a(){
    __asm__("mv %0,ra":"=r"(pc));
}
void b(){
    __asm__("mv ra,%0": :"r"(pc));
}
inline void w_stvec(uint64 stvec){

    __asm__ volatile ("csrw stvec,%[stvec]": : [stvec]"r"(stvec));

}
inline uint64 r_stvec(){
    uint64 stvec;
    __asm__ volatile ("csr %[stvec],stvec":  [stvec]"=r"(stvec));
    return stvec;
}


void main(){
    //uint64 s = (uint64) &RiscV::callRoutine;
    //w_stvec(s);

}