#include "../lib/console.h"
#include "../lib/hw.h"
#include "../lib/mem.h"
#include "../h/Interrupt.h"
#include "../h/abi.h"
#include "../h/MemoryAllocator.h"
#include "../h/syscall_c.h"
#include "../h/FreeShardList.h"
#include "../h/PCB.h"
#include "../h/Scheduler.h"
#include "../h/syscall_cpp.h"


typedef struct {
    char c;
}Arguments;


void f1(void* args){
    __putc(((Arguments*)args)->c);
    PCB::dispatch();
    __putc('D');
}

void f2(void* args){
    __putc(((Arguments*)args)->c);
    PCB::dispatch();
}
void medium(void* args){
    while (true){}
}
void init(){
    Interrupt::w_stvec((uint64) &Interrupt::callRoutine);
    Thread startThread = Thread(&medium, nullptr);
    startThread.start();
}

int main(){
    init();

    //Arguments args;
    //args.c = 'a';
    //Thread t = Thread(&f1,(void *)&args);
    //t.start();
    //PCB::dispatch();
    return 0;


}