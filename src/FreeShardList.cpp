#include "../h/FreeShardList.hpp"



FreeShardList::FreeShardList() {

    node* beg =(node*) HEAP_START_ADDR;
    //node* beg = allocate_mem((uint64)sizeof (node));
    beg->next = nullptr;
    beg->mem_free_block =(void*)HEAP_START_ADDR;
    beg->size = (size_t)HEAP_END_ADDR-(size_t)HEAP_START_ADDR;
    head = beg;
    tail = beg;
}


void *FreeShardList::find_best(size_t size) {
    long min_shard_dif = head->size - size;
    void* start_adr = head->mem_free_block;
    node* toReplace = head;
    node* pom = head;
    node* prev = nullptr;
    node* prevReplace = nullptr;
    while(pom->next!= nullptr){
        prev = pom;
        pom = pom->next;
        long shard_diff = pom->size - size;
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


void FreeShardList::allocate_mem(struct node* prev, struct node *here, size_t size) {
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
            here->next = nullptr;

        }
    }
    else{
        size_t prevSize = here->size;
        void* prevMemBlock = here->mem_free_block;
        struct node* prevNext = here->next;
        here = (node*)((size_t)here->mem_free_block + size);
        here->size = prevSize-size;
        here->mem_free_block = (void*)((size_t)prevMemBlock+size);
        here->next = prevNext;
        if(prev == nullptr) head = here;
        else if(here->next == nullptr) tail = here;
    }
}

void FreeShardList::printList() {
    node* pom = head;
    while(pom!= nullptr){
        print((unsigned long )pom->size);

        pom = pom->next;
    }
    __putc('\n');
}

void FreeShardList::print(unsigned long n){
    // If number is smaller than 0, put a - sign
    // and change number to positive
    if (n < 0) {
        __putc('-');
        n = -n;
    }

    // Remove the last digit and recur
    if (n/10)
        print(n/10);

    // Print the last digit
    __putc(n%10 + '0');
}

int FreeShardList::free_memory(void *address) {
    return 0;
}


