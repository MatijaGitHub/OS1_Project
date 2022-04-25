#pragma once
#include "../lib/hw.h"


#ifdef __cplusplus
extern "C" {
#endif

uint64 callSys(int op, void *args, int argLen);


#ifdef __cplusplus
}
#endif