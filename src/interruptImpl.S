.extern _ZN9Interrupt11doSomethingEv
.align 4
.global _ZN9Interrupt11callRoutineEv
.type _ZN9Interrupt11callRoutineEv @function
_ZN9Interrupt11callRoutineEv:
    call _ZN9Interrupt11doSomethingEv
    sret