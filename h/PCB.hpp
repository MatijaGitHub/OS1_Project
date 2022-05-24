#pragma once
#include "../lib/hw.h"
#include "../h/syscall_c.h"
#include "../h/Interrupt.hpp"
#include "../h/Scheduler.hpp"



class PCB{
public:
    struct Context{
        uint64 ra;
        uint64 sp;
    };
    using Body = void(*)();
    PCB* getNext();
    void setNext(PCB* next);
    PCB(Body body, uint64 timeSlice);
    static PCB* running;
    void setFinished(bool f);
    bool checkFinished();
    static void dispatch();
    static void contextSwitch(Context * old, Context* newRunning);

private:
    PCB* next_scheduler;
    uint64 * stack;

    Context context;
    uint64 timeSlice;
    static uint64 timeLeft;
    bool finished;

    Body body;
    static void threadWrapper();

};



