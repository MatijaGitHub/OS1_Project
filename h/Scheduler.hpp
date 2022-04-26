#pragma once
#include "../lib/hw.h"
#include "../h/PCB.hpp"
class PCB;
class Scheduler{
public:
    static void put(PCB* pcb);
    static PCB* get();
protected:
    Scheduler();
private:
    static PCB* head;
    static PCB* tail;
};