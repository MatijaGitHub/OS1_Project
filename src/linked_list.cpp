#include "../h/linked_list.h"


linked_list::linked_list() {
    node beg;
    beg.next = nullptr;
    beg.mem_free_block =(void*)HEAP_START_ADDR;
    beg.size = (size_t)HEAP_END_ADDR-(size_t)HEAP_START_ADDR;
    *head = beg;
    *tail = beg;
}

void *linked_list::find_best(size_t size) {
    size_t min_shard_dif = head->size - size;
    void* start_adr = head->mem_free_block;
    node* toReplace = head;
    node* pom = head;
    node* prev = nullptr;
    node* prevReplace = nullptr;
    while(pom->next!= nullptr){
        prev = pom;
        pom = pom->next;
        size_t shard_diff = pom->size - size;
        if((shard_diff < min_shard_dif && shard_diff >= 0)|| min_shard_dif < 0){
            min_shard_dif = shard_diff;
            start_adr = pom->mem_free_block;
            toReplace = pom;
            prevReplace = prev;
        }
    }
    if(min_shard_dif >= 0) {

        this->allocate_mem(prevReplace,toReplace,size);
        return start_adr;
    }
    return nullptr;
}


void linked_list::allocate_mem(struct node* prev,struct node *here, size_t size) {
    if(here->size == size){
        if(prev == nullptr){
            head = head->next;
        }
        else if(here->next == nullptr){
            tail = prev;
            tail->next = nullptr;
        }
        else{
            prev->next = here->next;
        }
    }
    else{
        here->size-=size;
        here->mem_free_block = (void*)((size_t)here->mem_free_block + size);
    }
}


