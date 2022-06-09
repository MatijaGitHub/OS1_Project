#include "../h/Cons.hpp"



char CharBuffer::get() {
   getSem->wait();
    mutex->wait();
    char c = buffer[head];
    head = (head + 1)%size;
    currSize--;
    mutex->signal();
   putSem->signal();
    return c;
}

void CharBuffer::put(char c) {
    if(this->currSize >= this->size) return;
    putSem->wait();
    mutex->wait();
    buffer[tail] = c;
    tail = (tail + 1)%size;
    currSize++;
    mutex->signal();
    getSem->signal();

}

int CharBuffer::getSize() {
    return currSize;
}

CharBuffer::CharBuffer(int size) {
    mutex = new Sem(1);
    getSem = new Sem(0);
    putSem = new Sem(size);
    this->size = size;
    head = 0;
    tail = 0;
    currSize = 0;
    buffer = new char[size];
}

CharBuffer::~CharBuffer() {
    delete mutex;
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
Cons* Cons::singleton;
Cons::Cons() {

}

Cons *Cons::getConsole() {

    return Cons::singleton;
}
