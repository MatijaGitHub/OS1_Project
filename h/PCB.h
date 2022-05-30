#pragma once
#include "../lib/hw.h"
#include "../h/syscall_c.h"
#include "../h/Interrupt.h"
#include "../h/Scheduler.h"
#include "../h/MemoryAllocator.h"




class PCB{
public:
    struct Context{
        uint64 ra;
        uint64 sp;
    };
    static PCB_List* sleeping_list;
    using Body = void(*)(void *);
    PCB* getNext();
    void setNext(PCB* next);
    PCB(Body body,void * args,uint64 * stac,uint64 timeSlice);
    static PCB* running;
    void setFinished(bool f);
    bool checkFinished();
    void setSleeping(bool f);
    bool checkSleeping();
    static void dispatch();
    void setArgs(void * arg);
    void* getArgs();
    void start();
    static void* allocatePCB();
    void setContext(uint64 ra, uint64 sp);
    bool checkBlocked();
    void setBlocked(bool f);
    void setId(char id);
    static int id_cnt;
    static uint64 timeLeft;
    uint64 getTimeSlice() const;
    void setTimeSlice(uint64 timeSlice);
    static void sleep(time_t time);


private:
    PCB* next_scheduler;
    uint64 * stack;
    void* args;
    Context context;
    uint64 timeSlice;
    bool finished;
    bool isBlocked;
    bool isSleeping;
    char my_id;
    Body body;
    static void threadWrapper();
    static void contextSwitch(Context* old,Context* new_t);

};



