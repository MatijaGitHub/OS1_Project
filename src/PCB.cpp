#include "../h/PCB.h"

PCB* PCB::running = nullptr;
uint64 PCB::timeLeft = 0;
int PCB::id_cnt = 0;

PCB *PCB::getNext() {
    return this->next_scheduler;
}

void PCB::setNext(PCB *next) {
    this->next_scheduler = next;
}

PCB::PCB(Body body,void* args,uint64 * stac,uint64 timeSlice) {
    next_scheduler = nullptr;
    stack = stac;
    context.ra = (uint64) &threadWrapper;
    context.sp = (uint64) &stack[DEFAULT_STACK_SIZE];
    this->body = body;
    this->timeSlice = timeSlice;
    this->args = args;
    finished = false;
    isBlocked = false;


}

void PCB::threadWrapper() {
    Interrupt::popSppSpie();
    void* args = running->getArgs();
    running->body(args);
    thread_exit();

}

void PCB::setFinished(bool f) {
    finished = f;
}

bool PCB::checkFinished() {
    return finished;
}

void PCB::dispatch() {
    PCB* old = running;
    if(!old->checkFinished()&&!old->checkBlocked())Scheduler::put(old);
    running = Scheduler::get();
    contextSwitch(&old->context,&running->context);

}

void PCB::setArgs(void *arg) {
    this->args = arg;
}

void *PCB::getArgs() {
    return this->args;
}

void PCB::start() {
    if(running == nullptr) {
        running = this;
        running->setId('m');
    }
    else {
        Scheduler::put(this);
        this->setId('0' + PCB::id_cnt++);
    }
}

void *PCB::allocatePCB() {
    uint64 size = sizeof (PCB) + ALLOCATED_HEADER_SIZE;
    uint64 inBlocks = size/MEM_BLOCK_SIZE;
    if(size%MEM_BLOCK_SIZE!=0){
        inBlocks++;
    }
    inBlocks*=MEM_BLOCK_SIZE;
    MemoryAllocator* mem = MemoryAllocator::getAllocator();
    void* retAdr = mem->mem_alloc((size_t) inBlocks);
    long* header = (long*) retAdr;
    inBlocks/=MEM_BLOCK_SIZE;
    *header = inBlocks;
    header++;
    void* ret = (void*)header;
    return ret;
}

void PCB::setContext(uint64 ra, uint64 sp) {
    this->context.ra = ra;
    this->context.sp = sp;
}

bool PCB::checkBlocked() {
    return isBlocked;
}

void PCB::setBlocked(bool f) {
    isBlocked = f;
}

void PCB::setId(char id) {
    this->my_id = id;
}



uint64 PCB::getTimeSlice() const {
    return timeSlice;
}

void PCB::setTimeSlice(uint64 timeSlice) {
    PCB::timeSlice = timeSlice;
}


