#include "../lib/console.h"
#include "../lib/hw.h"
#include "../h/Interrupt.h"
#include "../h/syscall_cpp.h"
#include "../h/Sem.h"


typedef struct {
    char c;
}Arguments;

Semaphore mutex;
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
        __putc('h');
        thread_dispatch();
    }
}
void init(){
    Interrupt::w_stvec((uint64) &Interrupt::callRoutine);
    Thread startThread(&f1, nullptr);
    startThread.start();
    Thread waitingThread(&medium, nullptr);
    waitingThread.start();
   // thread_dispatch();
    Thread secondThread(&f1, nullptr);
    Thread thirdThread(&f2, nullptr);
    secondThread.start();
    thirdThread.start();
    mutex = Semaphore(0);
    Interrupt::unlock();
    thread_dispatch();



    //Interrupt::unlock();
    __putc('d');

}

int main(){
    init();
    __putc('b');
    //mutex.wait();
    int i = 0;
    __putc('0' + i);
    __putc('E');
    __putc('\n');


    return 0;


}