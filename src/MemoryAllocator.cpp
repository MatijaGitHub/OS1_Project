//
// Created by os on 4/22/22.
//
#include "../h/MemoryAllocator.hpp"

MemoryAllocator* MemoryAllocator::singleton;
FreeShardList* MemoryAllocator::list;

MemoryAllocator::MemoryAllocator() {
    singleton->list = (FreeShardList*)__mem_alloc(sizeof (FreeShardList));
    *singleton->list = FreeShardList();
}

MemoryAllocator* MemoryAllocator::getAllocator() {
    if(singleton == nullptr){
        singleton = (MemoryAllocator*)__mem_alloc(sizeof (MemoryAllocator));
        *singleton = MemoryAllocator();
    }

    return singleton;
}

void *MemoryAllocator::mem_alloc(size_t size) {
    return list->find_best(size);
}

int MemoryAllocator::mem_free(void * mem) {
    return 0;
}

FreeShardList *MemoryAllocator::getList() {
    return list;
}
