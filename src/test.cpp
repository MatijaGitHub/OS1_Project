#include "../lib/console.h"
#include "../lib/hw.h"
#include "../lib/mem.h"
#include "../h/Interrupt.hpp"
#include "../h/abi.h"

extern int callSys(int op, void* arg, int len);

int main(){
    //Interrupt::callRoutine();
    Interrupt::w_stvec((uint64) &Interrupt::callRoutine);
    //Interrupt::us_status(Interrupt::SSTATUS_SIE);
    //__asm__("ecall");
    callSys(5, nullptr,0);
    return 0;

}