.extern _ZN9interrupt11doSomethingEv
.align 4
.global _ZN59interrupt11callRoutineEv
.type _ZN9interrupt11callRoutineEv @function
_ZN9interrupt11callRoutineEv:
    call _ZN9interrupt11doSomethingEv
    sret