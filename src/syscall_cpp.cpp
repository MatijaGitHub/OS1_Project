#include "../h/syscall_cpp.h"



Thread::Thread(void (*body)(void *), void *arg) {
    //Interrupt::mc_status(Interrupt::SSTATUS_SIE);
    this->myHandle =(thread_t) new thread_t;
    int res = thread_create(&myHandle,body,arg);
    if(res < 0){
        __putc('!');
        __putc('\n');
    }
    //Interrupt::ms_status(Interrupt::SSTATUS_SIE);
}

int Thread::start() {
    //Interrupt::mc_status(Interrupt::SSTATUS_SIE);
    if(this->myHandle->PCB == nullptr) return -1;
    ((PCB*)this->myHandle->PCB)->start();
    //Interrupt::ms_status(Interrupt::SSTATUS_SIE);
    return 0;
}

void Thread::dispatch() {
    //Interrupt::mc_status(Interrupt::SSTATUS_SIE);
    thread_dispatch();
    //Interrupt::ms_status(Interrupt::SSTATUS_SIE);
}

void* operator new(size_t n){
    //Interrupt::mc_status(Interrupt::SSTATUS_SIE);
    void* ret =  mem_alloc(n);
    //Interrupt::ms_status(Interrupt::SSTATUS_SIE);
    return ret;
}
void* operator new[](size_t n){
    //Interrupt::mc_status(Interrupt::SSTATUS_SIE);
    void* ret =  mem_alloc(n);
    //Interrupt::ms_status(Interrupt::SSTATUS_SIE);
    return ret;
}

void operator delete (void* p) noexcept{
    //Interrupt::mc_status(Interrupt::SSTATUS_SIE);
    mem_free(p);
    //Interrupt::ms_status(Interrupt::SSTATUS_SIE);
}

void operator delete[] (void * p) noexcept{
    //Interrupt::mc_status(Interrupt::SSTATUS_SIE);
    mem_free(p);
    //Interrupt::ms_status(Interrupt::SSTATUS_SIE);
}

Semaphore::Semaphore(unsigned int init) {
    //Interrupt::mc_status(Interrupt::SSTATUS_SIE);
    this->myHandle =(sem_t) new sem_t;
    int res = sem_open(&myHandle,init);
    if(res < 0){
        __putc('!');
        __putc('\n');
    }
    //Interrupt::ms_status(Interrupt::SSTATUS_SIE);
}



int Semaphore::wait() {
    //Interrupt::mc_status(Interrupt::SSTATUS_SIE);
    int res = sem_wait(this->myHandle);
    //Interrupt::ms_status(Interrupt::SSTATUS_SIE);
    return res;
}

int Semaphore::signal() {
    //Interrupt::mc_status(Interrupt::SSTATUS_SIE);
    int res = sem_signal(this->myHandle);
    //Interrupt::ms_status(Interrupt::SSTATUS_SIE);
    return res;
}
