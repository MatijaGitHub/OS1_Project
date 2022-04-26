#include "../h/PCB.hpp"

PCB* PCB::running = nullptr;
uint64 PCB::timeLeft = 0;

PCB *PCB::getNext() {
    return this->next_scheduler;
}

void PCB::setNext(PCB *next) {
    this->next_scheduler = next;
}

PCB::PCB(Body body,uint64 timeSlice) {
    next_scheduler = nullptr;
    stack = (uint64*) mem_alloc(DEFAULT_STACK_SIZE);
    context.ra = (uint64) &threadWrapper;
    context.sp = (uint64) &stack[DEFAULT_STACK_SIZE];
    this->body = body;
    this->timeSlice = timeSlice;

    finished = false;


}

void PCB::threadWrapper() {
    Interrupt::popSppSpie();
    running->body();
    running->setFinished(true);

}

void PCB::setFinished(bool f) {
    finished = f;
}

bool PCB::checkFinished() {
    return finished;
}

void PCB::dispatch() {
    PCB* old = running;
    if(!old->checkFinished())Scheduler::put(old);
    running = Scheduler::get();
    contextSwitch(&old->context,&running->context);

}


