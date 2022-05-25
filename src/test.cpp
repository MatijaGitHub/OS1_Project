#include "../lib/console.h"
#include "../lib/hw.h"
#include "../h/Interrupt.h"
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
    }
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

    }
    //mutex.signal();
    __putc('s');
}
void medium(void* args){
    while (true){
        //__putc('2');
    }
}
void init(){
    Interrupt::w_stvec((uint64) &Interrupt::callRoutine);
//    Interrupt::ms_status(Interrupt::SSTATUS_SIE);
    Thread startThread(&f1, nullptr);
    Thread secondThread(&f1, nullptr);
    Thread thirdThread(&f2, nullptr);
    Thread waitingThread(&medium, nullptr);
    startThread.start();
    waitingThread.start();
    secondThread.start();
    thirdThread.start();
    Semaphore mutex(0);

}

int main(){
    init();
    //mutex.wait();
    int i = 0;
    __putc('0' + i);
    __putc('E');
    __putc('\n');
    Interrupt::ms_status(Interrupt::SSTATUS_SIE);

    return 0;


}