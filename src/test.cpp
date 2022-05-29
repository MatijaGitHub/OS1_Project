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
    for(int i = 0; i < 99;i++){
        __putc('a');
        __putc('\n');
        for(int j = 0; j < 110000000;j++){}

    }
}
void f2(void* args){
    for(int i = 0; i < 99;i++){
        __putc('b');
        __putc('\n');
        for(int j = 0; j < 90000000;j++){}



    }
}
void f3(void* args){
    for(int i = 0; i < 99;i++){
        __putc('c');
        __putc('\n');
        for(int j = 0; j < 100000000;j++){}



    }
    //mutex.signal();
}

void medium(void* args){
    while (true){
        //__putc('a');
        //thread_dispatch();
    }
}
void init(){
    Interrupt::w_stvec((uint64) &Interrupt::callRoutine);
    Thread startThread(&medium, nullptr);
    startThread.start();
    Thread waitingThread(&medium, nullptr);
    waitingThread.start();
    //Interrupt::unlock();
    Thread t1(&f1, nullptr);
    t1.start();
    Thread t2(&f2, nullptr);
    t2.start();
    Thread t3(&f3, nullptr);
    t3.start();
    mutex = Semaphore(0);
    Interrupt::unlock();
}

int main(){
    init();
    //__putc('b');
    //mutex.wait();
    //int i = 0;
    //__putc('0' + i);
    //__putc('E');
    //__putc('\n');

    mutex.wait();
    return 0;


}