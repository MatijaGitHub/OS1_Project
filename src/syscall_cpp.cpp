#include "../h/syscall_cpp.hpp"



Thread::Thread(void (*body)(void *), void *arg) {
    int res = thread_init(&myHandle,body,arg);
    if(res < 0){
        ::putc('!');
        ::putc('\n');
    }
}
Semaphore::Semaphore(unsigned int init) {
    int res = sem_open(&myHandle,init);
    if(res < 0){
        ::putc('!');
        ::putc('\n');
    }
}

int Thread::start() {
    if(this->myHandle->PCB == nullptr) return -1;
    ((PCB*)this->myHandle->PCB)->start();
    return 0;
}

void Thread::dispatch() {
    thread_dispatch();
}

int Thread::sleep(time_t time) {
    int res = time_sleep(time);
    return res;
}


void wrapper(void *t) {
    if (t) {
        ((Thread *) t)->run();
    }
}
typedef struct {
    PeriodicThread* t;
    time_t time;
} periodicArgs;
void periodicWrapper(void *args){
    time_t times = ((periodicArgs*)args)->time;
    PeriodicThread* threads = (PeriodicThread *) ((periodicArgs*)args)->t;
    if(((periodicArgs*)args)->t){
        while (true){
            threads->periodicActivation();
            Thread::sleep(times);
        }
    }
}

PeriodicThread::PeriodicThread(time_t period) : Thread(&periodicWrapper,new periodicArgs{this,period})  {

}

Thread::Thread() {
    int res = thread_init(&myHandle,&wrapper, this);
    if(res < 0){
        ::putc('!');
        ::putc('\n');
    }
}


Thread::~Thread() {
    delete this->myHandle;
}

void* operator new(size_t n){
    void* ret =  mem_alloc(n);
    return ret;
}
void* operator new[](size_t n){
    void* ret =  mem_alloc(n);
    return ret;
}

void operator delete (void* p) noexcept{
    mem_free(p);
}

void operator delete[] (void * p) noexcept{
    mem_free(p);
}





int Semaphore::wait() {
    int res = sem_wait(this->myHandle);
    return res;
}

int Semaphore::signal() {
    int res = sem_signal(this->myHandle);
    return res;
}


char Console::getc() {
    char c= ::getc();
    return c;
}

void Console::putc(char c) {
    ::putc(c);
}
