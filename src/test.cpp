#include "../lib/console.h"
#include "../lib/hw.h"
#include "../lib/mem.h"
#include "../h/Interrupt.hpp"

void main(){
    //Interrupt::callRoutine();
    Interrupt::w_stvec((uint64) &Interrupt::callRoutine);
    __asm__("ecall");

}