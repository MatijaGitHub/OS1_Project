#include "../lib/console.h"
#include "../lib/hw.h"
#include "../lib/mem.h"
#include "../h/Interrupt.hpp"
#include "../h/abi.h"
#include "../h/MemoryAllocator.hpp"

extern int callSys(int op, void* arg, int len);

int main(){
    //Interrupt::callRoutine();
    Interrupt::w_stvec((uint64) &Interrupt::callRoutine);
    //Interrupt::us_status(Interrupt::SSTATUS_SIE);
    //__asm__("ecall");
    uint64* arr =(uint64*) __mem_alloc(2);
    *arr = 3;


    MemoryAllocator::getAllocator()->getList()->printList();
    callSys(1, (void*)arr,2);
    MemoryAllocator::getAllocator()->getList()->printList();

    return 0;

}