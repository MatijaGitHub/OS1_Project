#include "../lib/hw.h"
#include "../h/Interrupt.h"
#include "../h/syscall_cpp.hpp"
#include "../h/Cons.hpp"
#include "../h/Sem.h"


typedef struct {
    char c;
}Arguments;

class PrintP : public PeriodicThread{

public:
    PrintP(time_t time) : PeriodicThread(time){}
    void periodicActivation () {
        Console::putc('A');
        Console::putc(' ');
    }
};
class PrintA : public PeriodicThread{

public:
    PrintA(time_t time) : PeriodicThread(time){}
    void periodicActivation () {
        Console::putc('B');
        Console::putc(' ');
    }
};
void medium(void* args){
    while (true){
       Thread::dispatch();
    }
}

void init(){
    Interrupt::w_stvec((uint64) &Interrupt::callRoutine);
    Thread* startThread = new Thread(&medium, nullptr);
    startThread->start();
    PCB::sleeping_list = new PCB_List();
    PCB::perioThreads = new PCB_List();
    PutCharThread* putCharThread =new PutCharThread();
    GetCharThread* getCharThread = new GetCharThread();
    Cons::outputBuffer = new CharBuffer(128 * sizeof (char));
    Cons::inputBuffer = new CharBuffer(128 * sizeof (char));

    putCharThread->start();
    getCharThread->start();

    //Interrupt::userMaskSoft();
    switchToUserMode();
}
void dest(){
    while (Cons::outputBuffer->getSize() > 0){Thread::dispatch();}

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
//COMPLETED
int main(){
    init();
    //userMain();
    PrintP *thread = new PrintP(30);
    PrintA *thread1 = new PrintA(5);
    thread->start();
    thread1->start();
    while (true){
        char c = Console::getc();
        if(c == 103) {
            block_All_Periodic();
        }
    }
    dest();
    return 0;
}