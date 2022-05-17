#pragma once
#include "../lib/hw.h"
#include "../h/syscall_c.h"
#include "../h/Interrupt.h"
#include "../h/Scheduler.h"



class PCB{
public:
    struct Context{
        uint64 ra;
        uint64 sp;
    };
    using Body = void(*)(void *);
    PCB* getNext();
    void setNext(PCB* next);
    PCB(Body body,void * args,uint64 * stac,uint64 timeSlice);
    static PCB* running;
    void setFinished(bool f);
    bool checkFinished();
    static void dispatch();
    void setArgs(void * arg);
    void* getArgs();
    void start();
    static void* allocatePCB();


private:
    PCB* next_scheduler;
    uint64 * stack;
    void* args;
    Context context;
    uint64 timeSlice;
    static uint64 timeLeft;
    bool finished;

    Body body;
    static void threadWrapper();
    static void contextSwitch(Context* old,Context* new_t);

};



