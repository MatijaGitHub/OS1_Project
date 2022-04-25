#include "../lib/console.h"
#include "../lib/hw.h"
#include "../lib/mem.h"
#include "../h/Interrupt.hpp"
#include "../h/abi.h"
#include "../h/MemoryAllocator.hpp"
#include "../h/syscall_c.h"
#include "../h/FreeShardList.hpp"

struct primer{
    int a1;
    char a3;
    long a2;

};

int main(){

    Interrupt::w_stvec((uint64) &Interrupt::callRoutine);

    FreeShardList* list = MemoryAllocator::getAllocator()->getList();

    struct primer* adr =(struct primer*) mem_alloc(sizeof(struct primer));
    struct primer* adr2 = (struct primer*) mem_alloc(sizeof (struct primer));
    struct primer* adr3 = (struct primer*) mem_alloc(sizeof (struct primer));


    adr->a1 = 3;
    adr->a2 = 4;
    adr->a3 = 'a';
    adr2->a3 = 'A';




    int res = mem_free(adr2);
    int res2 = mem_free((void*)((uint64)adr2 + 10));
    __putc(res+'0');
    __putc(res2+'0');
    __putc('\n');
    adr->a3 = 'a';
    __putc((uint64)list);
    __putc(adr->a3);
    __putc(adr2->a3);
    __putc(adr3->a3);
    __putc('\n');
    return 0;

}