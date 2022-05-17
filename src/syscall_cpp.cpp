#include "../h/syscall_cpp.h"
#include "../lib/console.h"
#include "../h/PCB.h"


Thread::Thread(void (*body)(void *), void *arg) {
    int res = thread_create(&this->myHandle,body,arg);
    if(res < 0){
        __putc('!');
        __putc('\n');
    }
}

int Thread::start() {
    if(this->myHandle->PCB == nullptr) return -1;
    ((PCB*)this->myHandle->PCB)->start();
    return 0;
}


