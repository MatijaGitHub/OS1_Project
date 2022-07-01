#pragma once
#include "../h/MemoryAllocator.h"
#include "../h/PCB_List.h"

#ifdef __cplusplus
extern "C" {
#endif
class Sem{
private:
    int count;
    PCB_List* waiting_PCB;
public:
    static void* allocateSem();
    Sem(int init);
    ~Sem();
    void wait();
    void signal();
    int value();
    void deblockAll();
protected:
    void block();
    void unblock();

};


#ifdef __cplusplus
}
#endif