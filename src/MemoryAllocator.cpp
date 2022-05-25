//
// Created by os on 4/22/22.
//
#include "../h/MemoryAllocator.h"

MemoryAllocator* MemoryAllocator::singleton;
FreeShardList* MemoryAllocator::listFree;


MemoryAllocator::MemoryAllocator() {
    FreeShardList list = FreeShardList();
    singleton->listFree = &list;
    //*singleton->listFree = FreeShardList();
}

MemoryAllocator* MemoryAllocator::getAllocator() {
    if(singleton == nullptr){
        MemoryAllocator mem = MemoryAllocator();
        singleton = &mem;
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
