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
class linked_list
        {
        private:
                node *head,*tail;

        public:
        linked_list();
        void* find_best(size_t size);
        };

#ifdef __cplusplus
}
#endif