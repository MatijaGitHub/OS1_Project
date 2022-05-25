#pragma once
#include "./PCB_List.h"
#ifdef __cplusplus
extern "C" {
#endif

class Sem{
private:
    int count;
    PCB_List waiting_PCB;
public:
    Sem(int init);
    void wait();
    void signal();
    int value();
protected:
    void block();
    void unblock();

};


#ifdef __cplusplus
}
#endif