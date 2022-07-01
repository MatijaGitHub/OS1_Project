//
// Created by os on 4/22/22.
//
#include "../h/MemoryAllocator.h"


void *MemoryAllocator::mem_alloc(size_t size) {
    return FreeShardList::find_best(size);

}

int MemoryAllocator::mem_free(void * mem) {
    return FreeShardList::free_memory(mem);


}

