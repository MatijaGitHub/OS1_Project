#include "../h/Sem.h"
#include "../h/syscall_cpp.hpp"


class CharBuffer{
private:
    Sem* mutex;
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

};
class Cons{
public:
    static Cons* singleton;
    Cons();
    static CharBuffer* inputBuffer;
    static CharBuffer* outputBuffer;
    static Cons* getConsole();
};

class PutCharThread : public Thread{
public:
    static Sem* waitForPutSignal;
    PutCharThread() : Thread(){

    }
private:
    void run() override{
        while (true){
            waitForPutSignal->wait();
            while (Cons::outputBuffer->getSize() > 0) {
                while (!(*((char *) CONSOLE_STATUS) & CONSOLE_TX_STATUS_BIT)) {}
                *((char *) CONSOLE_TX_DATA) = Cons::outputBuffer->get();
            }
        }
    }
};

class GetCharThread : public Thread{
public:
    static Sem* waitForGetSignal;
    GetCharThread() : Thread(){

    }
protected:
    void run() override{
        while (true){
            waitForGetSignal->wait();
            while (Cons::inputBuffer->getSize() > 0) {
                while (!(*((char *) CONSOLE_STATUS) & CONSOLE_RX_STATUS_BIT)) {}
                char c = *((char *) CONSOLE_RX_DATA);
                Cons::inputBuffer->put(c);
            }

        }
    }
};