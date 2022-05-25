#include "../h/PCB_List.h"

PCB_List::PCB_List() {
    head = nullptr;
    tail = nullptr;
}

void PCB_List::put(PCB* pcb) {
    pcbnode* tmp = (pcbnode*)mem_alloc(sizeof (pcbnode));
    tmp->PCB = pcb;
    tmp->next = nullptr;
    if(tail == nullptr){
        head = tmp;
        tail = tmp;
        return;
    }
    tail->next = tmp;
    tail = tail->next;
}

PCB *PCB_List::get() {
    if(head == nullptr) return nullptr;
    PCB* get = head->PCB;
    pcbnode* tmp = head;
    if(head->next!= nullptr)head = head->next;
    else{
        head = nullptr;
        tail = nullptr;
    }
    mem_free((void *)tmp);
    return get;
}
