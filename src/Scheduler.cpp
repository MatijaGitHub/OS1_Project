#include "../h/Scheduler.h"

PCB* Scheduler::head;
PCB* Scheduler::tail;

void Scheduler::put(PCB *pcb) {
    if(head == nullptr){
        head = pcb;
        tail = pcb;
    }
    else{
        tail->setNext(pcb);
        tail = tail->getNext();
    }
}

PCB *Scheduler::get() {
    if(head== nullptr) return nullptr;
    PCB* pom = head;
    head = head->getNext();
    return pom;
}

Scheduler::Scheduler() {

}

bool Scheduler::moreProcs() {
    return head != nullptr;
}
