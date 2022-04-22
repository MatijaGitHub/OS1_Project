#include "../lib/console.h"
#include "../lib/hw.h"
#include "../lib/mem.h"

uint64 pc;

void a(){
    __asm__("mv %0,ra":"=r"(pc));
}
void b(){
    __asm__("mv ra,%0": :"r"(pc));
}


void main(){


}