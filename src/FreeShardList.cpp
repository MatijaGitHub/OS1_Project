#include "../h/FreeShardList.h"

node* FreeShardList::head = nullptr;
node* FreeShardList::tail = nullptr;

void *FreeShardList::find_best(size_t size) {
    if(tail == nullptr){
        head = (node*)HEAP_START_ADDR;
        head->next = nullptr;
        head->mem_free_block = head;
        head->size = (size_t)HEAP_END_ADDR-(size_t)HEAP_START_ADDR;
        tail= head;
    }
    if((long)size < 0) return nullptr;

    long min_shard_dif = head->size  - size;
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

        allocate_mem(prevReplace,toReplace,size);

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
            //here->next = nullptr;

        }
    }
    else{
        size_t prevSize = here->size;
        void* prevMemBlock = here->mem_free_block;
        struct node* prevNext = here->next;
        here = (node*)((size_t )here->mem_free_block + size);
        here->size = prevSize-size;
        here->mem_free_block = (void*)((size_t)prevMemBlock+size);
        here->next = prevNext;
        if(prev == nullptr) head = here;
        else{
            prev->next = here;
        }
        if(here->next == nullptr) tail = here;
    }
}

void FreeShardList::printList() {
    node* pom = head;
    while(pom!= nullptr){
        print((unsigned long )pom->size);

        pom = pom->next;
    }
    putc('\n');
}

void FreeShardList::print(unsigned long n){
    // If number is smaller than 0, put a - sign
    // and change number to positive
    if (n < 0) {
        putc('-');
        n = -n;
    }

    // Remove the last digit and recur
    if (n/10)
        print(n/10);

    // Print the last digit
    putc(n%10 + '0');
}

int FreeShardList::free_memory(void *address) {

    int result = 0;
    void* adrStart = (void*)((long*)address - 1);
    if(adrStart < HEAP_START_ADDR || adrStart> HEAP_END_ADDR) return -1;
    size_t size = MEM_BLOCK_SIZE* (*(long*)adrStart);
    node* prev = nullptr;
    node* curr = head;
    if((void*)curr == adrStart) return -3;
    while(adrStart > curr->mem_free_block && curr->next != nullptr) {
        if((void*)curr == adrStart) return -3;
        prev = curr;
        curr = curr->next;
    }
    if(adrStart < curr->mem_free_block) {
        if (prev == nullptr) {
            if ( (uint64)adrStart + (uint64)size ==  (uint64)curr->mem_free_block) {
                node *newHead = (node *) adrStart;
                newHead->size = curr->size + size;
                newHead->next = curr->next;
                newHead->mem_free_block = (void *) newHead;
                head = newHead;
            } else {
                node *newHead = (node *) adrStart;
                newHead->size = size;
                newHead->next = curr;
                newHead->mem_free_block = (void *) newHead;
                head = newHead;
            }
        } else {
            if ((uint64)adrStart < (uint64)prev->mem_free_block + (uint64)prev->size) result = -2;
            else if ((uint64)adrStart == (uint64)prev->mem_free_block + (uint64)prev->size &&
                    (uint64)curr->mem_free_block > (uint64)adrStart + (uint64)size) {
                prev->size += size;
            } else if ((uint64)adrStart == (uint64)prev->mem_free_block + (uint64)prev->size &&
                    (uint64)curr->mem_free_block == (uint64)adrStart + (uint64)size) {
                prev->next = curr->next;
                prev->size = prev->size + curr->size + size;
            } else if ((uint64)adrStart + (uint64)size == (uint64)curr->mem_free_block) {
                node *newNode = (node *) adrStart;
                newNode->next = curr->next;
                newNode->size = size + curr->size;
                newNode->mem_free_block = (void *) newNode;
                prev->next = newNode;
            } else {
                node *newNode = (node *) adrStart;
                newNode->size = size;
                newNode->mem_free_block = (void *) newNode;
                newNode->next = curr;
                prev->next = newNode;
            }
        }
    }
    else{
        if((uint64)curr->mem_free_block + (uint64)curr->size == (uint64)adrStart){
            curr->size+=size;

        }
        else if((uint64)curr->mem_free_block + curr->size > (uint64)adrStart) return -4;
        else{
            node* newTail = (node*)adrStart;
            newTail->next = nullptr;
            newTail->size = size;
            newTail->mem_free_block =(void*)newTail;
            curr->next = newTail;
            tail = newTail;
        }
    }
    return result;
}


long FreeShardList::toSigned(unsigned long x)
{
    if (x <= 2147483647)
        return static_cast<long>(x);

    if (x >= 2147483648)
        return static_cast<long>(x - 2147483648) + 2147483648;

    return -1;
}

