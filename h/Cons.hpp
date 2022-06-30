#include "../h/Sem.h"
#include "../h/syscall_cpp.hpp"


class CharBuffer{
private:
    Sem* mutexGet;
    Sem* mutexPut;
    Sem* getSem;
    Sem* putSem;
    int head;
    int tail;
    int size;
    int currSize;
    char* buffer;
public:
    CharBuffer(int size);
    ~CharBuffer();
    char get();
    void put(char c);
    int getSize();
    int getMaxSize();

};
class Cons{
public:
    static Cons* singleton;
    Cons();
    static CharBuffer* inputBuffer;
    static CharBuffer* outputBuffer;
};

class PutCharThread : public Thread{
public:
    PutCharThread() : Thread(){

    }
private:
    void run() override{
        while (true){
            while ((*((char *) CONSOLE_STATUS) & CONSOLE_TX_STATUS_BIT)) {
                char c = Cons::outputBuffer->get();
                *((char *) CONSOLE_TX_DATA) = c;
            }
        }
    }
};

class GetCharThread : public Thread{
public:
    GetCharThread() : Thread(){

    }
protected:
    void run() override{
        while (true){
            Thread::dispatch();



        }
    }
};