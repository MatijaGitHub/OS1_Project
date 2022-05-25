#pragma once
#include "../lib/hw.h"


#ifdef __cplusplus
    extern "C" {
#endif


static const size_t ALLOCATED_HEADER_SIZE = 8;

struct args
{
    uint64 arg1;
    uint64 arg2;
    uint64 arg3;
    uint64 arg4;

};
void* mem_alloc(size_t size);
int mem_free(void* adr);

typedef struct{
    void* PCB;
} _thread;

typedef _thread* thread_t;
int thread_create (
        thread_t* handle,
        void(*start_routine)(void*),
        void* arg
);
int thread_exit();

void thread_dispatch();

typedef struct {
    void* Sem;
}_sem;

typedef _sem* sem_t;

int sem_open (
        sem_t* handle,
        unsigned init
);
#ifdef __cplusplus
}
#endif