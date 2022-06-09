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
protected:
            static void allocate_mem(struct node* prev,struct node* here,size_t size);
            static node* head;
            static node* tail;
public:
        static void* find_best(size_t size);
        static int free_memory(void* address);
        static void printList();
        static void print(unsigned long n);

        };


#ifdef __cplusplus
}
#endif