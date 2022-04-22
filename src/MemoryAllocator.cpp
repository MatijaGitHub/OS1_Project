//
// Created by os on 4/22/22.
//
#include "../h/MemoryAllocator.h"


MemoryAllocator::MemoryAllocator() {
    list = linked_list();
}

MemoryAllocator* MemoryAllocator::getAllocator() {
    if(singleton == nullptr){
        *singleton = MemoryAllocator();
    }

    return singleton;
}

void *MemoryAllocator::mem_alloc(size_t size) {
    return list.find_best(size);
}

int MemoryAllocator::mem_free(void *) {
    return 0;
}
