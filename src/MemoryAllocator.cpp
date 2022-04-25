//
// Created by os on 4/22/22.
//
#include "../h/MemoryAllocator.hpp"

MemoryAllocator* MemoryAllocator::singleton;
FreeShardList* MemoryAllocator::listFree;


MemoryAllocator::MemoryAllocator() {
    singleton->listFree = (FreeShardList*)__mem_alloc(sizeof (FreeShardList));
    *singleton->listFree = FreeShardList();


}

MemoryAllocator* MemoryAllocator::getAllocator() {
    if(singleton == nullptr){
        singleton = (MemoryAllocator*)__mem_alloc(sizeof (MemoryAllocator));
        *singleton = MemoryAllocator();
    }

    return singleton;
}

void *MemoryAllocator::mem_alloc(size_t size) {
    return listFree->find_best(size);
}

int MemoryAllocator::mem_free(void * mem) {
    return listFree->free_memory(mem);
}

FreeShardList *MemoryAllocator::getList() {
    return listFree;
}
