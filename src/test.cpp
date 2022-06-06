#include "../lib/console.h"
#include "../lib/hw.h"
#include "../h/Interrupt.h"
#include "../h/syscall_cpp.hpp"
#include "../h/Sem.h"


typedef struct {
    char c;
}Arguments;


void medium(void* args){
    while (true){}
}
class Test : public Thread{
protected:
    void run() override{
        __putc('x');
    }
public:
    Test() : Thread(){

    }
};
class PeriodicTest : public PeriodicThread{
protected:
    void periodicActivation() override{
        __putc('q');
    }
public:
    PeriodicTest(time_t t) : PeriodicThread(t){

    }

};
void init(){
    Interrupt::w_stvec((uint64) &Interrupt::callRoutine);
    Thread startThread(&medium, nullptr);
    startThread.start();
//    Thread waitingThread(&medium, nullptr);
//    waitingThread.start();
    PCB::sleeping_list = new PCB_List;

    //Interrupt::unlock();
//    Thread t1(&f1, nullptr);
//    t1.start();
//    Thread t2(&f2, nullptr);
//    t2.start();
//    Thread t3(&f3, nullptr);
//    t3.start();
//    mutex = Semaphore(0);


    //Interrupt::unlock();
}
//#include "../h/Threads_C_API_test.hpp" // zadatak 2, niti C API i sinhrona promena konteksta
#include "../h/Threads_CPP_API_test.hpp" // zadatak 2., niti CPP API i sinhrona promena konteksta

//#include "../h/ConsumerProducer_C_API_test.h" // zadatak 3., kompletan C API sa semaforima, sinhrona promena konteksta
//#include "../h/ConsumerProducer_CPP_Sync_API_test.hpp" // zadatak 3., kompletan CPP API sa semaforima, sinhrona promena konteksta

//#include "../h/ThreadSleep_C_API_test.hpp" // thread_sleep test C API
//#include "../test/ConsumerProducer_CPP_API_test.hpp" // zadatak 4. CPP API i asinhrona promena konteksta

void userMain() {
    //Threads_C_API_test(); // zadatak 2., niti C API i sinhrona promena konteksta
    Threads_CPP_API_test(); // zadatak 2., niti CPP API i sinhrona promena konteksta

    //producerConsumer_C_API(); // zadatak 3., kompletan C API sa semaforima, sinhrona promena konteksta
    //producerConsumer_CPP_Sync_API(); // zadatak 3., kompletan CPP API sa semaforima, sinhrona promena konteksta

    //testSleeping(); // thread_sleep test C API
    //ConsumerProducerCPP::testConsumerProducer(); // zadatak 4. CPP API i asinhrona promena konteksta, kompletan test svega

}
int main(){
    init();
    userMain();
//    PeriodicTest* pt = new PeriodicTest(14);
//    pt->start();
//    while (true){}

    return 0;



}