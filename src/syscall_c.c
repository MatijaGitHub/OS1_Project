#include "../h/syscall_c.h"
#include "../h/abi.h"
#include "../lib/hw.h"




void* mem_alloc(size_t size){
    size_t sizeB = ((size + ALLOCATED_HEADER_SIZE)/MEM_BLOCK_SIZE);
    if((size + ALLOCATED_HEADER_SIZE)%MEM_BLOCK_SIZE > 0){
        sizeB++;
    }
    struct args arguments;
    arguments.arg1 =(uint64) sizeB;
    struct args* argsP = &arguments;
    void* res = (void*)callSys(1,(void*) argsP,1);
    return res;
}

int mem_free(void* adr){
    struct args arguments;
    arguments.arg1 = (uint64) adr;
    struct args* argsP = &arguments;
    int res = (int) callSys(2,(void*)argsP,1);
    return res;
}

int thread_create (thread_t* handle, void(*start_routine)(void*), void* arg){
    struct args arguments;
    arguments.arg1 = (uint64) handle;
    arguments.arg2 = (uint64) start_routine;
    arguments.arg3 = (uint64) arg;
    void* adr = mem_alloc(DEFAULT_STACK_SIZE);
    arguments.arg4 = (uint64)adr;
    if(arguments.arg4 == 0) return -2;
    struct args* argsP = &arguments;
    int res = (int) callSys(0x11,(void *)argsP,4);
    return res;
}