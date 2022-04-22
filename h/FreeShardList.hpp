#pragma once
#include "../lib/hw.h"

#ifdef __cplusplus
extern "C" {
#endif

struct node
{
     void* mem_free_block;
     size_t size;
     struct node *next;
};
class FreeShardList
        {
        private:
                node *head,*tail;
protected:

        void allocate_mem(struct node* prev,struct node* here,size_t size);
        public:
        FreeShardList();
        void* find_best(size_t size);

        };

#ifdef __cplusplus
}
#endif