#include "../h/Scheduler.h"


PCB* Scheduler::head = nullptr;
PCB* Scheduler::tail = nullptr;

void Scheduler::put(PCB *pcb) {
    if(head == nullptr){
        head = pcb;
        head->setNext(nullptr);
        tail = pcb;
        tail->setNext(nullptr);
    }
    else{
        tail->setNext(pcb);
        tail = tail->getNext();
        tail->setNext(nullptr);
    }
}

PCB *Scheduler::get() {
    if(head== nullptr) return nullptr;
    PCB* pom = head;
    if(head->getNext() == nullptr){
        head = nullptr;
        tail = nullptr;
    } else {
        head = head->getNext();
    }
    pom->setNext(nullptr);
    return pom;
}

Scheduler::Scheduler() {

}

bool Scheduler::moreProcs() {
    return head != nullptr;
}
