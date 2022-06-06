#ifndef _syscall_cpp
#define _syscall_cpp
#include "syscall_c.h"
#include "../lib/console.h"
#include "../h/PCB.h"

//void* ::operator new (size_t n);
//void ::operator delete (void* p);
void wrapper(void *t);
void periodicWrapper(void *t);
class Thread {
public:

    friend void wrapper(void * t);
    Thread (void (*body)(void*), void* arg);
    virtual ~Thread ();

    static void dispatch();
    static int sleep (time_t);

    int start ();

protected:
    virtual void run () {}

    Thread ();

private:
    thread_t myHandle;
};

class Semaphore {
public:
    Semaphore (unsigned init = 1);
    //virtual ~Semaphore ();
    int wait ();
    int signal ();
private:
    sem_t myHandle;
};


class PeriodicThread : public Thread {
public:
    friend void periodicWrapper(void * t);
protected:
    PeriodicThread (time_t period);
    virtual void periodicActivation () {}
};
/*class Console {
public:
    static char getc ();
    static void putc (char);
};*/

#endif