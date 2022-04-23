#pragma once
#include "../lib/hw.h"

#ifdef __cplusplus
extern "C" {
#endif


class Interrupt
{
private:



public:
    enum BitMaskStatus{
        SSTATUS_SIE = (1 << 1),
        SSTATUS_SPIE = (1 << 5),
        SSTATUS_SPP = (1 << 8),
    };
    static void callRoutine();
    static void doSomething();
    static void w_stvec(uint64 stvec);
    static  uint64 r_stvec();
    static  void w_status(uint64 sstatus);
    static  uint64 r_status();
    static void w_scause(uint64 scause);
    static uint64 r_scause();
    static void ms_status(uint64 mask);
    static void w_sepc(uint64 sepc);
    static uint64 r_sepc();
};




#ifdef __cplusplus
}
#endif
