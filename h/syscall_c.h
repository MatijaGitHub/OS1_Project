#pragma once
#include "../lib/hw.h"
#include "../h/abi.h"


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
int thread_init (
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
int sem_close (sem_t handle);
int sem_wait (sem_t id);
int sem_signal (sem_t id);
int time_sleep (time_t);

const int EOF = -1;
char getc ();
void putc (char);
#ifdef __cplusplus
}
#endif