#include "../h/syscall_c.h"






void* mem_alloc(size_t size){
    size_t sizeB = ((size + ALLOCATED_HEADER_SIZE)/MEM_BLOCK_SIZE);
    if((size + ALLOCATED_HEADER_SIZE)%MEM_BLOCK_SIZE > 0){
        sizeB++;
    }
    struct args arguments;
    arguments.arg1 =(uint64) sizeB;
    struct args* argsP = &arguments;
    void* res = (void*)callSys(0x1,(void*) argsP,1);
    return res;
}

int mem_free(void* adr){
    struct args arguments;
    arguments.arg1 = (uint64) adr;
    struct args* argsP = &arguments;
    int res = (int) callSys(0x2,(void*)argsP,1);
    return res;
}

int thread_create (thread_t* handle, void(*start_routine)(void*), void* arg){
    struct args arguments;
    *handle = (_thread*)mem_alloc(sizeof (_thread));
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

int thread_init (thread_t* handle, void(*start_routine)(void*), void* arg){
    struct args arguments;
    *handle = (_thread*)mem_alloc(sizeof (_thread));
    arguments.arg1 = (uint64) handle;
    arguments.arg2 = (uint64) start_routine;
    arguments.arg3 = (uint64) arg;
    void* adr = mem_alloc(DEFAULT_STACK_SIZE);
    arguments.arg4 = (uint64)adr;
    if(arguments.arg4 == 0) return -2;
    struct args* argsP = &arguments;
    int res = (int) callSys(0x10,(void *)argsP,4);
    return res;
}



int thread_exit(){
    int res = (int) callSys(0x12,0,0);
    if(res == 0) thread_dispatch();
    return res;
}

void thread_dispatch(){
    callSys(0x13,0,0);
}
int sem_open (sem_t* handle,unsigned init){
    struct args arguments;
    *handle = (_sem *)mem_alloc(sizeof (_sem));
    arguments.arg1 = (uint64)handle;
    arguments.arg2 = (uint64)init;
    struct args* argsP = &arguments;
    int res = (int) callSys(0x21,(void *)argsP,2);
    return res;
}
int sem_close (sem_t handle){
    struct args arguments;
    arguments.arg1 = (uint64)handle;
    struct args* argsP = &arguments;
    int res = (int) callSys(0x22,(void *)argsP,1);
    return res;
}
int sem_wait (sem_t id){
    struct args arguments;
    arguments.arg1 = (uint64)id;
    struct args* argsP = &arguments;
    int res = (int) callSys(0x23,(void *)argsP,1);
    return res;
}
int sem_signal (sem_t id){
    struct args arguments;
    arguments.arg1 = (uint64)id;
    struct args* argsP = &arguments;
    int res = (int) callSys(0x24,(void *)argsP,1);
    return res;
}

int time_sleep (time_t time){
    struct args arguments;
    arguments.arg1 = (uint64)time;
    struct args* argsP = &arguments;
    int res = (int) callSys(0x31,(void *)argsP,1);
    return res;
}

char getc (){
    return  (char )callSys(0x41,0,0);
}
void putc (char c){
    struct args arguments;
    arguments.arg1 = (uint64)c;
    struct args* argsP = &arguments;
    callSys(0x42,(void *)argsP,1);

}
