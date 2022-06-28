#pragma once
#include "../lib/hw.h"
#include "../h/Sem.h"
#include "../lib/console.h"
#include "../h/MemoryAllocator.h"
#include "../h/PCB.h"
#include "../h/syscall_c.h"

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
    enum BitMaskSip{
        SIP_SSIP = (1 << 1),
        SIP_STIP = (1 << 5),
        SIP_SEIP = (1 << 9),
    };
    static void disable_sintr();
    static void enable_sintr();
    static int lock_var;
    static void lock();
    static void unlock();
    static void callRoutine();
    static void handleSysCall();
    static void w_stvec(uint64 stvec);
    static void w_stveci(uint64 stvec);
    static  uint64 r_stvec();
    static  uint64 r_stveci();
    static  void w_status(uint64 sstatus);
    static  void w_statusi(uint64 sstatus);
    static  uint64 r_status();
    static  uint64 r_statusi();
    static void w_scause(uint64 scause);
    static void w_scausei(uint64 scause);
    static uint64 r_scause();
    static uint64 r_scausei();
    static void ms_status(uint64 mask);
    static void mc_status(uint64 mask);
    static void us_status(uint64 mask);
    static void w_sepc(uint64 sepc);
    static void w_sepci(uint64 sepc);
    static uint64 r_sepc();
    static uint64 r_sepci();
    static void popSppSpie();
    static void mc_sip(uint64 mask);
    static uint64 prevSstatus;
    static void userMaskSoft();
    static void userMaskHard();
    static void userUnmaskSoft();
    static void userUnmaskHard();
//    static void ms_sstatus(uint64 mask);

    static void callSys(uint64 opCode);
};






#ifdef __cplusplus
}
#endif
