#include "../h/syscall_c.h"
#include "../h/abi.h"
#include "../lib/hw.h"



void* mem_alloc(size_t size){
    uint64 sizeB = (uint64)(size/MEM_BLOCK_SIZE);
    if(size%MEM_BLOCK_SIZE > 0){
        sizeB++;
    }
    struct args arguments;
    arguments.arg1 =(uint64) sizeB;
    struct args* argsP = &arguments;
    void* res = (void*)callSys(1,(void*) argsP,1);
    return res;
}

int mem_free(void* adr){
    return 0;
}