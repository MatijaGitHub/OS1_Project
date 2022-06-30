#include "../h/Cons.hpp"



char CharBuffer::get() {
   getSem->wait();
   mutexGet->wait();
    char c = buffer[head];
    head = (head + 1)%size;
    currSize--;
    mutexGet->signal();
   putSem->signal();
    return c;
}

void CharBuffer::put(char c) {
    //if(this->currSize >= this->size) return;
    putSem->wait();
    mutexPut->wait();
    buffer[tail] = c;
    tail = (tail + 1)%size;
    currSize++;
    mutexPut->signal();
    getSem->signal();

}

int CharBuffer::getSize() {
    return currSize;
}

CharBuffer::CharBuffer(int size) {
    mutexGet = new Sem(1);
    mutexPut = new Sem(1);
    getSem = new Sem(0);
    putSem = new Sem(size);
    this->size = size;
    head = 0;
    tail = 0;
    currSize = 0;
    buffer = new char[size];
}

CharBuffer::~CharBuffer() {
    delete mutexGet;
    delete mutexPut;
    delete getSem;
    delete putSem;
    delete buffer;
    size = head = tail = 0;
}

int CharBuffer::getMaxSize() {
    return size;
}

CharBuffer* Cons::inputBuffer;
CharBuffer* Cons::outputBuffer;
Cons::Cons() {

}

