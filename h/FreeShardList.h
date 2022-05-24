#pragma once
#include "../lib/hw.h"
#include "../lib/mem.h"
#include "../lib/console.h"
#include "../h/syscall_c.h"

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
        int free_memory(void* address);
        void printList();
        void print(unsigned long n);

        };

#ifdef __cplusplus
}
#endif