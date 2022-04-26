#include "../lib/console.h"
#include "../lib/hw.h"
#include "../lib/mem.h"
#include "../h/Interrupt.hpp"
#include "../h/abi.h"
#include "../h/MemoryAllocator.hpp"
#include "../h/syscall_c.h"
#include "../h/FreeShardList.hpp"
#include "../h/PCB.hpp"
#include "../h/Scheduler.hpp"

void f1(){
    __putc('A');
    PCB::dispatch();
}

void f2(){
    __putc('C');
    PCB::dispatch();
}



int main(){

    Interrupt::w_stvec((uint64) &Interrupt::callRoutine);

    PCB* func = (PCB*) mem_alloc(sizeof (PCB));
    *func = PCB(&f1,3);
    PCB* func2 =(PCB*) mem_alloc(sizeof (PCB));
    *func2 = PCB(&f2,4);
    Scheduler::put(func);
    Scheduler::put(func2);
    PCB::running = func;
    func2->dispatch();


    return 0;



}