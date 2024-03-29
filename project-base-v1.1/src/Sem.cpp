#include "../h/Sem.h"
#include "../h/PCB.h"


PCB_List* allocateList(){
    uint64 size = sizeof (PCB_List) + ALLOCATED_HEADER_SIZE;
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
    return (PCB_List*)ret;
}

Sem::Sem(int init) {
    count = init;
    waiting_PCB =allocateList();
    waiting_PCB->setNull();
}
void Sem::wait() {
//    Interrupt::lock();
    if(--count<0)block();
//    Interrupt::unlock();
}

void Sem::signal() {
//    Interrupt::lock();
    if(++count<=0)unblock();
//    Interrupt::unlock();
}

int Sem::value() {
    return count;
}

void Sem::block() {
    waiting_PCB->put(PCB::running);
    PCB::running->setBlocked(true);
    PCB::timeLeft = 0;
    PCB::dispatch();
}

void Sem::unblock() {
    PCB* pcb = waiting_PCB->get();
    if(pcb == nullptr) return;
    pcb->setBlocked(false);
    pcb->unblockError = false;
    Scheduler::put(pcb);
    //PCB::dispatch();
}

void *Sem::allocateSem() {
    uint64 size = sizeof (Sem) + ALLOCATED_HEADER_SIZE;
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

void Sem::deblockAll() {
    PCB* pcb;
    while((pcb = waiting_PCB->get())!= nullptr){
        pcb->setBlocked(false);
        pcb->unblockError = true;
        Scheduler::put(pcb);
    }
}
