//
// Created by os on 4/22/22.
//

#ifndef PROJECT_BASE_V1_0_MEMORYALLOCATOR_H
#define PROJECT_BASE_V1_0_MEMORYALLOCATOR_H
#include "linked_list.h"
#ifdef __cplusplus
extern "C" {
#endif
class MemoryAllocator{
        private:
        linked_list list;
        static MemoryAllocator* singleton;
        protected:
        MemoryAllocator();
        public:
        void* mem_alloc(size_t size);
        int mem_free(void*);
        static inline MemoryAllocator* getAllocator();

};
#ifdef __cplusplus
}
#endif
#endif //PROJECT_BASE_V1_0_MEMORYALLOCATOR_H
