//
// Created by os on 4/22/22.
//

#pragma once
#include "FreeShardList.hpp"
#ifdef __cplusplus
extern "C" {
#endif

class MemoryAllocator{
        private:
        static FreeShardList* listFree;
        static MemoryAllocator* singleton;
        protected:
        MemoryAllocator();
        public:
        void* mem_alloc(size_t size);
        int mem_free(void* mem);
        static MemoryAllocator* getAllocator();
        static FreeShardList* getList();

};

#ifdef __cplusplus
}
#endif

