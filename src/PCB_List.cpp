#include "../h/PCB_List.h"
#include "../h/MemoryAllocator.h"

PCB_List::PCB_List() {
    head = nullptr;
    tail = nullptr;
}

void PCB_List::put(PCB* pcb) {
    pcbnode* tmp = (pcbnode*)mem_alloc(sizeof (pcbnode));
    //pcbnode* tmp = (pcbnode*)mem_alloc(sizeof (pcbnode));
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
    //pcbnode* tmp = head;
    if(head->next!= nullptr)head = head->next;
    else{
        head = nullptr;
        tail = nullptr;
    }
    //mem_free((void *)tmp);
    //MemoryAllocator::getAllocator()->mem_free((void *)tmp);
    return get;
}

void PCB_List::putTime(PCB *pcb, time_t timeLeft) {
    pcbnode* tmp = (pcbnode*)MemoryAllocator::getAllocator()->mem_alloc(sizeof (pcbnode));
    tmp->next = nullptr;
    tmp->PCB = pcb;
    tmp->timeLeft =timeLeft;
    if(head == nullptr){
        head = tmp;
        tail = tmp;
        return;
    }
    pcbnode* curr = head;
    pcbnode* prev = nullptr;
    time_t time = curr->timeLeft;
    while (time < timeLeft && curr->next != nullptr){
        prev = curr;
        curr = curr->next;
        time+=curr->timeLeft;
    }
    if(prev == nullptr){
        if(time < timeLeft){
            tmp->next = head->next;
            head->next = tmp;
            tmp->timeLeft = timeLeft - time;
            return;
        } else{
            tmp->timeLeft = timeLeft;
            tmp->next = head;
            head->timeLeft -= timeLeft;
            head =tmp;
            return;
        }
    }else if(curr->next == nullptr){
        if(time <= timeLeft){
            curr->next = tmp;
            tmp->next = nullptr;
            tmp->timeLeft = timeLeft - time;
            tail = tmp;
            return;
        } else{
            tmp->next = curr;
            prev->next = tmp;
            tmp->timeLeft = timeLeft - time;
            curr->timeLeft-=tmp->timeLeft;
            return;
        }
    } else{
        tmp->next = curr;
        prev->next = tmp;
        tmp->timeLeft = timeLeft - time;
        curr->timeLeft-=tmp->timeLeft;
        return;
    }
}

time_t PCB_List::getTimeLeft() {
    if(head == nullptr){
        return -1;
    } else{
        return head->timeLeft;
    }
}

void PCB_List::decTime() {
    if(head!= nullptr && head->timeLeft > 0){
        head->timeLeft--;
    }
}
