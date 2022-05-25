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
#include "../h/Sem.h"


typedef struct {
    char c;
}Arguments;

Sem mutex = 0;
void f1(void* args){
    //mutex.wait();
    for(int i = 0; i < 10;i++) {
        __putc('f');
        __putc('1');
        __putc(':');
        __putc(i+'0');
        __putc(' ');
        if(i == 4){
            thread_dispatch();
        }
    }
    //mutex.signal();
    __putc('s');
}

void f2(void* args){
    //mutex.wait();
    for(int i = 0; i < 10;i++) {
        __putc('f');
        __putc('2');
        __putc(':');
        __putc(i+'0');

        __putc(' ');
        if(i == 4){
            //mutex.signal();
        }
    }
    mutex.signal();
    __putc('s');
}
void medium(void* args){
    while (true){PCB::dispatch();}
}
void init(){
    Interrupt::w_stvec((uint64) &Interrupt::callRoutine);
    Thread startThread(&f1, nullptr);
    Thread secondThread(&f1, nullptr);
    Thread thirdThread(&f2, nullptr);
    Thread waitingThread(&medium, nullptr);
    startThread.start();
    waitingThread.start();
    secondThread.start();
    thirdThread.start();
    mutex = Sem(0);

}

int main(){
    init();
    PCB::dispatch();
    //mutex.wait();
    __putc('E');
    __putc('\n');
    return 0;


}