//
// Created by os on 4/22/22.
//

#pragma once
#include "FreeShardList.h"
#ifdef __cplusplus
extern "C" {
#endif

class MemoryAllocator{
        public:
        static void* mem_alloc(size_t size);
        static int mem_free(void* mem);

};

#ifdef __cplusplus
}
#endif

