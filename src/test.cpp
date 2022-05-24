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
    for(int i = 0; i < 10;i++) {
        __putc('f');
        __putc('1');
        __putc(':');
        __putc(i+'0');
        __putc(' ');
        if(i == 4){
            PCB::dispatch();
        }
    }
    __putc('s');
}

void f2(void* args){
    for(int i = 0; i < 10;i++) {
        __putc('f');
        __putc('2');
        __putc(':');
        __putc(i+'0');

        __putc(' ');
        if(i == 4){
            PCB::dispatch();
        }
    }
    __putc('s');
}
void medium(void* args){
    while (true){}
}
void init(){
    Interrupt::w_stvec((uint64) &Interrupt::callRoutine);
    Thread startThread(&medium, nullptr);
    Thread secondThread(&f2, nullptr);
    Thread thirdThread(&f1, nullptr);
    startThread.start();
    secondThread.start();
    thirdThread.start();
    PCB::dispatch();
    PCB::dispatch();
    PCB::dispatch();




}

int main(){
    init();

    //Arguments args;
    //args.c = 'a';
    //Thread t = Thread(&f1,(void *)&args);
    //t.start();
    //PCB::dispatch();
    __putc('E');
    __putc('\n');
    return 0;


}