#include "../h/abi.h"



uint64 callSys(int op, void* args, int argLen){
    uint64 opReg = (uint64) op;
    uint64* argsReg = (uint64*)args;

    if(argLen == 1){
        uint64 arg1 = argsReg[0];
        __asm__ volatile("mv a1,%0": :"r"(arg1));
    }
    else if(argLen == 2){
        uint64 arg1 = argsReg[0];
        uint64 arg2 = argsReg[1];
        __asm__ volatile("mv a1,%0": :"r"(arg1));
        __asm__ volatile("mv a2,%0": :"r"(arg2));
    }
    else if(argLen == 3){
        uint64 arg1 = argsReg[0];
        uint64 arg2 = argsReg[1];
        uint64 arg3 = argsReg[2];
        __asm__ volatile("mv a1,%0": :"r"(arg1));
        __asm__ volatile("mv a2,%0": :"r"(arg2));
        __asm__ volatile("mv a3,%0": :"r"(arg3));
    }
    else if(argLen == 4){
        uint64 arg1 = argsReg[0];
        uint64 arg2 = argsReg[1];
        uint64 arg3 = argsReg[2];
        uint64 arg4 = argsReg[3];
        __asm__ volatile("mv a1,%0": :"r"(arg1));
        __asm__ volatile("mv a2,%0": :"r"(arg2));
        __asm__ volatile("mv a6,%0": :"r"(arg3));
        __asm__ volatile("mv a7,%0": :"r"(arg4));
    }
    __asm__ volatile("mv a0,%0": :"r"(opReg));
    __asm__ volatile("ecall");

    uint64 res;
    __asm__ volatile("mv %0,a0":"=r"(res));

    return res;
}