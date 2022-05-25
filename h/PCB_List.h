#pragma once



#ifdef __cplusplus
extern "C" {
#endif
class PCB;
struct pcbnode
{
    PCB* PCB;
    struct pcbnode*next;
};
class PCB_List
{
private:
    struct pcbnode *head,*tail;
public:
    PCB_List();
    void put(PCB* pcb);
    PCB* get();




};

#ifdef __cplusplus
}
#endif