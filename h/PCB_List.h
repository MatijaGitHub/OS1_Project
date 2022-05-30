#pragma once
#include "../lib/hw.h"



#ifdef __cplusplus
extern "C" {
#endif
class PCB;
struct pcbnode
{
    PCB* PCB;
    time_t timeLeft;
    struct pcbnode*next;

};
class PCB_List
{
private:
    struct pcbnode *head,*tail;
public:
    PCB_List();
    void put(PCB* pcb);
    PCB* get();
    void putTime(PCB* pcb,time_t timeLeft);
    time_t getTimeLeft();
    void decTime();





};

#ifdef __cplusplus
}
#endif