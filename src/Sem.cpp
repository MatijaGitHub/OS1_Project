#include "../h/Sem.h"



Sem::Sem(int init) {
    count = init;
    waiting_PCB = PCB_List();
}
void Sem::wait() {
    //Interrupt::lock();
    if(--count<0)block();
    //Interrupt::unlock();
}

void Sem::signal() {
    //Interrupt::lock();
    if(++count<=0)unblock();
    //Interrupt::unlock();
}

int Sem::value() {
    return count;
}

void Sem::block() {
    waiting_PCB.put(PCB::running);
    PCB::running->setBlocked(true);
    PCB::dispatch();
}

void Sem::unblock() {
    PCB* pcb = waiting_PCB.get();
    pcb->setBlocked(false);
    Scheduler::put(pcb);
}
