#pragma once
#include "../lib/hw.h"
#include "../h/PCB.h"
class PCB;
class Scheduler{
public:
    static void put(PCB* pcb);
    static PCB* get();
    static bool moreProcs();
protected:
    Scheduler();
private:
    static PCB* head;
    static PCB* tail;
};