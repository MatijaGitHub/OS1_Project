#include "../h/linked_list.h"


linked_list::linked_list() {
    head = nullptr;
    tail = nullptr;
}

void *linked_list::find_best(size_t size) {
    size_t min_shard_dif = head->size - size;
    void* start_adr = head->mem_free_block;
    node* pom = head;
    while(pom->next!= nullptr){
        pom = pom->next;
        size_t shard_diff = pom->size - size;
        if((shard_diff < min_shard_dif && shard_diff > 0)|| min_shard_dif < 0){
            min_shard_dif = shard_diff;
            start_adr = pom->mem_free_block;
        }
    }
    if(min_shard_dif > 0) return start_adr;
    else return nullptr;
}