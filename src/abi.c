#include "../h/abi.h"


int callSys(int op, void* args, int argLen){
    uint64 opReg = (uint64) op;
    uint64* argsReg = (uint64*)args;
    __asm__("mv %0,a0":"=r"(opReg));
    for(int i = 0;i < argLen;i++){
        switch (i) {
            case 0:
                __asm__("mv %0,a1":"=r"(argsReg[i]));
                break;
            case 1:
                __asm__("mv %0,a2":"=r"(argsReg[i]));
                break;
            case 2:
                __asm__("mv %0,a3":"=r"(argsReg[i]));
                break;
        }
    }
    __asm__("ecall");
    return 0; // Privremeno
}