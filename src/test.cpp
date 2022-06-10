#include "../lib/console.h"
#include "../lib/hw.h"
#include "../h/Interrupt.h"
#include "../h/syscall_cpp.hpp"
#include "../h/Cons.hpp"
#include "../h/Sem.h"


typedef struct {
    char c;
}Arguments;


void medium(void* args){
    while (true){
        __putc('a');
    }
}
class Test : public Thread{
protected:
    void run() override{
        Console::putc('g');
    }
public:
    Test() : Thread(){

    }
};
class PeriodicTest : public PeriodicThread{
protected:
    void periodicActivation() override{
        Console::putc('g');
    }
public:
    PeriodicTest(time_t t) : PeriodicThread(t){

    }

};
void init(){
    Interrupt::w_stvec((uint64) &Interrupt::callRoutine);
    Thread* startThread = new Thread(&medium, nullptr);
    startThread->start();
//    thread_t  main;
//    thread_create(&main,medium, nullptr);
    //PCB::sleeping_list = new PCB_List();
//    Thread waitingThread(&medium, nullptr);
//    waitingThread.start();
//    PutCharThread* putCharThread =new PutCharThread();
//    GetCharThread* getCharThread = new GetCharThread();
//    Cons::singleton = new Cons();
//    Cons::outputBuffer = new CharBuffer(128);
//    Cons::inputBuffer = new CharBuffer(128);
//    PutCharThread::waitForPutSignal = new Sem(0);
//    GetCharThread::waitForGetSignal = new Sem(0);
//    putCharThread->start();
//    getCharThread->start();
    //Interrupt::unlock();


}
//#include "../test/Threads_C_API_test.hpp" // zadatak 2, niti C API i sinhrona promena konteksta
//#include "../test/Threads_CPP_API_test.hpp" // zadatak 2., niti CPP API i sinhrona promena konteksta

//#include "../test/ConsumerProducer_C_API_test.h" // zadatak 3., kompletan C API sa semaforima, sinhrona promena konteksta
#include "../test/ConsumerProducer_CPP_Sync_API_test.hpp" // zadatak 3., kompletan CPP API sa semaforima, sinhrona promena konteksta

//#include "../test/ThreadSleep_C_API_test.hpp" // thread_sleep test C API
//#include "../test/ConsumerProducer_CPP_API_test.hpp" // zadatak 4. CPP API i asinhrona promena konteksta

void userMain() {
    //Threads_C_API_test(); // zadatak 2., niti C API i sinhrona promena konteksta
    //Threads_CPP_API_test(); // zadatak 2., niti CPP API i sinhrona promena konteksta

    //producerConsumer_C_API(); // zadatak 3., kompletan C API sa semaforima, sinhrona promena konteksta
    producerConsumer_CPP_Sync_API(); // zadatak 3., kompletan CPP API sa semaforima, sinhrona promena konteksta

    //testSleeping(); // thread_sleep test C API
    //ConsumerProducerCPP::testConsumerProducer(); // zadatak 4. CPP API i asinhrona promena konteksta, kompletan test svega

}
int main(){
    init();
    userMain();
    //while (true){}
    return 0;



}