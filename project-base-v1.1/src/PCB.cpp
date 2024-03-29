#include "../h/PCB.h"

PCB* PCB::running = nullptr;
uint64 PCB::timeLeft = 0;
PCB_List* PCB::sleeping_list = nullptr;
int PCB::id_cnt = 0;
bool PCB::isMain = true;
bool PCB::isPeriodicBlocked = false;
PCB_List* PCB::perioThreads = nullptr;


PCB *PCB::getNext() {
    return this->next_scheduler;
}

void PCB::setNext(PCB *next) {
    this->next_scheduler = next;
}

PCB::PCB(Body body,void* args,uint64 * stac,uint64 timeSlice) {
    next_scheduler = nullptr;
    stack = stac;
    context.sp = (uint64) &stack[DEFAULT_STACK_SIZE * 2];
    context.ra = (uint64) &threadWrapper;
    this->body = body;
    this->isPeriodic = false;
    this->timeSlice = timeSlice;
    this->args = args;
    finished = false;
    isBlocked = false;
    isSleeping = false;
    unblockError = false;


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
    if(old->isPeriodic && PCB::isPeriodicBlocked) {
        PCB::perioThreads->put(old);
    }
    else if(!old->checkFinished()&&!old->checkBlocked()&&!old->checkSleeping())Scheduler::put(old);
    running = Scheduler::get();
    if(running->my_id == '0') ms_status(Interrupt::SSTATUS_SPP);
    else mc_status(Interrupt::SSTATUS_SPP);
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
        this->setId('0' + PCB::id_cnt++);
        Scheduler::put(this);

    }
}

void *PCB::allocatePCB() {
    uint64 size = sizeof (PCB) + ALLOCATED_HEADER_SIZE;
    uint64 inBlocks = size/MEM_BLOCK_SIZE;
    if(size%MEM_BLOCK_SIZE!=0){
        inBlocks++;
    }
    inBlocks*=MEM_BLOCK_SIZE;
    void* retAdr = MemoryAllocator::mem_alloc((size_t) inBlocks);
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

void PCB::sleep(time_t time) {
    PCB::sleeping_list->putTime(running,time);
    running->setSleeping(true);
    //PCB::dispatch();
}

void PCB::setSleeping(bool f) {
    isSleeping = f;
}

bool PCB::checkSleeping() {
    return isSleeping;
}

uint64 *PCB::allocateSystemStack() {
    uint64 size = DEFAULT_STACK_SIZE;
    size_t sizeB = ((size + ALLOCATED_HEADER_SIZE)/MEM_BLOCK_SIZE);
    if((size + ALLOCATED_HEADER_SIZE)%MEM_BLOCK_SIZE > 0){
        sizeB++;
    }
    sizeB*=MEM_BLOCK_SIZE;
    void* retAdr = MemoryAllocator::mem_alloc((size_t) sizeB);
    long* header = (long*) retAdr;
    sizeB/=MEM_BLOCK_SIZE;
    *header = sizeB;
    header++;
    return (uint64 *)header;
}

uint64 PCB::getSSP() {
    return this->context.ssp;
}

uint64 PCB::getSP() {
    return this->context.sp;
}

void PCB::setSSP(uint64 ssp) {
    this->context.ssp = ssp;
}

void PCB::setSP(uint64 sp) {
    this->context.sp = sp;
}

inline void PCB::ms_status(uint64 mask) {
    __asm__ volatile("csrs sstatus, %[mask]" : : [mask]"r"(mask));
}
inline void PCB::mc_status(uint64 mask) {
    __asm__ volatile("csrc sstatus, %[mask]" : : [mask]"r"(mask));
}



