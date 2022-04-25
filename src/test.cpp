#include "../lib/console.h"
#include "../lib/hw.h"
#include "../lib/mem.h"
#include "../h/Interrupt.hpp"
#include "../h/abi.h"
#include "../h/MemoryAllocator.hpp"
#include "../h/syscall_c.h"

struct primer{
    int a1;
    long a2;
    char a3;
};

int main(){

    Interrupt::w_stvec((uint64) &Interrupt::callRoutine);


    struct primer* adr =(struct primer*) mem_alloc(sizeof(struct primer));
    struct primer* adr2 = (struct primer*) mem_alloc(sizeof (struct primer));

    adr->a1 = 3;
    adr->a2 = 4;
    adr->a3 = 'a';
    adr2->a3 = 'A';

    __putc(adr->a3);
    __putc(adr2->a3);
    __putc('\n');


    return 0;

}