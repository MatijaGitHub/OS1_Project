#include "../h/abi.h"
#include "../lib/console.h"


int callSys(int op, void* args, int argLen){
    uint64 opReg = (uint64) op;
    uint64* argsReg = (uint64*)args;
    __asm__ volatile("mv a0,%0": :"r"(opReg));
    for(int i = 0;i < argLen;i++){
        switch (i) {
            case 0:
                __asm__ volatile("mv a1,%0": :"r"(argsReg[i]));
                break;
            case 1:
                __asm__ volatile("mv a2,%0": :"r"(argsReg[i]));
                break;
            case 2:
                __asm__ volatile("mv a3,%0": :"r"(argsReg[i]));
                break;
        }
    }
    __asm__ volatile("ecall");
    //__putc('s');
    uint64 res;
    __asm__ volatile("mv %0,a0":"=r"(res));
    return res;
}