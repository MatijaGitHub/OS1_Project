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
    Sem* startPut;
    PutCharThread() : Thread(){
        startPut = new Sem(0);
    }
private:
    void run() override{
        while (true){
            //startPut->wait();
            char c = Cons::outputBuffer->get();
            volatile char status = *((char *) CONSOLE_STATUS);
            while (!(status & CONSOLE_TX_STATUS_BIT)) {
                status = *((char *) CONSOLE_STATUS);
            }
            *((char *) CONSOLE_TX_DATA) = c;


        }
    }
};

class GetCharThread : public Thread{
public:
    Sem* startGet;
    GetCharThread() : Thread(){
        startGet = new Sem(0);
    }
protected:
    void run() override{
        while (true){
            Thread::dispatch();



        }
    }
};