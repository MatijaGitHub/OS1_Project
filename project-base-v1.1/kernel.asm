
kernel:     file format elf64-littleriscv


Disassembly of section .text:

0000000080000000 <_entry>:
    80000000:	0000a117          	auipc	sp,0xa
    80000004:	0c813103          	ld	sp,200(sp) # 8000a0c8 <_GLOBAL_OFFSET_TABLE_+0x40>
    80000008:	00001537          	lui	a0,0x1
    8000000c:	f14025f3          	csrr	a1,mhartid
    80000010:	00158593          	addi	a1,a1,1
    80000014:	02b50533          	mul	a0,a0,a1
    80000018:	00a10133          	add	sp,sp,a0
    8000001c:	294050ef          	jal	ra,800052b0 <start>

0000000080000020 <spin>:
    80000020:	0000006f          	j	80000020 <spin>
	...

0000000080001000 <_ZN9Interrupt11callRoutineEv>:
# 1 "src/interruptImpl.S"
# 1 "<built-in>"
# 1 "<command-line>"
# 31 "<command-line>"
# 1 "/usr/riscv64-linux-gnu/include/stdc-predef.h" 1 3
# 32 "<command-line>" 2
    80001000:	f0010113          	addi	sp,sp,-256
# 1 "src/interruptImpl.S"
.extern _ZN9Interrupt13handleSysCallEv
.align 4
    80001004:	00013023          	sd	zero,0(sp)
    80001008:	00113423          	sd	ra,8(sp)
    8000100c:	00213823          	sd	sp,16(sp)
    80001010:	00313c23          	sd	gp,24(sp)
    80001014:	02413023          	sd	tp,32(sp)
    80001018:	02513423          	sd	t0,40(sp)
    8000101c:	02613823          	sd	t1,48(sp)
    80001020:	02713c23          	sd	t2,56(sp)
    80001024:	04813023          	sd	s0,64(sp)
    80001028:	04913423          	sd	s1,72(sp)
    8000102c:	04a13823          	sd	a0,80(sp)
    80001030:	04b13c23          	sd	a1,88(sp)
    80001034:	06c13023          	sd	a2,96(sp)
    80001038:	06d13423          	sd	a3,104(sp)
    8000103c:	06e13823          	sd	a4,112(sp)
    80001040:	06f13c23          	sd	a5,120(sp)
    80001044:	09013023          	sd	a6,128(sp)
    80001048:	09113423          	sd	a7,136(sp)
    8000104c:	09213823          	sd	s2,144(sp)
    80001050:	09313c23          	sd	s3,152(sp)
    80001054:	0b413023          	sd	s4,160(sp)
    80001058:	0b513423          	sd	s5,168(sp)
    8000105c:	0b613823          	sd	s6,176(sp)
    80001060:	0b713c23          	sd	s7,184(sp)
    80001064:	0d813023          	sd	s8,192(sp)
    80001068:	0d913423          	sd	s9,200(sp)
    8000106c:	0da13823          	sd	s10,208(sp)
    80001070:	0db13c23          	sd	s11,216(sp)
    80001074:	0fc13023          	sd	t3,224(sp)
    80001078:	0fd13423          	sd	t4,232(sp)
    8000107c:	0fe13823          	sd	t5,240(sp)
    80001080:	0ff13c23          	sd	t6,248(sp)
.global _ZN9Interrupt11callRoutineEv
    80001084:	3b4030ef          	jal	ra,80004438 <_ZN9Interrupt13handleSysCallEv>
.type _ZN9Interrupt11callRoutineEv @function
    80001088:	142025f3          	csrr	a1,scause
_ZN9Interrupt11callRoutineEv:
    8000108c:	ff858593          	addi	a1,a1,-8
    addi sp,sp,-256
    80001090:	00058663          	beqz	a1,8000109c <hasResult>
    .irp index, 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    80001094:	fff58593          	addi	a1,a1,-1
    sd x\index,\index * 8(sp)
    80001098:	00059463          	bnez	a1,800010a0 <noResult>

000000008000109c <hasResult>:
    .endr
    8000109c:	04a13823          	sd	a0,80(sp)

00000000800010a0 <noResult>:
    call _ZN9Interrupt13handleSysCallEv
    csrr a1 ,scause
    addi a1,a1,-8
    beqz a1,hasResult
    800010a0:	00013003          	ld	zero,0(sp)
    800010a4:	00813083          	ld	ra,8(sp)
    800010a8:	01013103          	ld	sp,16(sp)
    800010ac:	01813183          	ld	gp,24(sp)
    800010b0:	02013203          	ld	tp,32(sp)
    800010b4:	02813283          	ld	t0,40(sp)
    800010b8:	03013303          	ld	t1,48(sp)
    800010bc:	03813383          	ld	t2,56(sp)
    800010c0:	04013403          	ld	s0,64(sp)
    800010c4:	04813483          	ld	s1,72(sp)
    800010c8:	05013503          	ld	a0,80(sp)
    800010cc:	05813583          	ld	a1,88(sp)
    800010d0:	06013603          	ld	a2,96(sp)
    800010d4:	06813683          	ld	a3,104(sp)
    800010d8:	07013703          	ld	a4,112(sp)
    800010dc:	07813783          	ld	a5,120(sp)
    800010e0:	08013803          	ld	a6,128(sp)
    800010e4:	08813883          	ld	a7,136(sp)
    800010e8:	09013903          	ld	s2,144(sp)
    800010ec:	09813983          	ld	s3,152(sp)
    800010f0:	0a013a03          	ld	s4,160(sp)
    800010f4:	0a813a83          	ld	s5,168(sp)
    800010f8:	0b013b03          	ld	s6,176(sp)
    800010fc:	0b813b83          	ld	s7,184(sp)
    80001100:	0c013c03          	ld	s8,192(sp)
    80001104:	0c813c83          	ld	s9,200(sp)
    80001108:	0d013d03          	ld	s10,208(sp)
    8000110c:	0d813d83          	ld	s11,216(sp)
    80001110:	0e013e03          	ld	t3,224(sp)
    80001114:	0e813e83          	ld	t4,232(sp)
    80001118:	0f013f03          	ld	t5,240(sp)
    8000111c:	0f813f83          	ld	t6,248(sp)
    addi a1,a1,-1
    80001120:	10010113          	addi	sp,sp,256
    bnez a1,noResult
    hasResult:sd a0, 80(sp)
    80001124:	10200073          	sret
	...

0000000080001130 <_ZN3PCB13contextSwitchEPNS_7ContextES1_>:
.global _ZN3PCB13contextSwitchEPNS_7ContextES1_
.type _ZN3PCB13contextSwitchEPNS_7ContextES1_, @function
_ZN3PCB13contextSwitchEPNS_7ContextES1_:
    sd ra, 0 * 8(a0)
    80001130:	00153023          	sd	ra,0(a0) # 1000 <_entry-0x7ffff000>
    sd sp, 1 * 8(a0)
    80001134:	00253423          	sd	sp,8(a0)

    ld ra, 0 * 8(a1)
    80001138:	0005b083          	ld	ra,0(a1)
    ld sp, 1 * 8(a1)
    8000113c:	0085b103          	ld	sp,8(a1)

    80001140:	00008067          	ret

0000000080001144 <copy_and_swap>:
# a1 holds expected value
# a2 holds desired value
# a0 holds return value, 0 if successful, !0 otherwise
.global copy_and_swap
copy_and_swap:
    lr.w t0, (a0)          # Load original value.
    80001144:	100522af          	lr.w	t0,(a0)
    bne t0, a1, fail       # Doesn’t match, so fail.
    80001148:	00b29a63          	bne	t0,a1,8000115c <fail>
    sc.w t0, a2, (a0)      # Try to update.
    8000114c:	18c522af          	sc.w	t0,a2,(a0)
    bnez t0, copy_and_swap # Retry if store-conditional failed.
    80001150:	fe029ae3          	bnez	t0,80001144 <copy_and_swap>
    li a0, 0               # Set return to success.
    80001154:	00000513          	li	a0,0
    jr ra                  # Return.
    80001158:	00008067          	ret

000000008000115c <fail>:
    fail:
    li a0, 1               # Set return to failure.
    8000115c:	00100513          	li	a0,1
    80001160:	00008067          	ret

0000000080001164 <callSys>:
#include "../h/abi.h"



uint64 callSys(int op, void* args, int argLen){
    80001164:	ff010113          	addi	sp,sp,-16
    80001168:	00813423          	sd	s0,8(sp)
    8000116c:	01010413          	addi	s0,sp,16
    uint64 opReg = (uint64) op;
    uint64* argsReg = (uint64*)args;

    if(argLen == 1){
    80001170:	00100793          	li	a5,1
    80001174:	04f60063          	beq	a2,a5,800011b4 <callSys+0x50>
        uint64 arg1 = argsReg[0];
        __asm__ volatile("mv a1,%0": :"r"(arg1));
    }
    else if(argLen == 2){
    80001178:	00200793          	li	a5,2
    8000117c:	04f60c63          	beq	a2,a5,800011d4 <callSys+0x70>
        uint64 arg1 = argsReg[0];
        uint64 arg2 = argsReg[1];
        __asm__ volatile("mv a1,%0": :"r"(arg1));
        __asm__ volatile("mv a2,%0": :"r"(arg2));
    }
    else if(argLen == 3){
    80001180:	00300793          	li	a5,3
    80001184:	06f60263          	beq	a2,a5,800011e8 <callSys+0x84>
        uint64 arg3 = argsReg[2];
        __asm__ volatile("mv a1,%0": :"r"(arg1));
        __asm__ volatile("mv a2,%0": :"r"(arg2));
        __asm__ volatile("mv a3,%0": :"r"(arg3));
    }
    else if(argLen == 4){
    80001188:	00400793          	li	a5,4
    8000118c:	02f61863          	bne	a2,a5,800011bc <callSys+0x58>
        uint64 arg1 = argsReg[0];
    80001190:	0005b603          	ld	a2,0(a1)
        uint64 arg2 = argsReg[1];
    80001194:	0085b683          	ld	a3,8(a1)
        uint64 arg3 = argsReg[2];
    80001198:	0105b703          	ld	a4,16(a1)
        uint64 arg4 = argsReg[3];
    8000119c:	0185b783          	ld	a5,24(a1)
        __asm__ volatile("mv a1,%0": :"r"(arg1));
    800011a0:	00060593          	mv	a1,a2
        __asm__ volatile("mv a2,%0": :"r"(arg2));
    800011a4:	00068613          	mv	a2,a3
        __asm__ volatile("mv a3,%0": :"r"(arg3));
    800011a8:	00070693          	mv	a3,a4
        __asm__ volatile("mv a4,%0": :"r"(arg4));
    800011ac:	00078713          	mv	a4,a5
    800011b0:	00c0006f          	j	800011bc <callSys+0x58>
        uint64 arg1 = argsReg[0];
    800011b4:	0005b783          	ld	a5,0(a1)
        __asm__ volatile("mv a1,%0": :"r"(arg1));
    800011b8:	00078593          	mv	a1,a5
    }
    __asm__ volatile("mv a0,%0": :"r"(opReg));
    800011bc:	00050513          	mv	a0,a0
    __asm__ volatile("ecall");
    800011c0:	00000073          	ecall

    uint64 res;
    __asm__ volatile("mv %0,a0":"=r"(res));
    800011c4:	00050513          	mv	a0,a0

    return res;
    800011c8:	00813403          	ld	s0,8(sp)
    800011cc:	01010113          	addi	sp,sp,16
    800011d0:	00008067          	ret
        uint64 arg1 = argsReg[0];
    800011d4:	0005b703          	ld	a4,0(a1)
        uint64 arg2 = argsReg[1];
    800011d8:	0085b783          	ld	a5,8(a1)
        __asm__ volatile("mv a1,%0": :"r"(arg1));
    800011dc:	00070593          	mv	a1,a4
        __asm__ volatile("mv a2,%0": :"r"(arg2));
    800011e0:	00078613          	mv	a2,a5
    800011e4:	fd9ff06f          	j	800011bc <callSys+0x58>
        uint64 arg1 = argsReg[0];
    800011e8:	0005b683          	ld	a3,0(a1)
        uint64 arg2 = argsReg[1];
    800011ec:	0085b703          	ld	a4,8(a1)
        uint64 arg3 = argsReg[2];
    800011f0:	0105b783          	ld	a5,16(a1)
        __asm__ volatile("mv a1,%0": :"r"(arg1));
    800011f4:	00068593          	mv	a1,a3
        __asm__ volatile("mv a2,%0": :"r"(arg2));
    800011f8:	00070613          	mv	a2,a4
        __asm__ volatile("mv a3,%0": :"r"(arg3));
    800011fc:	00078693          	mv	a3,a5
    80001200:	fbdff06f          	j	800011bc <callSys+0x58>

0000000080001204 <mem_alloc>:





void* mem_alloc(size_t size){
    80001204:	fd010113          	addi	sp,sp,-48
    80001208:	02113423          	sd	ra,40(sp)
    8000120c:	02813023          	sd	s0,32(sp)
    80001210:	03010413          	addi	s0,sp,48
    size_t sizeB = ((size + ALLOCATED_HEADER_SIZE)/MEM_BLOCK_SIZE);
    80001214:	00850513          	addi	a0,a0,8
    80001218:	00655793          	srli	a5,a0,0x6
    if((size + ALLOCATED_HEADER_SIZE)%MEM_BLOCK_SIZE > 0){
    8000121c:	03f57513          	andi	a0,a0,63
    80001220:	00050463          	beqz	a0,80001228 <mem_alloc+0x24>
        sizeB++;
    80001224:	00178793          	addi	a5,a5,1
    }
    struct args arguments;
    arguments.arg1 =(uint64) sizeB;
    80001228:	fcf43823          	sd	a5,-48(s0)
    struct args* argsP = &arguments;
    void* res = (void*)callSys(0x1,(void*) argsP,1);
    8000122c:	00100613          	li	a2,1
    80001230:	fd040593          	addi	a1,s0,-48
    80001234:	00100513          	li	a0,1
    80001238:	00000097          	auipc	ra,0x0
    8000123c:	f2c080e7          	jalr	-212(ra) # 80001164 <callSys>
    return res;
}
    80001240:	02813083          	ld	ra,40(sp)
    80001244:	02013403          	ld	s0,32(sp)
    80001248:	03010113          	addi	sp,sp,48
    8000124c:	00008067          	ret

0000000080001250 <mem_free>:

int mem_free(void* adr){
    80001250:	fd010113          	addi	sp,sp,-48
    80001254:	02113423          	sd	ra,40(sp)
    80001258:	02813023          	sd	s0,32(sp)
    8000125c:	03010413          	addi	s0,sp,48
    struct args arguments;
    arguments.arg1 = (uint64) adr;
    80001260:	fca43823          	sd	a0,-48(s0)
    struct args* argsP = &arguments;
    int res = (int) callSys(0x2,(void*)argsP,1);
    80001264:	00100613          	li	a2,1
    80001268:	fd040593          	addi	a1,s0,-48
    8000126c:	00200513          	li	a0,2
    80001270:	00000097          	auipc	ra,0x0
    80001274:	ef4080e7          	jalr	-268(ra) # 80001164 <callSys>
    return res;
}
    80001278:	0005051b          	sext.w	a0,a0
    8000127c:	02813083          	ld	ra,40(sp)
    80001280:	02013403          	ld	s0,32(sp)
    80001284:	03010113          	addi	sp,sp,48
    80001288:	00008067          	ret

000000008000128c <thread_create>:

int thread_create (thread_t* handle, void(*start_routine)(void*), void* arg){
    8000128c:	fb010113          	addi	sp,sp,-80
    80001290:	04113423          	sd	ra,72(sp)
    80001294:	04813023          	sd	s0,64(sp)
    80001298:	02913c23          	sd	s1,56(sp)
    8000129c:	03213823          	sd	s2,48(sp)
    800012a0:	03313423          	sd	s3,40(sp)
    800012a4:	05010413          	addi	s0,sp,80
    800012a8:	00050493          	mv	s1,a0
    800012ac:	00058993          	mv	s3,a1
    800012b0:	00060913          	mv	s2,a2
    struct args arguments;
    *handle = (_thread*)mem_alloc(sizeof (_thread));
    800012b4:	00800513          	li	a0,8
    800012b8:	00000097          	auipc	ra,0x0
    800012bc:	f4c080e7          	jalr	-180(ra) # 80001204 <mem_alloc>
    800012c0:	00a4b023          	sd	a0,0(s1)
    arguments.arg1 = (uint64) handle;
    800012c4:	fa943823          	sd	s1,-80(s0)
    arguments.arg2 = (uint64) start_routine;
    800012c8:	fb343c23          	sd	s3,-72(s0)
    arguments.arg3 = (uint64) arg;
    800012cc:	fd243023          	sd	s2,-64(s0)
    void* adr = mem_alloc(DEFAULT_STACK_SIZE * 2);
    800012d0:	00002537          	lui	a0,0x2
    800012d4:	00000097          	auipc	ra,0x0
    800012d8:	f30080e7          	jalr	-208(ra) # 80001204 <mem_alloc>
    arguments.arg4 = (uint64)adr;
    800012dc:	fca43423          	sd	a0,-56(s0)
    if(arguments.arg4 == 0) return -2;
    800012e0:	02050c63          	beqz	a0,80001318 <thread_create+0x8c>
    struct args* argsP = &arguments;
    int res = (int) callSys(0x11,(void *)argsP,4);
    800012e4:	00400613          	li	a2,4
    800012e8:	fb040593          	addi	a1,s0,-80
    800012ec:	01100513          	li	a0,17
    800012f0:	00000097          	auipc	ra,0x0
    800012f4:	e74080e7          	jalr	-396(ra) # 80001164 <callSys>
    800012f8:	0005051b          	sext.w	a0,a0
    return res;
}
    800012fc:	04813083          	ld	ra,72(sp)
    80001300:	04013403          	ld	s0,64(sp)
    80001304:	03813483          	ld	s1,56(sp)
    80001308:	03013903          	ld	s2,48(sp)
    8000130c:	02813983          	ld	s3,40(sp)
    80001310:	05010113          	addi	sp,sp,80
    80001314:	00008067          	ret
    if(arguments.arg4 == 0) return -2;
    80001318:	ffe00513          	li	a0,-2
    8000131c:	fe1ff06f          	j	800012fc <thread_create+0x70>

0000000080001320 <thread_init>:

int thread_init (thread_t* handle, void(*start_routine)(void*), void* arg){
    80001320:	fb010113          	addi	sp,sp,-80
    80001324:	04113423          	sd	ra,72(sp)
    80001328:	04813023          	sd	s0,64(sp)
    8000132c:	02913c23          	sd	s1,56(sp)
    80001330:	03213823          	sd	s2,48(sp)
    80001334:	03313423          	sd	s3,40(sp)
    80001338:	05010413          	addi	s0,sp,80
    8000133c:	00050493          	mv	s1,a0
    80001340:	00058993          	mv	s3,a1
    80001344:	00060913          	mv	s2,a2
    struct args arguments;
    *handle = (_thread*)mem_alloc(sizeof (_thread));
    80001348:	00800513          	li	a0,8
    8000134c:	00000097          	auipc	ra,0x0
    80001350:	eb8080e7          	jalr	-328(ra) # 80001204 <mem_alloc>
    80001354:	00a4b023          	sd	a0,0(s1)
    arguments.arg1 = (uint64) handle;
    80001358:	fa943823          	sd	s1,-80(s0)
    arguments.arg2 = (uint64) start_routine;
    8000135c:	fb343c23          	sd	s3,-72(s0)
    arguments.arg3 = (uint64) arg;
    80001360:	fd243023          	sd	s2,-64(s0)
    void* adr = mem_alloc(DEFAULT_STACK_SIZE * 2);
    80001364:	00002537          	lui	a0,0x2
    80001368:	00000097          	auipc	ra,0x0
    8000136c:	e9c080e7          	jalr	-356(ra) # 80001204 <mem_alloc>
    arguments.arg4 = (uint64)adr;
    80001370:	fca43423          	sd	a0,-56(s0)
    if(arguments.arg4 == 0) return -2;
    80001374:	02050c63          	beqz	a0,800013ac <thread_init+0x8c>
    struct args* argsP = &arguments;
    int res = (int) callSys(0x10,(void *)argsP,4);
    80001378:	00400613          	li	a2,4
    8000137c:	fb040593          	addi	a1,s0,-80
    80001380:	01000513          	li	a0,16
    80001384:	00000097          	auipc	ra,0x0
    80001388:	de0080e7          	jalr	-544(ra) # 80001164 <callSys>
    8000138c:	0005051b          	sext.w	a0,a0
    return res;
}
    80001390:	04813083          	ld	ra,72(sp)
    80001394:	04013403          	ld	s0,64(sp)
    80001398:	03813483          	ld	s1,56(sp)
    8000139c:	03013903          	ld	s2,48(sp)
    800013a0:	02813983          	ld	s3,40(sp)
    800013a4:	05010113          	addi	sp,sp,80
    800013a8:	00008067          	ret
    if(arguments.arg4 == 0) return -2;
    800013ac:	ffe00513          	li	a0,-2
    800013b0:	fe1ff06f          	j	80001390 <thread_init+0x70>

00000000800013b4 <thread_dispatch>:
    int res = (int) callSys(0x12,0,0);
    if(res == 0) thread_dispatch();
    return res;
}

void thread_dispatch(){
    800013b4:	ff010113          	addi	sp,sp,-16
    800013b8:	00113423          	sd	ra,8(sp)
    800013bc:	00813023          	sd	s0,0(sp)
    800013c0:	01010413          	addi	s0,sp,16
    callSys(0x13,0,0);
    800013c4:	00000613          	li	a2,0
    800013c8:	00000593          	li	a1,0
    800013cc:	01300513          	li	a0,19
    800013d0:	00000097          	auipc	ra,0x0
    800013d4:	d94080e7          	jalr	-620(ra) # 80001164 <callSys>
}
    800013d8:	00813083          	ld	ra,8(sp)
    800013dc:	00013403          	ld	s0,0(sp)
    800013e0:	01010113          	addi	sp,sp,16
    800013e4:	00008067          	ret

00000000800013e8 <thread_exit>:
int thread_exit(){
    800013e8:	fe010113          	addi	sp,sp,-32
    800013ec:	00113c23          	sd	ra,24(sp)
    800013f0:	00813823          	sd	s0,16(sp)
    800013f4:	00913423          	sd	s1,8(sp)
    800013f8:	02010413          	addi	s0,sp,32
    int res = (int) callSys(0x12,0,0);
    800013fc:	00000613          	li	a2,0
    80001400:	00000593          	li	a1,0
    80001404:	01200513          	li	a0,18
    80001408:	00000097          	auipc	ra,0x0
    8000140c:	d5c080e7          	jalr	-676(ra) # 80001164 <callSys>
    80001410:	0005049b          	sext.w	s1,a0
    if(res == 0) thread_dispatch();
    80001414:	00048e63          	beqz	s1,80001430 <thread_exit+0x48>
}
    80001418:	00048513          	mv	a0,s1
    8000141c:	01813083          	ld	ra,24(sp)
    80001420:	01013403          	ld	s0,16(sp)
    80001424:	00813483          	ld	s1,8(sp)
    80001428:	02010113          	addi	sp,sp,32
    8000142c:	00008067          	ret
    if(res == 0) thread_dispatch();
    80001430:	00000097          	auipc	ra,0x0
    80001434:	f84080e7          	jalr	-124(ra) # 800013b4 <thread_dispatch>
    80001438:	fe1ff06f          	j	80001418 <thread_exit+0x30>

000000008000143c <sem_open>:
int sem_open (sem_t* handle,unsigned init){
    8000143c:	fc010113          	addi	sp,sp,-64
    80001440:	02113c23          	sd	ra,56(sp)
    80001444:	02813823          	sd	s0,48(sp)
    80001448:	02913423          	sd	s1,40(sp)
    8000144c:	03213023          	sd	s2,32(sp)
    80001450:	04010413          	addi	s0,sp,64
    80001454:	00050913          	mv	s2,a0
    80001458:	00058493          	mv	s1,a1
    struct args arguments;
    *handle = (_sem *)mem_alloc(sizeof (_sem));
    8000145c:	00800513          	li	a0,8
    80001460:	00000097          	auipc	ra,0x0
    80001464:	da4080e7          	jalr	-604(ra) # 80001204 <mem_alloc>
    80001468:	00a93023          	sd	a0,0(s2)
    arguments.arg1 = (uint64)handle;
    8000146c:	fd243023          	sd	s2,-64(s0)
    arguments.arg2 = (uint64)init;
    80001470:	02049493          	slli	s1,s1,0x20
    80001474:	0204d493          	srli	s1,s1,0x20
    80001478:	fc943423          	sd	s1,-56(s0)
    struct args* argsP = &arguments;
    int res = (int) callSys(0x21,(void *)argsP,2);
    8000147c:	00200613          	li	a2,2
    80001480:	fc040593          	addi	a1,s0,-64
    80001484:	02100513          	li	a0,33
    80001488:	00000097          	auipc	ra,0x0
    8000148c:	cdc080e7          	jalr	-804(ra) # 80001164 <callSys>
    return res;
}
    80001490:	0005051b          	sext.w	a0,a0
    80001494:	03813083          	ld	ra,56(sp)
    80001498:	03013403          	ld	s0,48(sp)
    8000149c:	02813483          	ld	s1,40(sp)
    800014a0:	02013903          	ld	s2,32(sp)
    800014a4:	04010113          	addi	sp,sp,64
    800014a8:	00008067          	ret

00000000800014ac <sem_close>:
int sem_close (sem_t handle){
    800014ac:	fd010113          	addi	sp,sp,-48
    800014b0:	02113423          	sd	ra,40(sp)
    800014b4:	02813023          	sd	s0,32(sp)
    800014b8:	03010413          	addi	s0,sp,48
    struct args arguments;
    arguments.arg1 = (uint64)handle;
    800014bc:	fca43823          	sd	a0,-48(s0)
    struct args* argsP = &arguments;
    int res = (int) callSys(0x22,(void *)argsP,1);
    800014c0:	00100613          	li	a2,1
    800014c4:	fd040593          	addi	a1,s0,-48
    800014c8:	02200513          	li	a0,34
    800014cc:	00000097          	auipc	ra,0x0
    800014d0:	c98080e7          	jalr	-872(ra) # 80001164 <callSys>
    return res;
}
    800014d4:	0005051b          	sext.w	a0,a0
    800014d8:	02813083          	ld	ra,40(sp)
    800014dc:	02013403          	ld	s0,32(sp)
    800014e0:	03010113          	addi	sp,sp,48
    800014e4:	00008067          	ret

00000000800014e8 <sem_wait>:
int sem_wait (sem_t id){
    800014e8:	fd010113          	addi	sp,sp,-48
    800014ec:	02113423          	sd	ra,40(sp)
    800014f0:	02813023          	sd	s0,32(sp)
    800014f4:	03010413          	addi	s0,sp,48
    struct args arguments;
    arguments.arg1 = (uint64)id;
    800014f8:	fca43823          	sd	a0,-48(s0)
    struct args* argsP = &arguments;
    int res = (int) callSys(0x23,(void *)argsP,1);
    800014fc:	00100613          	li	a2,1
    80001500:	fd040593          	addi	a1,s0,-48
    80001504:	02300513          	li	a0,35
    80001508:	00000097          	auipc	ra,0x0
    8000150c:	c5c080e7          	jalr	-932(ra) # 80001164 <callSys>
    return res;
}
    80001510:	0005051b          	sext.w	a0,a0
    80001514:	02813083          	ld	ra,40(sp)
    80001518:	02013403          	ld	s0,32(sp)
    8000151c:	03010113          	addi	sp,sp,48
    80001520:	00008067          	ret

0000000080001524 <sem_signal>:
int sem_signal (sem_t id){
    80001524:	fd010113          	addi	sp,sp,-48
    80001528:	02113423          	sd	ra,40(sp)
    8000152c:	02813023          	sd	s0,32(sp)
    80001530:	03010413          	addi	s0,sp,48
    struct args arguments;
    arguments.arg1 = (uint64)id;
    80001534:	fca43823          	sd	a0,-48(s0)
    struct args* argsP = &arguments;
    int res = (int) callSys(0x24,(void *)argsP,1);
    80001538:	00100613          	li	a2,1
    8000153c:	fd040593          	addi	a1,s0,-48
    80001540:	02400513          	li	a0,36
    80001544:	00000097          	auipc	ra,0x0
    80001548:	c20080e7          	jalr	-992(ra) # 80001164 <callSys>
    return res;
}
    8000154c:	0005051b          	sext.w	a0,a0
    80001550:	02813083          	ld	ra,40(sp)
    80001554:	02013403          	ld	s0,32(sp)
    80001558:	03010113          	addi	sp,sp,48
    8000155c:	00008067          	ret

0000000080001560 <time_sleep>:

int time_sleep (time_t time){
    80001560:	fd010113          	addi	sp,sp,-48
    80001564:	02113423          	sd	ra,40(sp)
    80001568:	02813023          	sd	s0,32(sp)
    8000156c:	03010413          	addi	s0,sp,48
    struct args arguments;
    arguments.arg1 = (uint64)time;
    80001570:	fca43823          	sd	a0,-48(s0)
    struct args* argsP = &arguments;
    int res = (int) callSys(0x31,(void *)argsP,1);
    80001574:	00100613          	li	a2,1
    80001578:	fd040593          	addi	a1,s0,-48
    8000157c:	03100513          	li	a0,49
    80001580:	00000097          	auipc	ra,0x0
    80001584:	be4080e7          	jalr	-1052(ra) # 80001164 <callSys>
    return res;
}
    80001588:	0005051b          	sext.w	a0,a0
    8000158c:	02813083          	ld	ra,40(sp)
    80001590:	02013403          	ld	s0,32(sp)
    80001594:	03010113          	addi	sp,sp,48
    80001598:	00008067          	ret

000000008000159c <set_periodic>:
void set_periodic(thread_t* handle){
    8000159c:	fd010113          	addi	sp,sp,-48
    800015a0:	02113423          	sd	ra,40(sp)
    800015a4:	02813023          	sd	s0,32(sp)
    800015a8:	03010413          	addi	s0,sp,48
    struct args arguments;
    arguments.arg1 = (uint64)handle;
    800015ac:	fca43823          	sd	a0,-48(s0)
    struct args* argsP = &arguments;
    callSys(0x55,(void *)argsP,1);
    800015b0:	00100613          	li	a2,1
    800015b4:	fd040593          	addi	a1,s0,-48
    800015b8:	05500513          	li	a0,85
    800015bc:	00000097          	auipc	ra,0x0
    800015c0:	ba8080e7          	jalr	-1112(ra) # 80001164 <callSys>

}
    800015c4:	02813083          	ld	ra,40(sp)
    800015c8:	02013403          	ld	s0,32(sp)
    800015cc:	03010113          	addi	sp,sp,48
    800015d0:	00008067          	ret

00000000800015d4 <block_All_Periodic>:
void block_All_Periodic(){
    800015d4:	ff010113          	addi	sp,sp,-16
    800015d8:	00113423          	sd	ra,8(sp)
    800015dc:	00813023          	sd	s0,0(sp)
    800015e0:	01010413          	addi	s0,sp,16
    callSys(0x56,0,0);
    800015e4:	00000613          	li	a2,0
    800015e8:	00000593          	li	a1,0
    800015ec:	05600513          	li	a0,86
    800015f0:	00000097          	auipc	ra,0x0
    800015f4:	b74080e7          	jalr	-1164(ra) # 80001164 <callSys>
}
    800015f8:	00813083          	ld	ra,8(sp)
    800015fc:	00013403          	ld	s0,0(sp)
    80001600:	01010113          	addi	sp,sp,16
    80001604:	00008067          	ret

0000000080001608 <getc>:
char getc (){
    80001608:	ff010113          	addi	sp,sp,-16
    8000160c:	00113423          	sd	ra,8(sp)
    80001610:	00813023          	sd	s0,0(sp)
    80001614:	01010413          	addi	s0,sp,16

    char c =  (char )callSys(0x41,0,0);
    80001618:	00000613          	li	a2,0
    8000161c:	00000593          	li	a1,0
    80001620:	04100513          	li	a0,65
    80001624:	00000097          	auipc	ra,0x0
    80001628:	b40080e7          	jalr	-1216(ra) # 80001164 <callSys>

    return  c;
}
    8000162c:	0ff57513          	andi	a0,a0,255
    80001630:	00813083          	ld	ra,8(sp)
    80001634:	00013403          	ld	s0,0(sp)
    80001638:	01010113          	addi	sp,sp,16
    8000163c:	00008067          	ret

0000000080001640 <putc>:
void putc (char c){
    80001640:	fd010113          	addi	sp,sp,-48
    80001644:	02113423          	sd	ra,40(sp)
    80001648:	02813023          	sd	s0,32(sp)
    8000164c:	03010413          	addi	s0,sp,48
    struct args arguments;
    arguments.arg1 = (uint64)c;
    80001650:	fca43823          	sd	a0,-48(s0)
    struct args* argsP = &arguments;
    callSys(0x42,(void *)argsP,1);
    80001654:	00100613          	li	a2,1
    80001658:	fd040593          	addi	a1,s0,-48
    8000165c:	04200513          	li	a0,66
    80001660:	00000097          	auipc	ra,0x0
    80001664:	b04080e7          	jalr	-1276(ra) # 80001164 <callSys>


}
    80001668:	02813083          	ld	ra,40(sp)
    8000166c:	02013403          	ld	s0,32(sp)
    80001670:	03010113          	addi	sp,sp,48
    80001674:	00008067          	ret

0000000080001678 <switchToUserMode>:

void switchToUserMode(){
    80001678:	ff010113          	addi	sp,sp,-16
    8000167c:	00113423          	sd	ra,8(sp)
    80001680:	00813023          	sd	s0,0(sp)
    80001684:	01010413          	addi	s0,sp,16
    callSys(0x50,0,0);
    80001688:	00000613          	li	a2,0
    8000168c:	00000593          	li	a1,0
    80001690:	05000513          	li	a0,80
    80001694:	00000097          	auipc	ra,0x0
    80001698:	ad0080e7          	jalr	-1328(ra) # 80001164 <callSys>
}
    8000169c:	00813083          	ld	ra,8(sp)
    800016a0:	00013403          	ld	s0,0(sp)
    800016a4:	01010113          	addi	sp,sp,16
    800016a8:	00008067          	ret

00000000800016ac <_ZN3PCB7getNextEv>:
bool PCB::isMain = true;
bool PCB::isPeriodicBlocked = false;
PCB_List* PCB::perioThreads = nullptr;


PCB *PCB::getNext() {
    800016ac:	ff010113          	addi	sp,sp,-16
    800016b0:	00813423          	sd	s0,8(sp)
    800016b4:	01010413          	addi	s0,sp,16
    return this->next_scheduler;
}
    800016b8:	00853503          	ld	a0,8(a0) # 2008 <_entry-0x7fffdff8>
    800016bc:	00813403          	ld	s0,8(sp)
    800016c0:	01010113          	addi	sp,sp,16
    800016c4:	00008067          	ret

00000000800016c8 <_ZN3PCB7setNextEPS_>:

void PCB::setNext(PCB *next) {
    800016c8:	ff010113          	addi	sp,sp,-16
    800016cc:	00813423          	sd	s0,8(sp)
    800016d0:	01010413          	addi	s0,sp,16
    this->next_scheduler = next;
    800016d4:	00b53423          	sd	a1,8(a0)
}
    800016d8:	00813403          	ld	s0,8(sp)
    800016dc:	01010113          	addi	sp,sp,16
    800016e0:	00008067          	ret

00000000800016e4 <_ZN3PCBC1EPFvPvES0_Pmm>:

PCB::PCB(Body body,void* args,uint64 * stac,uint64 timeSlice) {
    800016e4:	ff010113          	addi	sp,sp,-16
    800016e8:	00813423          	sd	s0,8(sp)
    800016ec:	01010413          	addi	s0,sp,16
    next_scheduler = nullptr;
    800016f0:	00053423          	sd	zero,8(a0)
    stack = stac;
    800016f4:	00d53823          	sd	a3,16(a0)
    context.sp = (uint64) &stack[DEFAULT_STACK_SIZE * 2];
    800016f8:	000107b7          	lui	a5,0x10
    800016fc:	00f686b3          	add	a3,a3,a5
    80001700:	02d53823          	sd	a3,48(a0)
    context.ra = (uint64) &threadWrapper;
    80001704:	00000797          	auipc	a5,0x0
    80001708:	0a878793          	addi	a5,a5,168 # 800017ac <_ZN3PCB13threadWrapperEv>
    8000170c:	02f53423          	sd	a5,40(a0)
    this->body = body;
    80001710:	04b53823          	sd	a1,80(a0)
    this->isPeriodic = false;
    80001714:	000500a3          	sb	zero,1(a0)
    this->timeSlice = timeSlice;
    80001718:	04e53023          	sd	a4,64(a0)
    this->args = args;
    8000171c:	02c53023          	sd	a2,32(a0)
    finished = false;
    80001720:	04050423          	sb	zero,72(a0)
    isBlocked = false;
    80001724:	040504a3          	sb	zero,73(a0)
    isSleeping = false;
    80001728:	04050523          	sb	zero,74(a0)
    unblockError = false;
    8000172c:	00050023          	sb	zero,0(a0)


}
    80001730:	00813403          	ld	s0,8(sp)
    80001734:	01010113          	addi	sp,sp,16
    80001738:	00008067          	ret

000000008000173c <_ZN3PCB11setFinishedEb>:
    running->body(args);
    thread_exit();

}

void PCB::setFinished(bool f) {
    8000173c:	ff010113          	addi	sp,sp,-16
    80001740:	00813423          	sd	s0,8(sp)
    80001744:	01010413          	addi	s0,sp,16
    finished = f;
    80001748:	04b50423          	sb	a1,72(a0)
}
    8000174c:	00813403          	ld	s0,8(sp)
    80001750:	01010113          	addi	sp,sp,16
    80001754:	00008067          	ret

0000000080001758 <_ZN3PCB13checkFinishedEv>:

bool PCB::checkFinished() {
    80001758:	ff010113          	addi	sp,sp,-16
    8000175c:	00813423          	sd	s0,8(sp)
    80001760:	01010413          	addi	s0,sp,16
    return finished;
}
    80001764:	04854503          	lbu	a0,72(a0)
    80001768:	00813403          	ld	s0,8(sp)
    8000176c:	01010113          	addi	sp,sp,16
    80001770:	00008067          	ret

0000000080001774 <_ZN3PCB7setArgsEPv>:
    else mc_status(Interrupt::SSTATUS_SPP);
    contextSwitch(&old->context,&running->context);

}

void PCB::setArgs(void *arg) {
    80001774:	ff010113          	addi	sp,sp,-16
    80001778:	00813423          	sd	s0,8(sp)
    8000177c:	01010413          	addi	s0,sp,16
    this->args = arg;
    80001780:	02b53023          	sd	a1,32(a0)
}
    80001784:	00813403          	ld	s0,8(sp)
    80001788:	01010113          	addi	sp,sp,16
    8000178c:	00008067          	ret

0000000080001790 <_ZN3PCB7getArgsEv>:

void *PCB::getArgs() {
    80001790:	ff010113          	addi	sp,sp,-16
    80001794:	00813423          	sd	s0,8(sp)
    80001798:	01010413          	addi	s0,sp,16
    return this->args;
}
    8000179c:	02053503          	ld	a0,32(a0)
    800017a0:	00813403          	ld	s0,8(sp)
    800017a4:	01010113          	addi	sp,sp,16
    800017a8:	00008067          	ret

00000000800017ac <_ZN3PCB13threadWrapperEv>:
void PCB::threadWrapper() {
    800017ac:	fe010113          	addi	sp,sp,-32
    800017b0:	00113c23          	sd	ra,24(sp)
    800017b4:	00813823          	sd	s0,16(sp)
    800017b8:	00913423          	sd	s1,8(sp)
    800017bc:	02010413          	addi	s0,sp,32
    Interrupt::popSppSpie();
    800017c0:	00003097          	auipc	ra,0x3
    800017c4:	ed0080e7          	jalr	-304(ra) # 80004690 <_ZN9Interrupt10popSppSpieEv>
    void* args = running->getArgs();
    800017c8:	00009497          	auipc	s1,0x9
    800017cc:	9784b483          	ld	s1,-1672(s1) # 8000a140 <_ZN3PCB7runningE>
    800017d0:	00048513          	mv	a0,s1
    800017d4:	00000097          	auipc	ra,0x0
    800017d8:	fbc080e7          	jalr	-68(ra) # 80001790 <_ZN3PCB7getArgsEv>
    running->body(args);
    800017dc:	0504b783          	ld	a5,80(s1)
    800017e0:	000780e7          	jalr	a5
    thread_exit();
    800017e4:	00000097          	auipc	ra,0x0
    800017e8:	c04080e7          	jalr	-1020(ra) # 800013e8 <thread_exit>
}
    800017ec:	01813083          	ld	ra,24(sp)
    800017f0:	01013403          	ld	s0,16(sp)
    800017f4:	00813483          	ld	s1,8(sp)
    800017f8:	02010113          	addi	sp,sp,32
    800017fc:	00008067          	ret

0000000080001800 <_ZN3PCB11allocatePCBEv>:
        Scheduler::put(this);

    }
}

void *PCB::allocatePCB() {
    80001800:	ff010113          	addi	sp,sp,-16
    80001804:	00113423          	sd	ra,8(sp)
    80001808:	00813023          	sd	s0,0(sp)
    8000180c:	01010413          	addi	s0,sp,16
    uint64 inBlocks = size/MEM_BLOCK_SIZE;
    if(size%MEM_BLOCK_SIZE!=0){
        inBlocks++;
    }
    inBlocks*=MEM_BLOCK_SIZE;
    void* retAdr = MemoryAllocator::mem_alloc((size_t) inBlocks);
    80001810:	08000513          	li	a0,128
    80001814:	00002097          	auipc	ra,0x2
    80001818:	2c4080e7          	jalr	708(ra) # 80003ad8 <_ZN15MemoryAllocator9mem_allocEm>
    long* header = (long*) retAdr;
    inBlocks/=MEM_BLOCK_SIZE;
    *header = inBlocks;
    8000181c:	00200793          	li	a5,2
    80001820:	00f53023          	sd	a5,0(a0)
    header++;
    void* ret = (void*)header;
    return ret;
}
    80001824:	00850513          	addi	a0,a0,8
    80001828:	00813083          	ld	ra,8(sp)
    8000182c:	00013403          	ld	s0,0(sp)
    80001830:	01010113          	addi	sp,sp,16
    80001834:	00008067          	ret

0000000080001838 <_ZN3PCB10setContextEmm>:

void PCB::setContext(uint64 ra, uint64 sp) {
    80001838:	ff010113          	addi	sp,sp,-16
    8000183c:	00813423          	sd	s0,8(sp)
    80001840:	01010413          	addi	s0,sp,16
    this->context.ra = ra;
    80001844:	02b53423          	sd	a1,40(a0)
    this->context.sp = sp;
    80001848:	02c53823          	sd	a2,48(a0)
}
    8000184c:	00813403          	ld	s0,8(sp)
    80001850:	01010113          	addi	sp,sp,16
    80001854:	00008067          	ret

0000000080001858 <_ZN3PCB12checkBlockedEv>:

bool PCB::checkBlocked() {
    80001858:	ff010113          	addi	sp,sp,-16
    8000185c:	00813423          	sd	s0,8(sp)
    80001860:	01010413          	addi	s0,sp,16
    return isBlocked;
}
    80001864:	04954503          	lbu	a0,73(a0)
    80001868:	00813403          	ld	s0,8(sp)
    8000186c:	01010113          	addi	sp,sp,16
    80001870:	00008067          	ret

0000000080001874 <_ZN3PCB10setBlockedEb>:

void PCB::setBlocked(bool f) {
    80001874:	ff010113          	addi	sp,sp,-16
    80001878:	00813423          	sd	s0,8(sp)
    8000187c:	01010413          	addi	s0,sp,16
    isBlocked = f;
    80001880:	04b504a3          	sb	a1,73(a0)
}
    80001884:	00813403          	ld	s0,8(sp)
    80001888:	01010113          	addi	sp,sp,16
    8000188c:	00008067          	ret

0000000080001890 <_ZN3PCB5setIdEc>:

void PCB::setId(char id) {
    80001890:	ff010113          	addi	sp,sp,-16
    80001894:	00813423          	sd	s0,8(sp)
    80001898:	01010413          	addi	s0,sp,16
    this->my_id = id;
    8000189c:	04b505a3          	sb	a1,75(a0)
}
    800018a0:	00813403          	ld	s0,8(sp)
    800018a4:	01010113          	addi	sp,sp,16
    800018a8:	00008067          	ret

00000000800018ac <_ZN3PCB5startEv>:
void PCB::start() {
    800018ac:	fe010113          	addi	sp,sp,-32
    800018b0:	00113c23          	sd	ra,24(sp)
    800018b4:	00813823          	sd	s0,16(sp)
    800018b8:	00913423          	sd	s1,8(sp)
    800018bc:	02010413          	addi	s0,sp,32
    800018c0:	00050493          	mv	s1,a0
    if(running == nullptr) {
    800018c4:	00009797          	auipc	a5,0x9
    800018c8:	87c7b783          	ld	a5,-1924(a5) # 8000a140 <_ZN3PCB7runningE>
    800018cc:	04078463          	beqz	a5,80001914 <_ZN3PCB5startEv+0x68>
        this->setId('0' + PCB::id_cnt++);
    800018d0:	00009797          	auipc	a5,0x9
    800018d4:	87078793          	addi	a5,a5,-1936 # 8000a140 <_ZN3PCB7runningE>
    800018d8:	0087a583          	lw	a1,8(a5)
    800018dc:	0015871b          	addiw	a4,a1,1
    800018e0:	00e7a423          	sw	a4,8(a5)
    800018e4:	0305859b          	addiw	a1,a1,48
    800018e8:	0ff5f593          	andi	a1,a1,255
    800018ec:	00000097          	auipc	ra,0x0
    800018f0:	fa4080e7          	jalr	-92(ra) # 80001890 <_ZN3PCB5setIdEc>
        Scheduler::put(this);
    800018f4:	00048513          	mv	a0,s1
    800018f8:	00001097          	auipc	ra,0x1
    800018fc:	804080e7          	jalr	-2044(ra) # 800020fc <_ZN9Scheduler3putEP3PCB>
}
    80001900:	01813083          	ld	ra,24(sp)
    80001904:	01013403          	ld	s0,16(sp)
    80001908:	00813483          	ld	s1,8(sp)
    8000190c:	02010113          	addi	sp,sp,32
    80001910:	00008067          	ret
        running = this;
    80001914:	00009797          	auipc	a5,0x9
    80001918:	82a7b623          	sd	a0,-2004(a5) # 8000a140 <_ZN3PCB7runningE>
        running->setId('m');
    8000191c:	06d00593          	li	a1,109
    80001920:	00000097          	auipc	ra,0x0
    80001924:	f70080e7          	jalr	-144(ra) # 80001890 <_ZN3PCB5setIdEc>
    80001928:	fd9ff06f          	j	80001900 <_ZN3PCB5startEv+0x54>

000000008000192c <_ZNK3PCB12getTimeSliceEv>:



uint64 PCB::getTimeSlice() const {
    8000192c:	ff010113          	addi	sp,sp,-16
    80001930:	00813423          	sd	s0,8(sp)
    80001934:	01010413          	addi	s0,sp,16
    return timeSlice;
}
    80001938:	04053503          	ld	a0,64(a0)
    8000193c:	00813403          	ld	s0,8(sp)
    80001940:	01010113          	addi	sp,sp,16
    80001944:	00008067          	ret

0000000080001948 <_ZN3PCB12setTimeSliceEm>:

void PCB::setTimeSlice(uint64 timeSlice) {
    80001948:	ff010113          	addi	sp,sp,-16
    8000194c:	00813423          	sd	s0,8(sp)
    80001950:	01010413          	addi	s0,sp,16
    PCB::timeSlice = timeSlice;
    80001954:	04b53023          	sd	a1,64(a0)
}
    80001958:	00813403          	ld	s0,8(sp)
    8000195c:	01010113          	addi	sp,sp,16
    80001960:	00008067          	ret

0000000080001964 <_ZN3PCB11setSleepingEb>:
    PCB::sleeping_list->putTime(running,time);
    running->setSleeping(true);
    //PCB::dispatch();
}

void PCB::setSleeping(bool f) {
    80001964:	ff010113          	addi	sp,sp,-16
    80001968:	00813423          	sd	s0,8(sp)
    8000196c:	01010413          	addi	s0,sp,16
    isSleeping = f;
    80001970:	04b50523          	sb	a1,74(a0)
}
    80001974:	00813403          	ld	s0,8(sp)
    80001978:	01010113          	addi	sp,sp,16
    8000197c:	00008067          	ret

0000000080001980 <_ZN3PCB5sleepEm>:
void PCB::sleep(time_t time) {
    80001980:	fe010113          	addi	sp,sp,-32
    80001984:	00113c23          	sd	ra,24(sp)
    80001988:	00813823          	sd	s0,16(sp)
    8000198c:	00913423          	sd	s1,8(sp)
    80001990:	02010413          	addi	s0,sp,32
    80001994:	00050613          	mv	a2,a0
    PCB::sleeping_list->putTime(running,time);
    80001998:	00008497          	auipc	s1,0x8
    8000199c:	7a848493          	addi	s1,s1,1960 # 8000a140 <_ZN3PCB7runningE>
    800019a0:	0004b583          	ld	a1,0(s1)
    800019a4:	0104b503          	ld	a0,16(s1)
    800019a8:	00000097          	auipc	ra,0x0
    800019ac:	2f4080e7          	jalr	756(ra) # 80001c9c <_ZN8PCB_List7putTimeEP3PCBm>
    running->setSleeping(true);
    800019b0:	00100593          	li	a1,1
    800019b4:	0004b503          	ld	a0,0(s1)
    800019b8:	00000097          	auipc	ra,0x0
    800019bc:	fac080e7          	jalr	-84(ra) # 80001964 <_ZN3PCB11setSleepingEb>
}
    800019c0:	01813083          	ld	ra,24(sp)
    800019c4:	01013403          	ld	s0,16(sp)
    800019c8:	00813483          	ld	s1,8(sp)
    800019cc:	02010113          	addi	sp,sp,32
    800019d0:	00008067          	ret

00000000800019d4 <_ZN3PCB13checkSleepingEv>:

bool PCB::checkSleeping() {
    800019d4:	ff010113          	addi	sp,sp,-16
    800019d8:	00813423          	sd	s0,8(sp)
    800019dc:	01010413          	addi	s0,sp,16
    return isSleeping;
}
    800019e0:	04a54503          	lbu	a0,74(a0)
    800019e4:	00813403          	ld	s0,8(sp)
    800019e8:	01010113          	addi	sp,sp,16
    800019ec:	00008067          	ret

00000000800019f0 <_ZN3PCB8dispatchEv>:
void PCB::dispatch() {
    800019f0:	fe010113          	addi	sp,sp,-32
    800019f4:	00113c23          	sd	ra,24(sp)
    800019f8:	00813823          	sd	s0,16(sp)
    800019fc:	00913423          	sd	s1,8(sp)
    80001a00:	02010413          	addi	s0,sp,32
    PCB* old = running;
    80001a04:	00008497          	auipc	s1,0x8
    80001a08:	73c4b483          	ld	s1,1852(s1) # 8000a140 <_ZN3PCB7runningE>
    if(old->isPeriodic && PCB::isPeriodicBlocked) {
    80001a0c:	0014c783          	lbu	a5,1(s1)
    80001a10:	00078863          	beqz	a5,80001a20 <_ZN3PCB8dispatchEv+0x30>
    80001a14:	00008797          	auipc	a5,0x8
    80001a18:	7447c783          	lbu	a5,1860(a5) # 8000a158 <_ZN3PCB17isPeriodicBlockedE>
    80001a1c:	04079263          	bnez	a5,80001a60 <_ZN3PCB8dispatchEv+0x70>
    else if(!old->checkFinished()&&!old->checkBlocked()&&!old->checkSleeping())Scheduler::put(old);
    80001a20:	00048513          	mv	a0,s1
    80001a24:	00000097          	auipc	ra,0x0
    80001a28:	d34080e7          	jalr	-716(ra) # 80001758 <_ZN3PCB13checkFinishedEv>
    80001a2c:	04051463          	bnez	a0,80001a74 <_ZN3PCB8dispatchEv+0x84>
    80001a30:	00048513          	mv	a0,s1
    80001a34:	00000097          	auipc	ra,0x0
    80001a38:	e24080e7          	jalr	-476(ra) # 80001858 <_ZN3PCB12checkBlockedEv>
    80001a3c:	02051c63          	bnez	a0,80001a74 <_ZN3PCB8dispatchEv+0x84>
    80001a40:	00048513          	mv	a0,s1
    80001a44:	00000097          	auipc	ra,0x0
    80001a48:	f90080e7          	jalr	-112(ra) # 800019d4 <_ZN3PCB13checkSleepingEv>
    80001a4c:	02051463          	bnez	a0,80001a74 <_ZN3PCB8dispatchEv+0x84>
    80001a50:	00048513          	mv	a0,s1
    80001a54:	00000097          	auipc	ra,0x0
    80001a58:	6a8080e7          	jalr	1704(ra) # 800020fc <_ZN9Scheduler3putEP3PCB>
    80001a5c:	0180006f          	j	80001a74 <_ZN3PCB8dispatchEv+0x84>
        PCB::perioThreads->put(old);
    80001a60:	00048593          	mv	a1,s1
    80001a64:	00008517          	auipc	a0,0x8
    80001a68:	6fc53503          	ld	a0,1788(a0) # 8000a160 <_ZN3PCB12perioThreadsE>
    80001a6c:	00000097          	auipc	ra,0x0
    80001a70:	160080e7          	jalr	352(ra) # 80001bcc <_ZN8PCB_List3putEP3PCB>
    running = Scheduler::get();
    80001a74:	00000097          	auipc	ra,0x0
    80001a78:	72c080e7          	jalr	1836(ra) # 800021a0 <_ZN9Scheduler3getEv>
    80001a7c:	00008797          	auipc	a5,0x8
    80001a80:	6ca7b223          	sd	a0,1732(a5) # 8000a140 <_ZN3PCB7runningE>
    if(running->my_id == '0') ms_status(Interrupt::SSTATUS_SPP);
    80001a84:	04b54703          	lbu	a4,75(a0)
    80001a88:	03000793          	li	a5,48
    80001a8c:	02f70863          	beq	a4,a5,80001abc <_ZN3PCB8dispatchEv+0xcc>

inline void PCB::ms_status(uint64 mask) {
    __asm__ volatile("csrs sstatus, %[mask]" : : [mask]"r"(mask));
}
inline void PCB::mc_status(uint64 mask) {
    __asm__ volatile("csrc sstatus, %[mask]" : : [mask]"r"(mask));
    80001a90:	10000793          	li	a5,256
    80001a94:	1007b073          	csrc	sstatus,a5
    contextSwitch(&old->context,&running->context);
    80001a98:	02850593          	addi	a1,a0,40
    80001a9c:	02848513          	addi	a0,s1,40
    80001aa0:	fffff097          	auipc	ra,0xfffff
    80001aa4:	690080e7          	jalr	1680(ra) # 80001130 <_ZN3PCB13contextSwitchEPNS_7ContextES1_>
}
    80001aa8:	01813083          	ld	ra,24(sp)
    80001aac:	01013403          	ld	s0,16(sp)
    80001ab0:	00813483          	ld	s1,8(sp)
    80001ab4:	02010113          	addi	sp,sp,32
    80001ab8:	00008067          	ret
    __asm__ volatile("csrs sstatus, %[mask]" : : [mask]"r"(mask));
    80001abc:	10000793          	li	a5,256
    80001ac0:	1007a073          	csrs	sstatus,a5
}
    80001ac4:	fd5ff06f          	j	80001a98 <_ZN3PCB8dispatchEv+0xa8>

0000000080001ac8 <_ZN3PCB19allocateSystemStackEv>:
uint64 *PCB::allocateSystemStack() {
    80001ac8:	ff010113          	addi	sp,sp,-16
    80001acc:	00113423          	sd	ra,8(sp)
    80001ad0:	00813023          	sd	s0,0(sp)
    80001ad4:	01010413          	addi	s0,sp,16
    void* retAdr = MemoryAllocator::mem_alloc((size_t) sizeB);
    80001ad8:	00001537          	lui	a0,0x1
    80001adc:	04050513          	addi	a0,a0,64 # 1040 <_entry-0x7fffefc0>
    80001ae0:	00002097          	auipc	ra,0x2
    80001ae4:	ff8080e7          	jalr	-8(ra) # 80003ad8 <_ZN15MemoryAllocator9mem_allocEm>
    *header = sizeB;
    80001ae8:	04100793          	li	a5,65
    80001aec:	00f53023          	sd	a5,0(a0)
}
    80001af0:	00850513          	addi	a0,a0,8
    80001af4:	00813083          	ld	ra,8(sp)
    80001af8:	00013403          	ld	s0,0(sp)
    80001afc:	01010113          	addi	sp,sp,16
    80001b00:	00008067          	ret

0000000080001b04 <_ZN3PCB6getSSPEv>:
uint64 PCB::getSSP() {
    80001b04:	ff010113          	addi	sp,sp,-16
    80001b08:	00813423          	sd	s0,8(sp)
    80001b0c:	01010413          	addi	s0,sp,16
}
    80001b10:	03853503          	ld	a0,56(a0)
    80001b14:	00813403          	ld	s0,8(sp)
    80001b18:	01010113          	addi	sp,sp,16
    80001b1c:	00008067          	ret

0000000080001b20 <_ZN3PCB5getSPEv>:
uint64 PCB::getSP() {
    80001b20:	ff010113          	addi	sp,sp,-16
    80001b24:	00813423          	sd	s0,8(sp)
    80001b28:	01010413          	addi	s0,sp,16
}
    80001b2c:	03053503          	ld	a0,48(a0)
    80001b30:	00813403          	ld	s0,8(sp)
    80001b34:	01010113          	addi	sp,sp,16
    80001b38:	00008067          	ret

0000000080001b3c <_ZN3PCB6setSSPEm>:
void PCB::setSSP(uint64 ssp) {
    80001b3c:	ff010113          	addi	sp,sp,-16
    80001b40:	00813423          	sd	s0,8(sp)
    80001b44:	01010413          	addi	s0,sp,16
    this->context.ssp = ssp;
    80001b48:	02b53c23          	sd	a1,56(a0)
}
    80001b4c:	00813403          	ld	s0,8(sp)
    80001b50:	01010113          	addi	sp,sp,16
    80001b54:	00008067          	ret

0000000080001b58 <_ZN3PCB5setSPEm>:
void PCB::setSP(uint64 sp) {
    80001b58:	ff010113          	addi	sp,sp,-16
    80001b5c:	00813423          	sd	s0,8(sp)
    80001b60:	01010413          	addi	s0,sp,16
    this->context.sp = sp;
    80001b64:	02b53823          	sd	a1,48(a0)
}
    80001b68:	00813403          	ld	s0,8(sp)
    80001b6c:	01010113          	addi	sp,sp,16
    80001b70:	00008067          	ret

0000000080001b74 <_ZN8PCB_ListC1Ev>:
#include "../h/PCB_List.h"
#include "../h/MemoryAllocator.h"

PCB_List::PCB_List() {
    80001b74:	ff010113          	addi	sp,sp,-16
    80001b78:	00813423          	sd	s0,8(sp)
    80001b7c:	01010413          	addi	s0,sp,16
    head = nullptr;
    80001b80:	00053023          	sd	zero,0(a0)
    tail = nullptr;
    80001b84:	00053423          	sd	zero,8(a0)
}
    80001b88:	00813403          	ld	s0,8(sp)
    80001b8c:	01010113          	addi	sp,sp,16
    80001b90:	00008067          	ret

0000000080001b94 <_Z12allocateNodev>:
pcbnode* allocateNode(){
    80001b94:	ff010113          	addi	sp,sp,-16
    80001b98:	00113423          	sd	ra,8(sp)
    80001b9c:	00813023          	sd	s0,0(sp)
    80001ba0:	01010413          	addi	s0,sp,16
    size_t sizeB = ((size + ALLOCATED_HEADER_SIZE)/MEM_BLOCK_SIZE);
    if((size + ALLOCATED_HEADER_SIZE)%MEM_BLOCK_SIZE > 0){
        sizeB++;
    }
    sizeB*=MEM_BLOCK_SIZE;
    void* retAdr = MemoryAllocator::mem_alloc((size_t) sizeB);
    80001ba4:	04000513          	li	a0,64
    80001ba8:	00002097          	auipc	ra,0x2
    80001bac:	f30080e7          	jalr	-208(ra) # 80003ad8 <_ZN15MemoryAllocator9mem_allocEm>
    long* header = (long*) retAdr;
    sizeB/=MEM_BLOCK_SIZE;
    *header = sizeB;
    80001bb0:	00100793          	li	a5,1
    80001bb4:	00f53023          	sd	a5,0(a0)
    header++;
    return (pcbnode *)header;
}
    80001bb8:	00850513          	addi	a0,a0,8
    80001bbc:	00813083          	ld	ra,8(sp)
    80001bc0:	00013403          	ld	s0,0(sp)
    80001bc4:	01010113          	addi	sp,sp,16
    80001bc8:	00008067          	ret

0000000080001bcc <_ZN8PCB_List3putEP3PCB>:
void PCB_List::put(PCB* pcb) {
    80001bcc:	fe010113          	addi	sp,sp,-32
    80001bd0:	00113c23          	sd	ra,24(sp)
    80001bd4:	00813823          	sd	s0,16(sp)
    80001bd8:	00913423          	sd	s1,8(sp)
    80001bdc:	01213023          	sd	s2,0(sp)
    80001be0:	02010413          	addi	s0,sp,32
    80001be4:	00050493          	mv	s1,a0
    80001be8:	00058913          	mv	s2,a1

    pcbnode* tmp = allocateNode();
    80001bec:	00000097          	auipc	ra,0x0
    80001bf0:	fa8080e7          	jalr	-88(ra) # 80001b94 <_Z12allocateNodev>
    tmp->PCB = pcb;
    80001bf4:	01253023          	sd	s2,0(a0)
    tmp->next = nullptr;
    80001bf8:	00053823          	sd	zero,16(a0)
    if(tail == nullptr){
    80001bfc:	0084b783          	ld	a5,8(s1)
    80001c00:	02078663          	beqz	a5,80001c2c <_ZN8PCB_List3putEP3PCB+0x60>
        head = tmp;
        tail = tmp;
        return;
    }
    tail->next = tmp;
    80001c04:	00a7b823          	sd	a0,16(a5)
    tail = tail->next;
    80001c08:	0084b783          	ld	a5,8(s1)
    80001c0c:	0107b783          	ld	a5,16(a5)
    80001c10:	00f4b423          	sd	a5,8(s1)
}
    80001c14:	01813083          	ld	ra,24(sp)
    80001c18:	01013403          	ld	s0,16(sp)
    80001c1c:	00813483          	ld	s1,8(sp)
    80001c20:	00013903          	ld	s2,0(sp)
    80001c24:	02010113          	addi	sp,sp,32
    80001c28:	00008067          	ret
        head = tmp;
    80001c2c:	00a4b023          	sd	a0,0(s1)
        tail = tmp;
    80001c30:	00a4b423          	sd	a0,8(s1)
        return;
    80001c34:	fe1ff06f          	j	80001c14 <_ZN8PCB_List3putEP3PCB+0x48>

0000000080001c38 <_ZN8PCB_List3getEv>:

PCB *PCB_List::get() {
    80001c38:	fe010113          	addi	sp,sp,-32
    80001c3c:	00113c23          	sd	ra,24(sp)
    80001c40:	00813823          	sd	s0,16(sp)
    80001c44:	00913423          	sd	s1,8(sp)
    80001c48:	02010413          	addi	s0,sp,32
    80001c4c:	00050793          	mv	a5,a0
    if(head == nullptr) return nullptr;
    80001c50:	00053503          	ld	a0,0(a0)
    80001c54:	04050063          	beqz	a0,80001c94 <_ZN8PCB_List3getEv+0x5c>
    PCB* get = head->PCB;
    80001c58:	00053483          	ld	s1,0(a0)
    pcbnode* tmp = head;
    if(head->next!= nullptr)head = head->next;
    80001c5c:	01053703          	ld	a4,16(a0)
    80001c60:	02070463          	beqz	a4,80001c88 <_ZN8PCB_List3getEv+0x50>
    80001c64:	00e7b023          	sd	a4,0(a5)
    else{
        head = nullptr;
        tail = nullptr;
    }
   MemoryAllocator::mem_free((void *)tmp);
    80001c68:	00002097          	auipc	ra,0x2
    80001c6c:	e98080e7          	jalr	-360(ra) # 80003b00 <_ZN15MemoryAllocator8mem_freeEPv>
    return get;
}
    80001c70:	00048513          	mv	a0,s1
    80001c74:	01813083          	ld	ra,24(sp)
    80001c78:	01013403          	ld	s0,16(sp)
    80001c7c:	00813483          	ld	s1,8(sp)
    80001c80:	02010113          	addi	sp,sp,32
    80001c84:	00008067          	ret
        head = nullptr;
    80001c88:	0007b023          	sd	zero,0(a5)
        tail = nullptr;
    80001c8c:	0007b423          	sd	zero,8(a5)
    80001c90:	fd9ff06f          	j	80001c68 <_ZN8PCB_List3getEv+0x30>
    if(head == nullptr) return nullptr;
    80001c94:	00050493          	mv	s1,a0
    80001c98:	fd9ff06f          	j	80001c70 <_ZN8PCB_List3getEv+0x38>

0000000080001c9c <_ZN8PCB_List7putTimeEP3PCBm>:

void PCB_List::putTime(PCB *pcb, time_t timeLeft) {
    80001c9c:	fd010113          	addi	sp,sp,-48
    80001ca0:	02113423          	sd	ra,40(sp)
    80001ca4:	02813023          	sd	s0,32(sp)
    80001ca8:	00913c23          	sd	s1,24(sp)
    80001cac:	01213823          	sd	s2,16(sp)
    80001cb0:	01313423          	sd	s3,8(sp)
    80001cb4:	03010413          	addi	s0,sp,48
    80001cb8:	00050913          	mv	s2,a0
    80001cbc:	00058993          	mv	s3,a1
    80001cc0:	00060493          	mv	s1,a2
    pcbnode* tmp = allocateNode();
    80001cc4:	00000097          	auipc	ra,0x0
    80001cc8:	ed0080e7          	jalr	-304(ra) # 80001b94 <_Z12allocateNodev>
    tmp->next = nullptr;
    80001ccc:	00053823          	sd	zero,16(a0)
    tmp->PCB = pcb;
    80001cd0:	01353023          	sd	s3,0(a0)
    tmp->timeLeft =timeLeft;
    80001cd4:	00953423          	sd	s1,8(a0)
    if(head == nullptr){
    80001cd8:	00093583          	ld	a1,0(s2)
    80001cdc:	02058863          	beqz	a1,80001d0c <_ZN8PCB_List7putTimeEP3PCBm+0x70>
        tail->next = nullptr;
        return;
    }
    pcbnode* curr = head;
    pcbnode* prev = nullptr;
    time_t time = curr->timeLeft;
    80001ce0:	0085b703          	ld	a4,8(a1)
    pcbnode* curr = head;
    80001ce4:	00058693          	mv	a3,a1
    pcbnode* prev = nullptr;
    80001ce8:	00000613          	li	a2,0
    while (time < timeLeft && curr->next != nullptr){
    80001cec:	02977c63          	bgeu	a4,s1,80001d24 <_ZN8PCB_List7putTimeEP3PCBm+0x88>
    80001cf0:	0106b783          	ld	a5,16(a3)
    80001cf4:	02078863          	beqz	a5,80001d24 <_ZN8PCB_List7putTimeEP3PCBm+0x88>
        prev = curr;
        curr = curr->next;
        time+=curr->timeLeft;
    80001cf8:	0087b603          	ld	a2,8(a5)
    80001cfc:	00c70733          	add	a4,a4,a2
        prev = curr;
    80001d00:	00068613          	mv	a2,a3
        curr = curr->next;
    80001d04:	00078693          	mv	a3,a5
    while (time < timeLeft && curr->next != nullptr){
    80001d08:	fe5ff06f          	j	80001cec <_ZN8PCB_List7putTimeEP3PCBm+0x50>
        head = tmp;
    80001d0c:	00a93023          	sd	a0,0(s2)
        tail = tmp;
    80001d10:	00a93423          	sd	a0,8(s2)
        head->next = nullptr;
    80001d14:	00053823          	sd	zero,16(a0)
        tail->next = nullptr;
    80001d18:	00893783          	ld	a5,8(s2)
    80001d1c:	0007b823          	sd	zero,16(a5)
        return;
    80001d20:	0340006f          	j	80001d54 <_ZN8PCB_List7putTimeEP3PCBm+0xb8>
    }
    if(prev == nullptr){
    80001d24:	04060663          	beqz	a2,80001d70 <_ZN8PCB_List7putTimeEP3PCBm+0xd4>
            head->timeLeft -= timeLeft;
            head =tmp;
            if(head->next->next == nullptr) tail = head->next;
            return;
        }
    }else if(curr->next == nullptr){
    80001d28:	0106b783          	ld	a5,16(a3)
    80001d2c:	08078c63          	beqz	a5,80001dc4 <_ZN8PCB_List7putTimeEP3PCBm+0x128>
            tmp->timeLeft = timeLeft - time + curr->timeLeft;
            curr->timeLeft-=tmp->timeLeft;
            return;
        }
    } else{
        tmp->next = curr;
    80001d30:	00d53823          	sd	a3,16(a0)
        prev->next = tmp;
    80001d34:	00a63823          	sd	a0,16(a2)
        tmp->timeLeft = timeLeft - time + curr->timeLeft;
    80001d38:	40e48733          	sub	a4,s1,a4
    80001d3c:	0086b483          	ld	s1,8(a3)
    80001d40:	00970733          	add	a4,a4,s1
    80001d44:	00e53423          	sd	a4,8(a0)
        curr->timeLeft-=tmp->timeLeft;
    80001d48:	0086b783          	ld	a5,8(a3)
    80001d4c:	40e78733          	sub	a4,a5,a4
    80001d50:	00e6b423          	sd	a4,8(a3)
        return;
    }
}
    80001d54:	02813083          	ld	ra,40(sp)
    80001d58:	02013403          	ld	s0,32(sp)
    80001d5c:	01813483          	ld	s1,24(sp)
    80001d60:	01013903          	ld	s2,16(sp)
    80001d64:	00813983          	ld	s3,8(sp)
    80001d68:	03010113          	addi	sp,sp,48
    80001d6c:	00008067          	ret
        if(time <= timeLeft){
    80001d70:	02e4e663          	bltu	s1,a4,80001d9c <_ZN8PCB_List7putTimeEP3PCBm+0x100>
            tmp->next = head->next;
    80001d74:	0105b783          	ld	a5,16(a1)
    80001d78:	00f53823          	sd	a5,16(a0)
            head->next = tmp;
    80001d7c:	00093783          	ld	a5,0(s2)
    80001d80:	00a7b823          	sd	a0,16(a5)
            tmp->timeLeft = timeLeft - time;
    80001d84:	40e48733          	sub	a4,s1,a4
    80001d88:	00e53423          	sd	a4,8(a0)
            if(tmp->next == nullptr) tail =tmp;
    80001d8c:	01053783          	ld	a5,16(a0)
    80001d90:	fc0792e3          	bnez	a5,80001d54 <_ZN8PCB_List7putTimeEP3PCBm+0xb8>
    80001d94:	00a93423          	sd	a0,8(s2)
            return;
    80001d98:	fbdff06f          	j	80001d54 <_ZN8PCB_List7putTimeEP3PCBm+0xb8>
            tmp->next = head;
    80001d9c:	00b53823          	sd	a1,16(a0)
            head->timeLeft -= timeLeft;
    80001da0:	0085b703          	ld	a4,8(a1)
    80001da4:	40970733          	sub	a4,a4,s1
    80001da8:	00e5b423          	sd	a4,8(a1)
            head =tmp;
    80001dac:	00a93023          	sd	a0,0(s2)
            if(head->next->next == nullptr) tail = head->next;
    80001db0:	01053783          	ld	a5,16(a0)
    80001db4:	0107b703          	ld	a4,16(a5)
    80001db8:	f8071ee3          	bnez	a4,80001d54 <_ZN8PCB_List7putTimeEP3PCBm+0xb8>
    80001dbc:	00f93423          	sd	a5,8(s2)
            return;
    80001dc0:	f95ff06f          	j	80001d54 <_ZN8PCB_List7putTimeEP3PCBm+0xb8>
        if(time <= timeLeft){
    80001dc4:	00e4ee63          	bltu	s1,a4,80001de0 <_ZN8PCB_List7putTimeEP3PCBm+0x144>
            curr->next = tmp;
    80001dc8:	00a6b823          	sd	a0,16(a3)
            tmp->next = nullptr;
    80001dcc:	00053823          	sd	zero,16(a0)
            tmp->timeLeft = timeLeft - time;
    80001dd0:	40e48733          	sub	a4,s1,a4
    80001dd4:	00e53423          	sd	a4,8(a0)
            tail = tmp;
    80001dd8:	00a93423          	sd	a0,8(s2)
            return;
    80001ddc:	f79ff06f          	j	80001d54 <_ZN8PCB_List7putTimeEP3PCBm+0xb8>
            tmp->next = curr;
    80001de0:	00d53823          	sd	a3,16(a0)
            prev->next = tmp;
    80001de4:	00a63823          	sd	a0,16(a2)
            tmp->timeLeft = timeLeft - time + curr->timeLeft;
    80001de8:	40e48733          	sub	a4,s1,a4
    80001dec:	0086b783          	ld	a5,8(a3)
    80001df0:	00f70733          	add	a4,a4,a5
    80001df4:	00e53423          	sd	a4,8(a0)
            curr->timeLeft-=tmp->timeLeft;
    80001df8:	0086b783          	ld	a5,8(a3)
    80001dfc:	40e78733          	sub	a4,a5,a4
    80001e00:	00e6b423          	sd	a4,8(a3)
            return;
    80001e04:	f51ff06f          	j	80001d54 <_ZN8PCB_List7putTimeEP3PCBm+0xb8>

0000000080001e08 <_ZN8PCB_List11getTimeLeftEv>:

time_t PCB_List::getTimeLeft() {
    80001e08:	ff010113          	addi	sp,sp,-16
    80001e0c:	00813423          	sd	s0,8(sp)
    80001e10:	01010413          	addi	s0,sp,16
    if(head == nullptr){
    80001e14:	00053783          	ld	a5,0(a0)
    80001e18:	00078a63          	beqz	a5,80001e2c <_ZN8PCB_List11getTimeLeftEv+0x24>
        return -1;
    } else{
        return head->timeLeft;
    80001e1c:	0087b503          	ld	a0,8(a5)
    }
}
    80001e20:	00813403          	ld	s0,8(sp)
    80001e24:	01010113          	addi	sp,sp,16
    80001e28:	00008067          	ret
        return -1;
    80001e2c:	fff00513          	li	a0,-1
    80001e30:	ff1ff06f          	j	80001e20 <_ZN8PCB_List11getTimeLeftEv+0x18>

0000000080001e34 <_ZN8PCB_List7decTimeEv>:

void PCB_List::decTime() {
    80001e34:	ff010113          	addi	sp,sp,-16
    80001e38:	00813423          	sd	s0,8(sp)
    80001e3c:	01010413          	addi	s0,sp,16
    if(head!= nullptr && head->timeLeft > 0){
    80001e40:	00053783          	ld	a5,0(a0)
    80001e44:	00078a63          	beqz	a5,80001e58 <_ZN8PCB_List7decTimeEv+0x24>
    80001e48:	0087b703          	ld	a4,8(a5)
    80001e4c:	00070663          	beqz	a4,80001e58 <_ZN8PCB_List7decTimeEv+0x24>
        head->timeLeft--;
    80001e50:	fff70713          	addi	a4,a4,-1
    80001e54:	00e7b423          	sd	a4,8(a5)
    }
}
    80001e58:	00813403          	ld	s0,8(sp)
    80001e5c:	01010113          	addi	sp,sp,16
    80001e60:	00008067          	ret

0000000080001e64 <_ZN8PCB_List7setNullEv>:

void PCB_List::setNull() {
    80001e64:	ff010113          	addi	sp,sp,-16
    80001e68:	00813423          	sd	s0,8(sp)
    80001e6c:	01010413          	addi	s0,sp,16
    this->head = nullptr;
    80001e70:	00053023          	sd	zero,0(a0)
    this->tail = nullptr;
    80001e74:	00053423          	sd	zero,8(a0)
}
    80001e78:	00813403          	ld	s0,8(sp)
    80001e7c:	01010113          	addi	sp,sp,16
    80001e80:	00008067          	ret

0000000080001e84 <_Z12allocateListv>:
#include "../h/Sem.h"
#include "../h/PCB.h"


PCB_List* allocateList(){
    80001e84:	ff010113          	addi	sp,sp,-16
    80001e88:	00113423          	sd	ra,8(sp)
    80001e8c:	00813023          	sd	s0,0(sp)
    80001e90:	01010413          	addi	s0,sp,16
    uint64 inBlocks = size/MEM_BLOCK_SIZE;
    if(size%MEM_BLOCK_SIZE!=0){
        inBlocks++;
    }
    inBlocks*=MEM_BLOCK_SIZE;
    void* retAdr = MemoryAllocator::mem_alloc((size_t) inBlocks);
    80001e94:	04000513          	li	a0,64
    80001e98:	00002097          	auipc	ra,0x2
    80001e9c:	c40080e7          	jalr	-960(ra) # 80003ad8 <_ZN15MemoryAllocator9mem_allocEm>
    long* header = (long*) retAdr;
    inBlocks/=MEM_BLOCK_SIZE;
    *header = inBlocks;
    80001ea0:	00100793          	li	a5,1
    80001ea4:	00f53023          	sd	a5,0(a0)
    header++;
    void* ret = (void*)header;
    return (PCB_List*)ret;
}
    80001ea8:	00850513          	addi	a0,a0,8
    80001eac:	00813083          	ld	ra,8(sp)
    80001eb0:	00013403          	ld	s0,0(sp)
    80001eb4:	01010113          	addi	sp,sp,16
    80001eb8:	00008067          	ret

0000000080001ebc <_ZN3SemC1Ei>:

Sem::Sem(int init) {
    80001ebc:	fe010113          	addi	sp,sp,-32
    80001ec0:	00113c23          	sd	ra,24(sp)
    80001ec4:	00813823          	sd	s0,16(sp)
    80001ec8:	00913423          	sd	s1,8(sp)
    80001ecc:	02010413          	addi	s0,sp,32
    80001ed0:	00050493          	mv	s1,a0
    count = init;
    80001ed4:	00b52023          	sw	a1,0(a0)
    waiting_PCB =allocateList();
    80001ed8:	00000097          	auipc	ra,0x0
    80001edc:	fac080e7          	jalr	-84(ra) # 80001e84 <_Z12allocateListv>
    80001ee0:	00a4b423          	sd	a0,8(s1)
    waiting_PCB->setNull();
    80001ee4:	00000097          	auipc	ra,0x0
    80001ee8:	f80080e7          	jalr	-128(ra) # 80001e64 <_ZN8PCB_List7setNullEv>
}
    80001eec:	01813083          	ld	ra,24(sp)
    80001ef0:	01013403          	ld	s0,16(sp)
    80001ef4:	00813483          	ld	s1,8(sp)
    80001ef8:	02010113          	addi	sp,sp,32
    80001efc:	00008067          	ret

0000000080001f00 <_ZN3Sem5valueEv>:
//    Interrupt::lock();
    if(++count<=0)unblock();
//    Interrupt::unlock();
}

int Sem::value() {
    80001f00:	ff010113          	addi	sp,sp,-16
    80001f04:	00813423          	sd	s0,8(sp)
    80001f08:	01010413          	addi	s0,sp,16
    return count;
}
    80001f0c:	00052503          	lw	a0,0(a0)
    80001f10:	00813403          	ld	s0,8(sp)
    80001f14:	01010113          	addi	sp,sp,16
    80001f18:	00008067          	ret

0000000080001f1c <_ZN3Sem5blockEv>:

void Sem::block() {
    80001f1c:	fe010113          	addi	sp,sp,-32
    80001f20:	00113c23          	sd	ra,24(sp)
    80001f24:	00813823          	sd	s0,16(sp)
    80001f28:	00913423          	sd	s1,8(sp)
    80001f2c:	02010413          	addi	s0,sp,32
    waiting_PCB->put(PCB::running);
    80001f30:	00008497          	auipc	s1,0x8
    80001f34:	1b84b483          	ld	s1,440(s1) # 8000a0e8 <_GLOBAL_OFFSET_TABLE_+0x60>
    80001f38:	0004b583          	ld	a1,0(s1)
    80001f3c:	00853503          	ld	a0,8(a0)
    80001f40:	00000097          	auipc	ra,0x0
    80001f44:	c8c080e7          	jalr	-884(ra) # 80001bcc <_ZN8PCB_List3putEP3PCB>
    PCB::running->setBlocked(true);
    80001f48:	00100593          	li	a1,1
    80001f4c:	0004b503          	ld	a0,0(s1)
    80001f50:	00000097          	auipc	ra,0x0
    80001f54:	924080e7          	jalr	-1756(ra) # 80001874 <_ZN3PCB10setBlockedEb>
    PCB::timeLeft = 0;
    80001f58:	00008797          	auipc	a5,0x8
    80001f5c:	1687b783          	ld	a5,360(a5) # 8000a0c0 <_GLOBAL_OFFSET_TABLE_+0x38>
    80001f60:	0007b023          	sd	zero,0(a5)
    PCB::dispatch();
    80001f64:	00000097          	auipc	ra,0x0
    80001f68:	a8c080e7          	jalr	-1396(ra) # 800019f0 <_ZN3PCB8dispatchEv>
}
    80001f6c:	01813083          	ld	ra,24(sp)
    80001f70:	01013403          	ld	s0,16(sp)
    80001f74:	00813483          	ld	s1,8(sp)
    80001f78:	02010113          	addi	sp,sp,32
    80001f7c:	00008067          	ret

0000000080001f80 <_ZN3Sem4waitEv>:
    if(--count<0)block();
    80001f80:	00052783          	lw	a5,0(a0)
    80001f84:	fff7879b          	addiw	a5,a5,-1
    80001f88:	00f52023          	sw	a5,0(a0)
    80001f8c:	02079713          	slli	a4,a5,0x20
    80001f90:	00074463          	bltz	a4,80001f98 <_ZN3Sem4waitEv+0x18>
    80001f94:	00008067          	ret
void Sem::wait() {
    80001f98:	ff010113          	addi	sp,sp,-16
    80001f9c:	00113423          	sd	ra,8(sp)
    80001fa0:	00813023          	sd	s0,0(sp)
    80001fa4:	01010413          	addi	s0,sp,16
    if(--count<0)block();
    80001fa8:	00000097          	auipc	ra,0x0
    80001fac:	f74080e7          	jalr	-140(ra) # 80001f1c <_ZN3Sem5blockEv>
}
    80001fb0:	00813083          	ld	ra,8(sp)
    80001fb4:	00013403          	ld	s0,0(sp)
    80001fb8:	01010113          	addi	sp,sp,16
    80001fbc:	00008067          	ret

0000000080001fc0 <_ZN3Sem7unblockEv>:

void Sem::unblock() {
    80001fc0:	fe010113          	addi	sp,sp,-32
    80001fc4:	00113c23          	sd	ra,24(sp)
    80001fc8:	00813823          	sd	s0,16(sp)
    80001fcc:	00913423          	sd	s1,8(sp)
    80001fd0:	02010413          	addi	s0,sp,32
    PCB* pcb = waiting_PCB->get();
    80001fd4:	00853503          	ld	a0,8(a0)
    80001fd8:	00000097          	auipc	ra,0x0
    80001fdc:	c60080e7          	jalr	-928(ra) # 80001c38 <_ZN8PCB_List3getEv>
    if(pcb == nullptr) return;
    80001fe0:	02050263          	beqz	a0,80002004 <_ZN3Sem7unblockEv+0x44>
    80001fe4:	00050493          	mv	s1,a0
    pcb->setBlocked(false);
    80001fe8:	00000593          	li	a1,0
    80001fec:	00000097          	auipc	ra,0x0
    80001ff0:	888080e7          	jalr	-1912(ra) # 80001874 <_ZN3PCB10setBlockedEb>
    pcb->unblockError = false;
    80001ff4:	00048023          	sb	zero,0(s1)
    Scheduler::put(pcb);
    80001ff8:	00048513          	mv	a0,s1
    80001ffc:	00000097          	auipc	ra,0x0
    80002000:	100080e7          	jalr	256(ra) # 800020fc <_ZN9Scheduler3putEP3PCB>
    //PCB::dispatch();
}
    80002004:	01813083          	ld	ra,24(sp)
    80002008:	01013403          	ld	s0,16(sp)
    8000200c:	00813483          	ld	s1,8(sp)
    80002010:	02010113          	addi	sp,sp,32
    80002014:	00008067          	ret

0000000080002018 <_ZN3Sem6signalEv>:
    if(++count<=0)unblock();
    80002018:	00052783          	lw	a5,0(a0)
    8000201c:	0017879b          	addiw	a5,a5,1
    80002020:	0007871b          	sext.w	a4,a5
    80002024:	00f52023          	sw	a5,0(a0)
    80002028:	00e05463          	blez	a4,80002030 <_ZN3Sem6signalEv+0x18>
    8000202c:	00008067          	ret
void Sem::signal() {
    80002030:	ff010113          	addi	sp,sp,-16
    80002034:	00113423          	sd	ra,8(sp)
    80002038:	00813023          	sd	s0,0(sp)
    8000203c:	01010413          	addi	s0,sp,16
    if(++count<=0)unblock();
    80002040:	00000097          	auipc	ra,0x0
    80002044:	f80080e7          	jalr	-128(ra) # 80001fc0 <_ZN3Sem7unblockEv>
}
    80002048:	00813083          	ld	ra,8(sp)
    8000204c:	00013403          	ld	s0,0(sp)
    80002050:	01010113          	addi	sp,sp,16
    80002054:	00008067          	ret

0000000080002058 <_ZN3Sem11allocateSemEv>:

void *Sem::allocateSem() {
    80002058:	ff010113          	addi	sp,sp,-16
    8000205c:	00113423          	sd	ra,8(sp)
    80002060:	00813023          	sd	s0,0(sp)
    80002064:	01010413          	addi	s0,sp,16
    uint64 inBlocks = size/MEM_BLOCK_SIZE;
    if(size%MEM_BLOCK_SIZE!=0){
        inBlocks++;
    }
    inBlocks*=MEM_BLOCK_SIZE;
    void* retAdr = MemoryAllocator::mem_alloc((size_t) inBlocks);
    80002068:	04000513          	li	a0,64
    8000206c:	00002097          	auipc	ra,0x2
    80002070:	a6c080e7          	jalr	-1428(ra) # 80003ad8 <_ZN15MemoryAllocator9mem_allocEm>
    long* header = (long*) retAdr;
    inBlocks/=MEM_BLOCK_SIZE;
    *header = inBlocks;
    80002074:	00100793          	li	a5,1
    80002078:	00f53023          	sd	a5,0(a0)
    header++;
    void* ret = (void*)header;
    return ret;
}
    8000207c:	00850513          	addi	a0,a0,8
    80002080:	00813083          	ld	ra,8(sp)
    80002084:	00013403          	ld	s0,0(sp)
    80002088:	01010113          	addi	sp,sp,16
    8000208c:	00008067          	ret

0000000080002090 <_ZN3Sem10deblockAllEv>:

void Sem::deblockAll() {
    80002090:	fe010113          	addi	sp,sp,-32
    80002094:	00113c23          	sd	ra,24(sp)
    80002098:	00813823          	sd	s0,16(sp)
    8000209c:	00913423          	sd	s1,8(sp)
    800020a0:	01213023          	sd	s2,0(sp)
    800020a4:	02010413          	addi	s0,sp,32
    800020a8:	00050913          	mv	s2,a0
    PCB* pcb;
    while((pcb = waiting_PCB->get())!= nullptr){
    800020ac:	00893503          	ld	a0,8(s2)
    800020b0:	00000097          	auipc	ra,0x0
    800020b4:	b88080e7          	jalr	-1144(ra) # 80001c38 <_ZN8PCB_List3getEv>
    800020b8:	00050493          	mv	s1,a0
    800020bc:	02050463          	beqz	a0,800020e4 <_ZN3Sem10deblockAllEv+0x54>
        pcb->setBlocked(false);
    800020c0:	00000593          	li	a1,0
    800020c4:	fffff097          	auipc	ra,0xfffff
    800020c8:	7b0080e7          	jalr	1968(ra) # 80001874 <_ZN3PCB10setBlockedEb>
        pcb->unblockError = true;
    800020cc:	00100793          	li	a5,1
    800020d0:	00f48023          	sb	a5,0(s1)
        Scheduler::put(pcb);
    800020d4:	00048513          	mv	a0,s1
    800020d8:	00000097          	auipc	ra,0x0
    800020dc:	024080e7          	jalr	36(ra) # 800020fc <_ZN9Scheduler3putEP3PCB>
    while((pcb = waiting_PCB->get())!= nullptr){
    800020e0:	fcdff06f          	j	800020ac <_ZN3Sem10deblockAllEv+0x1c>
    }
}
    800020e4:	01813083          	ld	ra,24(sp)
    800020e8:	01013403          	ld	s0,16(sp)
    800020ec:	00813483          	ld	s1,8(sp)
    800020f0:	00013903          	ld	s2,0(sp)
    800020f4:	02010113          	addi	sp,sp,32
    800020f8:	00008067          	ret

00000000800020fc <_ZN9Scheduler3putEP3PCB>:


PCB* Scheduler::head = nullptr;
PCB* Scheduler::tail = nullptr;

void Scheduler::put(PCB *pcb) {
    800020fc:	fe010113          	addi	sp,sp,-32
    80002100:	00113c23          	sd	ra,24(sp)
    80002104:	00813823          	sd	s0,16(sp)
    80002108:	00913423          	sd	s1,8(sp)
    8000210c:	01213023          	sd	s2,0(sp)
    80002110:	02010413          	addi	s0,sp,32
    80002114:	00050493          	mv	s1,a0
    if(head == nullptr){
    80002118:	00008797          	auipc	a5,0x8
    8000211c:	0587b783          	ld	a5,88(a5) # 8000a170 <_ZN9Scheduler4headE>
    80002120:	04078863          	beqz	a5,80002170 <_ZN9Scheduler3putEP3PCB+0x74>
        head->setNext(nullptr);
        tail = pcb;
        tail->setNext(nullptr);
    }
    else{
        tail->setNext(pcb);
    80002124:	00008917          	auipc	s2,0x8
    80002128:	04c90913          	addi	s2,s2,76 # 8000a170 <_ZN9Scheduler4headE>
    8000212c:	00050593          	mv	a1,a0
    80002130:	00893503          	ld	a0,8(s2)
    80002134:	fffff097          	auipc	ra,0xfffff
    80002138:	594080e7          	jalr	1428(ra) # 800016c8 <_ZN3PCB7setNextEPS_>
        tail = tail->getNext();
    8000213c:	00893503          	ld	a0,8(s2)
    80002140:	fffff097          	auipc	ra,0xfffff
    80002144:	56c080e7          	jalr	1388(ra) # 800016ac <_ZN3PCB7getNextEv>
    80002148:	00a93423          	sd	a0,8(s2)
        tail->setNext(nullptr);
    8000214c:	00000593          	li	a1,0
    80002150:	fffff097          	auipc	ra,0xfffff
    80002154:	578080e7          	jalr	1400(ra) # 800016c8 <_ZN3PCB7setNextEPS_>
    }
}
    80002158:	01813083          	ld	ra,24(sp)
    8000215c:	01013403          	ld	s0,16(sp)
    80002160:	00813483          	ld	s1,8(sp)
    80002164:	00013903          	ld	s2,0(sp)
    80002168:	02010113          	addi	sp,sp,32
    8000216c:	00008067          	ret
        head = pcb;
    80002170:	00008917          	auipc	s2,0x8
    80002174:	00090913          	mv	s2,s2
    80002178:	00a93023          	sd	a0,0(s2) # 8000a170 <_ZN9Scheduler4headE>
        head->setNext(nullptr);
    8000217c:	00000593          	li	a1,0
    80002180:	fffff097          	auipc	ra,0xfffff
    80002184:	548080e7          	jalr	1352(ra) # 800016c8 <_ZN3PCB7setNextEPS_>
        tail = pcb;
    80002188:	00993423          	sd	s1,8(s2)
        tail->setNext(nullptr);
    8000218c:	00000593          	li	a1,0
    80002190:	00048513          	mv	a0,s1
    80002194:	fffff097          	auipc	ra,0xfffff
    80002198:	534080e7          	jalr	1332(ra) # 800016c8 <_ZN3PCB7setNextEPS_>
    8000219c:	fbdff06f          	j	80002158 <_ZN9Scheduler3putEP3PCB+0x5c>

00000000800021a0 <_ZN9Scheduler3getEv>:

PCB *Scheduler::get() {
    800021a0:	fe010113          	addi	sp,sp,-32
    800021a4:	00113c23          	sd	ra,24(sp)
    800021a8:	00813823          	sd	s0,16(sp)
    800021ac:	00913423          	sd	s1,8(sp)
    800021b0:	01213023          	sd	s2,0(sp)
    800021b4:	02010413          	addi	s0,sp,32
    if(head== nullptr) return nullptr;
    800021b8:	00008497          	auipc	s1,0x8
    800021bc:	fb84b483          	ld	s1,-72(s1) # 8000a170 <_ZN9Scheduler4headE>
    800021c0:	02048e63          	beqz	s1,800021fc <_ZN9Scheduler3getEv+0x5c>
    PCB* pom = head;
    if(head->getNext() == nullptr){
    800021c4:	00048513          	mv	a0,s1
    800021c8:	fffff097          	auipc	ra,0xfffff
    800021cc:	4e4080e7          	jalr	1252(ra) # 800016ac <_ZN3PCB7getNextEv>
    800021d0:	04050463          	beqz	a0,80002218 <_ZN9Scheduler3getEv+0x78>
        head = nullptr;
        tail = nullptr;
    } else {
        head = head->getNext();
    800021d4:	00008917          	auipc	s2,0x8
    800021d8:	f9c90913          	addi	s2,s2,-100 # 8000a170 <_ZN9Scheduler4headE>
    800021dc:	00093503          	ld	a0,0(s2)
    800021e0:	fffff097          	auipc	ra,0xfffff
    800021e4:	4cc080e7          	jalr	1228(ra) # 800016ac <_ZN3PCB7getNextEv>
    800021e8:	00a93023          	sd	a0,0(s2)
    }
    pom->setNext(nullptr);
    800021ec:	00000593          	li	a1,0
    800021f0:	00048513          	mv	a0,s1
    800021f4:	fffff097          	auipc	ra,0xfffff
    800021f8:	4d4080e7          	jalr	1236(ra) # 800016c8 <_ZN3PCB7setNextEPS_>
    return pom;
}
    800021fc:	00048513          	mv	a0,s1
    80002200:	01813083          	ld	ra,24(sp)
    80002204:	01013403          	ld	s0,16(sp)
    80002208:	00813483          	ld	s1,8(sp)
    8000220c:	00013903          	ld	s2,0(sp)
    80002210:	02010113          	addi	sp,sp,32
    80002214:	00008067          	ret
        head = nullptr;
    80002218:	00008797          	auipc	a5,0x8
    8000221c:	f5878793          	addi	a5,a5,-168 # 8000a170 <_ZN9Scheduler4headE>
    80002220:	0007b023          	sd	zero,0(a5)
        tail = nullptr;
    80002224:	0007b423          	sd	zero,8(a5)
    80002228:	fc5ff06f          	j	800021ec <_ZN9Scheduler3getEv+0x4c>

000000008000222c <_ZN9SchedulerC1Ev>:

Scheduler::Scheduler() {
    8000222c:	ff010113          	addi	sp,sp,-16
    80002230:	00813423          	sd	s0,8(sp)
    80002234:	01010413          	addi	s0,sp,16

}
    80002238:	00813403          	ld	s0,8(sp)
    8000223c:	01010113          	addi	sp,sp,16
    80002240:	00008067          	ret

0000000080002244 <_ZN9Scheduler9moreProcsEv>:

bool Scheduler::moreProcs() {
    80002244:	ff010113          	addi	sp,sp,-16
    80002248:	00813423          	sd	s0,8(sp)
    8000224c:	01010413          	addi	s0,sp,16
    return head != nullptr;
}
    80002250:	00008517          	auipc	a0,0x8
    80002254:	f2053503          	ld	a0,-224(a0) # 8000a170 <_ZN9Scheduler4headE>
    80002258:	00a03533          	snez	a0,a0
    8000225c:	00813403          	ld	s0,8(sp)
    80002260:	01010113          	addi	sp,sp,16
    80002264:	00008067          	ret

0000000080002268 <_Z7wrapperPv>:
    return res;
}


void wrapper(void *t) {
    if (t) {
    80002268:	02050863          	beqz	a0,80002298 <_Z7wrapperPv+0x30>
void wrapper(void *t) {
    8000226c:	ff010113          	addi	sp,sp,-16
    80002270:	00113423          	sd	ra,8(sp)
    80002274:	00813023          	sd	s0,0(sp)
    80002278:	01010413          	addi	s0,sp,16
        ((Thread *) t)->run();
    8000227c:	00053783          	ld	a5,0(a0)
    80002280:	0107b783          	ld	a5,16(a5)
    80002284:	000780e7          	jalr	a5
    }
}
    80002288:	00813083          	ld	ra,8(sp)
    8000228c:	00013403          	ld	s0,0(sp)
    80002290:	01010113          	addi	sp,sp,16
    80002294:	00008067          	ret
    80002298:	00008067          	ret

000000008000229c <_ZN6ThreadC1EPFvPvES0_>:
Thread::Thread(void (*body)(void *), void *arg) {
    8000229c:	ff010113          	addi	sp,sp,-16
    800022a0:	00113423          	sd	ra,8(sp)
    800022a4:	00813023          	sd	s0,0(sp)
    800022a8:	01010413          	addi	s0,sp,16
    800022ac:	00008797          	auipc	a5,0x8
    800022b0:	c4c78793          	addi	a5,a5,-948 # 80009ef8 <_ZTV6Thread+0x10>
    800022b4:	00f53023          	sd	a5,0(a0)
    int res = thread_init(&myHandle,body,arg);
    800022b8:	00850513          	addi	a0,a0,8
    800022bc:	fffff097          	auipc	ra,0xfffff
    800022c0:	064080e7          	jalr	100(ra) # 80001320 <thread_init>
    if(res < 0){
    800022c4:	00054a63          	bltz	a0,800022d8 <_ZN6ThreadC1EPFvPvES0_+0x3c>
}
    800022c8:	00813083          	ld	ra,8(sp)
    800022cc:	00013403          	ld	s0,0(sp)
    800022d0:	01010113          	addi	sp,sp,16
    800022d4:	00008067          	ret
        ::putc('!');
    800022d8:	02100513          	li	a0,33
    800022dc:	fffff097          	auipc	ra,0xfffff
    800022e0:	364080e7          	jalr	868(ra) # 80001640 <putc>
        ::putc('\n');
    800022e4:	00a00513          	li	a0,10
    800022e8:	fffff097          	auipc	ra,0xfffff
    800022ec:	358080e7          	jalr	856(ra) # 80001640 <putc>
}
    800022f0:	fd9ff06f          	j	800022c8 <_ZN6ThreadC1EPFvPvES0_+0x2c>

00000000800022f4 <_ZN9SemaphoreC1Ej>:
Semaphore::Semaphore(unsigned int init) {
    800022f4:	ff010113          	addi	sp,sp,-16
    800022f8:	00113423          	sd	ra,8(sp)
    800022fc:	00813023          	sd	s0,0(sp)
    80002300:	01010413          	addi	s0,sp,16
    80002304:	00008797          	auipc	a5,0x8
    80002308:	c1c78793          	addi	a5,a5,-996 # 80009f20 <_ZTV9Semaphore+0x10>
    8000230c:	00f53023          	sd	a5,0(a0)
    int res = sem_open(&myHandle,init);
    80002310:	00850513          	addi	a0,a0,8
    80002314:	fffff097          	auipc	ra,0xfffff
    80002318:	128080e7          	jalr	296(ra) # 8000143c <sem_open>
    if(res < 0){
    8000231c:	00054a63          	bltz	a0,80002330 <_ZN9SemaphoreC1Ej+0x3c>
}
    80002320:	00813083          	ld	ra,8(sp)
    80002324:	00013403          	ld	s0,0(sp)
    80002328:	01010113          	addi	sp,sp,16
    8000232c:	00008067          	ret
        ::putc('!');
    80002330:	02100513          	li	a0,33
    80002334:	fffff097          	auipc	ra,0xfffff
    80002338:	30c080e7          	jalr	780(ra) # 80001640 <putc>
        ::putc('\n');
    8000233c:	00a00513          	li	a0,10
    80002340:	fffff097          	auipc	ra,0xfffff
    80002344:	300080e7          	jalr	768(ra) # 80001640 <putc>
}
    80002348:	fd9ff06f          	j	80002320 <_ZN9SemaphoreC1Ej+0x2c>

000000008000234c <_ZN6Thread5startEv>:
    if(this->myHandle->PCB == nullptr) return -1;
    8000234c:	00853783          	ld	a5,8(a0)
    80002350:	0007b503          	ld	a0,0(a5)
    80002354:	02050863          	beqz	a0,80002384 <_ZN6Thread5startEv+0x38>
int Thread::start() {
    80002358:	ff010113          	addi	sp,sp,-16
    8000235c:	00113423          	sd	ra,8(sp)
    80002360:	00813023          	sd	s0,0(sp)
    80002364:	01010413          	addi	s0,sp,16
    ((PCB*)this->myHandle->PCB)->start();
    80002368:	fffff097          	auipc	ra,0xfffff
    8000236c:	544080e7          	jalr	1348(ra) # 800018ac <_ZN3PCB5startEv>
    return 0;
    80002370:	00000513          	li	a0,0
}
    80002374:	00813083          	ld	ra,8(sp)
    80002378:	00013403          	ld	s0,0(sp)
    8000237c:	01010113          	addi	sp,sp,16
    80002380:	00008067          	ret
    if(this->myHandle->PCB == nullptr) return -1;
    80002384:	fff00513          	li	a0,-1
}
    80002388:	00008067          	ret

000000008000238c <_ZN6Thread8dispatchEv>:
void Thread::dispatch() {
    8000238c:	ff010113          	addi	sp,sp,-16
    80002390:	00113423          	sd	ra,8(sp)
    80002394:	00813023          	sd	s0,0(sp)
    80002398:	01010413          	addi	s0,sp,16
    thread_dispatch();
    8000239c:	fffff097          	auipc	ra,0xfffff
    800023a0:	018080e7          	jalr	24(ra) # 800013b4 <thread_dispatch>
}
    800023a4:	00813083          	ld	ra,8(sp)
    800023a8:	00013403          	ld	s0,0(sp)
    800023ac:	01010113          	addi	sp,sp,16
    800023b0:	00008067          	ret

00000000800023b4 <_ZN6Thread5sleepEm>:
int Thread::sleep(time_t time) {
    800023b4:	ff010113          	addi	sp,sp,-16
    800023b8:	00113423          	sd	ra,8(sp)
    800023bc:	00813023          	sd	s0,0(sp)
    800023c0:	01010413          	addi	s0,sp,16
    int res = time_sleep(time);
    800023c4:	fffff097          	auipc	ra,0xfffff
    800023c8:	19c080e7          	jalr	412(ra) # 80001560 <time_sleep>
}
    800023cc:	00813083          	ld	ra,8(sp)
    800023d0:	00013403          	ld	s0,0(sp)
    800023d4:	01010113          	addi	sp,sp,16
    800023d8:	00008067          	ret

00000000800023dc <_Z15periodicWrapperPv>:
typedef struct {
    PeriodicThread* t;
    time_t time;
} periodicArgs;
void periodicWrapper(void *args){
    800023dc:	fe010113          	addi	sp,sp,-32
    800023e0:	00113c23          	sd	ra,24(sp)
    800023e4:	00813823          	sd	s0,16(sp)
    800023e8:	00913423          	sd	s1,8(sp)
    800023ec:	01213023          	sd	s2,0(sp)
    800023f0:	02010413          	addi	s0,sp,32
    time_t times = ((periodicArgs*)args)->time;
    800023f4:	00853903          	ld	s2,8(a0)
    PeriodicThread* threads = (PeriodicThread *) ((periodicArgs*)args)->t;
    800023f8:	00053483          	ld	s1,0(a0)
    if(((periodicArgs*)args)->t){
    800023fc:	02048263          	beqz	s1,80002420 <_Z15periodicWrapperPv+0x44>
        while (true){
            threads->periodicActivation();
    80002400:	0004b783          	ld	a5,0(s1)
    80002404:	0187b783          	ld	a5,24(a5)
    80002408:	00048513          	mv	a0,s1
    8000240c:	000780e7          	jalr	a5
            Thread::sleep(times);
    80002410:	00090513          	mv	a0,s2
    80002414:	00000097          	auipc	ra,0x0
    80002418:	fa0080e7          	jalr	-96(ra) # 800023b4 <_ZN6Thread5sleepEm>
        while (true){
    8000241c:	fe5ff06f          	j	80002400 <_Z15periodicWrapperPv+0x24>
        }
    }
}
    80002420:	01813083          	ld	ra,24(sp)
    80002424:	01013403          	ld	s0,16(sp)
    80002428:	00813483          	ld	s1,8(sp)
    8000242c:	00013903          	ld	s2,0(sp)
    80002430:	02010113          	addi	sp,sp,32
    80002434:	00008067          	ret

0000000080002438 <_ZN6ThreadC1Ev>:

PeriodicThread::PeriodicThread(time_t period) : Thread(&periodicWrapper,new periodicArgs{this,period})  {
    set_periodic(&myHandle);
}

Thread::Thread() {
    80002438:	ff010113          	addi	sp,sp,-16
    8000243c:	00113423          	sd	ra,8(sp)
    80002440:	00813023          	sd	s0,0(sp)
    80002444:	01010413          	addi	s0,sp,16
    80002448:	00008797          	auipc	a5,0x8
    8000244c:	ab078793          	addi	a5,a5,-1360 # 80009ef8 <_ZTV6Thread+0x10>
    80002450:	00f53023          	sd	a5,0(a0)
    int res = thread_init(&myHandle,&wrapper, this);
    80002454:	00050613          	mv	a2,a0
    80002458:	00000597          	auipc	a1,0x0
    8000245c:	e1058593          	addi	a1,a1,-496 # 80002268 <_Z7wrapperPv>
    80002460:	00850513          	addi	a0,a0,8
    80002464:	fffff097          	auipc	ra,0xfffff
    80002468:	ebc080e7          	jalr	-324(ra) # 80001320 <thread_init>
    if(res < 0){
    8000246c:	00054a63          	bltz	a0,80002480 <_ZN6ThreadC1Ev+0x48>
        ::putc('!');
        ::putc('\n');
    }
}
    80002470:	00813083          	ld	ra,8(sp)
    80002474:	00013403          	ld	s0,0(sp)
    80002478:	01010113          	addi	sp,sp,16
    8000247c:	00008067          	ret
        ::putc('!');
    80002480:	02100513          	li	a0,33
    80002484:	fffff097          	auipc	ra,0xfffff
    80002488:	1bc080e7          	jalr	444(ra) # 80001640 <putc>
        ::putc('\n');
    8000248c:	00a00513          	li	a0,10
    80002490:	fffff097          	auipc	ra,0xfffff
    80002494:	1b0080e7          	jalr	432(ra) # 80001640 <putc>
}
    80002498:	fd9ff06f          	j	80002470 <_ZN6ThreadC1Ev+0x38>

000000008000249c <_Znwm>:

Thread::~Thread() {
    delete this->myHandle;
}

void* operator new(size_t n){
    8000249c:	ff010113          	addi	sp,sp,-16
    800024a0:	00113423          	sd	ra,8(sp)
    800024a4:	00813023          	sd	s0,0(sp)
    800024a8:	01010413          	addi	s0,sp,16
    void* ret =  mem_alloc(n);
    800024ac:	fffff097          	auipc	ra,0xfffff
    800024b0:	d58080e7          	jalr	-680(ra) # 80001204 <mem_alloc>
    return ret;
}
    800024b4:	00813083          	ld	ra,8(sp)
    800024b8:	00013403          	ld	s0,0(sp)
    800024bc:	01010113          	addi	sp,sp,16
    800024c0:	00008067          	ret

00000000800024c4 <_Znam>:
void* operator new[](size_t n){
    800024c4:	ff010113          	addi	sp,sp,-16
    800024c8:	00113423          	sd	ra,8(sp)
    800024cc:	00813023          	sd	s0,0(sp)
    800024d0:	01010413          	addi	s0,sp,16
    void* ret =  mem_alloc(n);
    800024d4:	fffff097          	auipc	ra,0xfffff
    800024d8:	d30080e7          	jalr	-720(ra) # 80001204 <mem_alloc>
    return ret;
}
    800024dc:	00813083          	ld	ra,8(sp)
    800024e0:	00013403          	ld	s0,0(sp)
    800024e4:	01010113          	addi	sp,sp,16
    800024e8:	00008067          	ret

00000000800024ec <_ZdlPv>:

void operator delete (void* p) noexcept{
    800024ec:	ff010113          	addi	sp,sp,-16
    800024f0:	00113423          	sd	ra,8(sp)
    800024f4:	00813023          	sd	s0,0(sp)
    800024f8:	01010413          	addi	s0,sp,16
    mem_free(p);
    800024fc:	fffff097          	auipc	ra,0xfffff
    80002500:	d54080e7          	jalr	-684(ra) # 80001250 <mem_free>
}
    80002504:	00813083          	ld	ra,8(sp)
    80002508:	00013403          	ld	s0,0(sp)
    8000250c:	01010113          	addi	sp,sp,16
    80002510:	00008067          	ret

0000000080002514 <_ZN6ThreadD1Ev>:
Thread::~Thread() {
    80002514:	00008797          	auipc	a5,0x8
    80002518:	9e478793          	addi	a5,a5,-1564 # 80009ef8 <_ZTV6Thread+0x10>
    8000251c:	00f53023          	sd	a5,0(a0)
    delete this->myHandle;
    80002520:	00853503          	ld	a0,8(a0)
    80002524:	02050663          	beqz	a0,80002550 <_ZN6ThreadD1Ev+0x3c>
Thread::~Thread() {
    80002528:	ff010113          	addi	sp,sp,-16
    8000252c:	00113423          	sd	ra,8(sp)
    80002530:	00813023          	sd	s0,0(sp)
    80002534:	01010413          	addi	s0,sp,16
    delete this->myHandle;
    80002538:	00000097          	auipc	ra,0x0
    8000253c:	fb4080e7          	jalr	-76(ra) # 800024ec <_ZdlPv>
}
    80002540:	00813083          	ld	ra,8(sp)
    80002544:	00013403          	ld	s0,0(sp)
    80002548:	01010113          	addi	sp,sp,16
    8000254c:	00008067          	ret
    80002550:	00008067          	ret

0000000080002554 <_ZN14PeriodicThreadC1Em>:
PeriodicThread::PeriodicThread(time_t period) : Thread(&periodicWrapper,new periodicArgs{this,period})  {
    80002554:	fe010113          	addi	sp,sp,-32
    80002558:	00113c23          	sd	ra,24(sp)
    8000255c:	00813823          	sd	s0,16(sp)
    80002560:	00913423          	sd	s1,8(sp)
    80002564:	01213023          	sd	s2,0(sp)
    80002568:	02010413          	addi	s0,sp,32
    8000256c:	00050493          	mv	s1,a0
    80002570:	00058913          	mv	s2,a1
    80002574:	01000513          	li	a0,16
    80002578:	00000097          	auipc	ra,0x0
    8000257c:	f24080e7          	jalr	-220(ra) # 8000249c <_Znwm>
    80002580:	00050613          	mv	a2,a0
    80002584:	00953023          	sd	s1,0(a0)
    80002588:	01253423          	sd	s2,8(a0)
    8000258c:	00000597          	auipc	a1,0x0
    80002590:	e5058593          	addi	a1,a1,-432 # 800023dc <_Z15periodicWrapperPv>
    80002594:	00048513          	mv	a0,s1
    80002598:	00000097          	auipc	ra,0x0
    8000259c:	d04080e7          	jalr	-764(ra) # 8000229c <_ZN6ThreadC1EPFvPvES0_>
    800025a0:	00008797          	auipc	a5,0x8
    800025a4:	92878793          	addi	a5,a5,-1752 # 80009ec8 <_ZTV14PeriodicThread+0x10>
    800025a8:	00f4b023          	sd	a5,0(s1)
    set_periodic(&myHandle);
    800025ac:	00848513          	addi	a0,s1,8
    800025b0:	fffff097          	auipc	ra,0xfffff
    800025b4:	fec080e7          	jalr	-20(ra) # 8000159c <set_periodic>
    800025b8:	0200006f          	j	800025d8 <_ZN14PeriodicThreadC1Em+0x84>
    800025bc:	00050913          	mv	s2,a0
PeriodicThread::PeriodicThread(time_t period) : Thread(&periodicWrapper,new periodicArgs{this,period})  {
    800025c0:	00048513          	mv	a0,s1
    800025c4:	00000097          	auipc	ra,0x0
    800025c8:	f50080e7          	jalr	-176(ra) # 80002514 <_ZN6ThreadD1Ev>
    800025cc:	00090513          	mv	a0,s2
    800025d0:	00009097          	auipc	ra,0x9
    800025d4:	cb8080e7          	jalr	-840(ra) # 8000b288 <_Unwind_Resume>
}
    800025d8:	01813083          	ld	ra,24(sp)
    800025dc:	01013403          	ld	s0,16(sp)
    800025e0:	00813483          	ld	s1,8(sp)
    800025e4:	00013903          	ld	s2,0(sp)
    800025e8:	02010113          	addi	sp,sp,32
    800025ec:	00008067          	ret

00000000800025f0 <_ZN6ThreadD0Ev>:
Thread::~Thread() {
    800025f0:	fe010113          	addi	sp,sp,-32
    800025f4:	00113c23          	sd	ra,24(sp)
    800025f8:	00813823          	sd	s0,16(sp)
    800025fc:	00913423          	sd	s1,8(sp)
    80002600:	02010413          	addi	s0,sp,32
    80002604:	00050493          	mv	s1,a0
}
    80002608:	00000097          	auipc	ra,0x0
    8000260c:	f0c080e7          	jalr	-244(ra) # 80002514 <_ZN6ThreadD1Ev>
    80002610:	00048513          	mv	a0,s1
    80002614:	00000097          	auipc	ra,0x0
    80002618:	ed8080e7          	jalr	-296(ra) # 800024ec <_ZdlPv>
    8000261c:	01813083          	ld	ra,24(sp)
    80002620:	01013403          	ld	s0,16(sp)
    80002624:	00813483          	ld	s1,8(sp)
    80002628:	02010113          	addi	sp,sp,32
    8000262c:	00008067          	ret

0000000080002630 <_ZN9SemaphoreD1Ev>:
int Semaphore::signal() {
    int res = sem_signal(this->myHandle);
    return res;
}

Semaphore::~Semaphore() {
    80002630:	fe010113          	addi	sp,sp,-32
    80002634:	00113c23          	sd	ra,24(sp)
    80002638:	00813823          	sd	s0,16(sp)
    8000263c:	00913423          	sd	s1,8(sp)
    80002640:	02010413          	addi	s0,sp,32
    80002644:	00050493          	mv	s1,a0
    80002648:	00008797          	auipc	a5,0x8
    8000264c:	8d878793          	addi	a5,a5,-1832 # 80009f20 <_ZTV9Semaphore+0x10>
    80002650:	00f53023          	sd	a5,0(a0)
    sem_close(this->myHandle);
    80002654:	00853503          	ld	a0,8(a0)
    80002658:	fffff097          	auipc	ra,0xfffff
    8000265c:	e54080e7          	jalr	-428(ra) # 800014ac <sem_close>
    delete this->myHandle;
    80002660:	0084b503          	ld	a0,8(s1)
    80002664:	00050663          	beqz	a0,80002670 <_ZN9SemaphoreD1Ev+0x40>
    80002668:	00000097          	auipc	ra,0x0
    8000266c:	e84080e7          	jalr	-380(ra) # 800024ec <_ZdlPv>

}
    80002670:	01813083          	ld	ra,24(sp)
    80002674:	01013403          	ld	s0,16(sp)
    80002678:	00813483          	ld	s1,8(sp)
    8000267c:	02010113          	addi	sp,sp,32
    80002680:	00008067          	ret

0000000080002684 <_ZN9SemaphoreD0Ev>:
Semaphore::~Semaphore() {
    80002684:	fe010113          	addi	sp,sp,-32
    80002688:	00113c23          	sd	ra,24(sp)
    8000268c:	00813823          	sd	s0,16(sp)
    80002690:	00913423          	sd	s1,8(sp)
    80002694:	02010413          	addi	s0,sp,32
    80002698:	00050493          	mv	s1,a0
}
    8000269c:	00000097          	auipc	ra,0x0
    800026a0:	f94080e7          	jalr	-108(ra) # 80002630 <_ZN9SemaphoreD1Ev>
    800026a4:	00048513          	mv	a0,s1
    800026a8:	00000097          	auipc	ra,0x0
    800026ac:	e44080e7          	jalr	-444(ra) # 800024ec <_ZdlPv>
    800026b0:	01813083          	ld	ra,24(sp)
    800026b4:	01013403          	ld	s0,16(sp)
    800026b8:	00813483          	ld	s1,8(sp)
    800026bc:	02010113          	addi	sp,sp,32
    800026c0:	00008067          	ret

00000000800026c4 <_ZdaPv>:
void operator delete[] (void * p) noexcept{
    800026c4:	ff010113          	addi	sp,sp,-16
    800026c8:	00113423          	sd	ra,8(sp)
    800026cc:	00813023          	sd	s0,0(sp)
    800026d0:	01010413          	addi	s0,sp,16
    mem_free(p);
    800026d4:	fffff097          	auipc	ra,0xfffff
    800026d8:	b7c080e7          	jalr	-1156(ra) # 80001250 <mem_free>
}
    800026dc:	00813083          	ld	ra,8(sp)
    800026e0:	00013403          	ld	s0,0(sp)
    800026e4:	01010113          	addi	sp,sp,16
    800026e8:	00008067          	ret

00000000800026ec <_ZN9Semaphore4waitEv>:
int Semaphore::wait() {
    800026ec:	ff010113          	addi	sp,sp,-16
    800026f0:	00113423          	sd	ra,8(sp)
    800026f4:	00813023          	sd	s0,0(sp)
    800026f8:	01010413          	addi	s0,sp,16
    int res = sem_wait(this->myHandle);
    800026fc:	00853503          	ld	a0,8(a0)
    80002700:	fffff097          	auipc	ra,0xfffff
    80002704:	de8080e7          	jalr	-536(ra) # 800014e8 <sem_wait>
}
    80002708:	00813083          	ld	ra,8(sp)
    8000270c:	00013403          	ld	s0,0(sp)
    80002710:	01010113          	addi	sp,sp,16
    80002714:	00008067          	ret

0000000080002718 <_ZN9Semaphore6signalEv>:
int Semaphore::signal() {
    80002718:	ff010113          	addi	sp,sp,-16
    8000271c:	00113423          	sd	ra,8(sp)
    80002720:	00813023          	sd	s0,0(sp)
    80002724:	01010413          	addi	s0,sp,16
    int res = sem_signal(this->myHandle);
    80002728:	00853503          	ld	a0,8(a0)
    8000272c:	fffff097          	auipc	ra,0xfffff
    80002730:	df8080e7          	jalr	-520(ra) # 80001524 <sem_signal>
}
    80002734:	00813083          	ld	ra,8(sp)
    80002738:	00013403          	ld	s0,0(sp)
    8000273c:	01010113          	addi	sp,sp,16
    80002740:	00008067          	ret

0000000080002744 <_ZN7Console4getcEv>:


char Console::getc() {
    80002744:	ff010113          	addi	sp,sp,-16
    80002748:	00113423          	sd	ra,8(sp)
    8000274c:	00813023          	sd	s0,0(sp)
    80002750:	01010413          	addi	s0,sp,16
    char c = ::getc();
    80002754:	fffff097          	auipc	ra,0xfffff
    80002758:	eb4080e7          	jalr	-332(ra) # 80001608 <getc>
    return c;
}
    8000275c:	00813083          	ld	ra,8(sp)
    80002760:	00013403          	ld	s0,0(sp)
    80002764:	01010113          	addi	sp,sp,16
    80002768:	00008067          	ret

000000008000276c <_ZN7Console4putcEc>:

void Console::putc(char c) {
    8000276c:	ff010113          	addi	sp,sp,-16
    80002770:	00113423          	sd	ra,8(sp)
    80002774:	00813023          	sd	s0,0(sp)
    80002778:	01010413          	addi	s0,sp,16
    ::putc(c);
    8000277c:	fffff097          	auipc	ra,0xfffff
    80002780:	ec4080e7          	jalr	-316(ra) # 80001640 <putc>
}
    80002784:	00813083          	ld	ra,8(sp)
    80002788:	00013403          	ld	s0,0(sp)
    8000278c:	01010113          	addi	sp,sp,16
    80002790:	00008067          	ret

0000000080002794 <_ZN6Thread3runEv>:
    static int sleep (time_t);

    int start ();

protected:
    virtual void run () {}
    80002794:	ff010113          	addi	sp,sp,-16
    80002798:	00813423          	sd	s0,8(sp)
    8000279c:	01010413          	addi	s0,sp,16
    800027a0:	00813403          	ld	s0,8(sp)
    800027a4:	01010113          	addi	sp,sp,16
    800027a8:	00008067          	ret

00000000800027ac <_ZN14PeriodicThread18periodicActivationEv>:
class PeriodicThread : public Thread {
public:
    friend void periodicWrapper(void * t);
protected:
    PeriodicThread (time_t period);
    virtual void periodicActivation () {}
    800027ac:	ff010113          	addi	sp,sp,-16
    800027b0:	00813423          	sd	s0,8(sp)
    800027b4:	01010413          	addi	s0,sp,16
    800027b8:	00813403          	ld	s0,8(sp)
    800027bc:	01010113          	addi	sp,sp,16
    800027c0:	00008067          	ret

00000000800027c4 <_ZN14PeriodicThreadD1Ev>:
class PeriodicThread : public Thread {
    800027c4:	ff010113          	addi	sp,sp,-16
    800027c8:	00113423          	sd	ra,8(sp)
    800027cc:	00813023          	sd	s0,0(sp)
    800027d0:	01010413          	addi	s0,sp,16
    800027d4:	00007797          	auipc	a5,0x7
    800027d8:	6f478793          	addi	a5,a5,1780 # 80009ec8 <_ZTV14PeriodicThread+0x10>
    800027dc:	00f53023          	sd	a5,0(a0)
    800027e0:	00000097          	auipc	ra,0x0
    800027e4:	d34080e7          	jalr	-716(ra) # 80002514 <_ZN6ThreadD1Ev>
    800027e8:	00813083          	ld	ra,8(sp)
    800027ec:	00013403          	ld	s0,0(sp)
    800027f0:	01010113          	addi	sp,sp,16
    800027f4:	00008067          	ret

00000000800027f8 <_ZN14PeriodicThreadD0Ev>:
    800027f8:	fe010113          	addi	sp,sp,-32
    800027fc:	00113c23          	sd	ra,24(sp)
    80002800:	00813823          	sd	s0,16(sp)
    80002804:	00913423          	sd	s1,8(sp)
    80002808:	02010413          	addi	s0,sp,32
    8000280c:	00050493          	mv	s1,a0
    80002810:	00007797          	auipc	a5,0x7
    80002814:	6b878793          	addi	a5,a5,1720 # 80009ec8 <_ZTV14PeriodicThread+0x10>
    80002818:	00f53023          	sd	a5,0(a0)
    8000281c:	00000097          	auipc	ra,0x0
    80002820:	cf8080e7          	jalr	-776(ra) # 80002514 <_ZN6ThreadD1Ev>
    80002824:	00048513          	mv	a0,s1
    80002828:	00000097          	auipc	ra,0x0
    8000282c:	cc4080e7          	jalr	-828(ra) # 800024ec <_ZdlPv>
    80002830:	01813083          	ld	ra,24(sp)
    80002834:	01013403          	ld	s0,16(sp)
    80002838:	00813483          	ld	s1,8(sp)
    8000283c:	02010113          	addi	sp,sp,32
    80002840:	00008067          	ret

0000000080002844 <_ZN13FreeShardList12allocate_memEP4nodeS1_m>:
    return nullptr;

}


void FreeShardList::allocate_mem(struct node* prev, struct node *here, size_t size) {
    80002844:	ff010113          	addi	sp,sp,-16
    80002848:	00813423          	sd	s0,8(sp)
    8000284c:	01010413          	addi	s0,sp,16
    if(here->size == size){
    80002850:	0085b703          	ld	a4,8(a1)
    80002854:	02c70e63          	beq	a4,a2,80002890 <_ZN13FreeShardList12allocate_memEP4nodeS1_m+0x4c>

        }
    }
    else{
        size_t prevSize = here->size;
        void* prevMemBlock = here->mem_free_block;
    80002858:	0005b783          	ld	a5,0(a1)
        struct node* prevNext = here->next;
    8000285c:	0105b683          	ld	a3,16(a1)
        here = (node*)((size_t )here->mem_free_block + size);
    80002860:	00c787b3          	add	a5,a5,a2
        here->size = prevSize-size;
    80002864:	40c70633          	sub	a2,a4,a2
    80002868:	00c7b423          	sd	a2,8(a5)
        here->mem_free_block = (void*)((size_t)prevMemBlock+size);
    8000286c:	00f7b023          	sd	a5,0(a5)
        here->next = prevNext;
    80002870:	00d7b823          	sd	a3,16(a5)
        if(prev == nullptr) head = here;
    80002874:	04050c63          	beqz	a0,800028cc <_ZN13FreeShardList12allocate_memEP4nodeS1_m+0x88>
        else{
            prev->next = here;
    80002878:	00f53823          	sd	a5,16(a0)
        }
        if(here->next == nullptr) tail = here;
    8000287c:	0107b703          	ld	a4,16(a5)
    80002880:	04070c63          	beqz	a4,800028d8 <_ZN13FreeShardList12allocate_memEP4nodeS1_m+0x94>
    }
}
    80002884:	00813403          	ld	s0,8(sp)
    80002888:	01010113          	addi	sp,sp,16
    8000288c:	00008067          	ret
        if(prev == nullptr){
    80002890:	00050a63          	beqz	a0,800028a4 <_ZN13FreeShardList12allocate_memEP4nodeS1_m+0x60>
        else if(here->next == nullptr){
    80002894:	0105b783          	ld	a5,16(a1)
    80002898:	02078263          	beqz	a5,800028bc <_ZN13FreeShardList12allocate_memEP4nodeS1_m+0x78>
            prev->next = here->next;
    8000289c:	00f53823          	sd	a5,16(a0)
    800028a0:	fe5ff06f          	j	80002884 <_ZN13FreeShardList12allocate_memEP4nodeS1_m+0x40>
            head = head->next;
    800028a4:	00008797          	auipc	a5,0x8
    800028a8:	8dc78793          	addi	a5,a5,-1828 # 8000a180 <_ZN13FreeShardList4headE>
    800028ac:	0007b703          	ld	a4,0(a5)
    800028b0:	01073703          	ld	a4,16(a4)
    800028b4:	00e7b023          	sd	a4,0(a5)
    800028b8:	fcdff06f          	j	80002884 <_ZN13FreeShardList12allocate_memEP4nodeS1_m+0x40>
            tail = prev;
    800028bc:	00008797          	auipc	a5,0x8
    800028c0:	8ca7b623          	sd	a0,-1844(a5) # 8000a188 <_ZN13FreeShardList4tailE>
            tail->next = nullptr;
    800028c4:	00053823          	sd	zero,16(a0)
    800028c8:	fbdff06f          	j	80002884 <_ZN13FreeShardList12allocate_memEP4nodeS1_m+0x40>
        if(prev == nullptr) head = here;
    800028cc:	00008717          	auipc	a4,0x8
    800028d0:	8af73a23          	sd	a5,-1868(a4) # 8000a180 <_ZN13FreeShardList4headE>
    800028d4:	fa9ff06f          	j	8000287c <_ZN13FreeShardList12allocate_memEP4nodeS1_m+0x38>
        if(here->next == nullptr) tail = here;
    800028d8:	00008717          	auipc	a4,0x8
    800028dc:	8af73823          	sd	a5,-1872(a4) # 8000a188 <_ZN13FreeShardList4tailE>
}
    800028e0:	fa5ff06f          	j	80002884 <_ZN13FreeShardList12allocate_memEP4nodeS1_m+0x40>

00000000800028e4 <_ZN13FreeShardList9find_bestEm>:
void *FreeShardList::find_best(size_t size) {
    800028e4:	00050613          	mv	a2,a0
    if(tail == nullptr){
    800028e8:	00008797          	auipc	a5,0x8
    800028ec:	8a07b783          	ld	a5,-1888(a5) # 8000a188 <_ZN13FreeShardList4tailE>
    800028f0:	02078e63          	beqz	a5,8000292c <_ZN13FreeShardList9find_bestEm+0x48>
    if((long)size < 0) return nullptr;
    800028f4:	0c064e63          	bltz	a2,800029d0 <_ZN13FreeShardList9find_bestEm+0xec>
void *FreeShardList::find_best(size_t size) {
    800028f8:	fe010113          	addi	sp,sp,-32
    800028fc:	00113c23          	sd	ra,24(sp)
    80002900:	00813823          	sd	s0,16(sp)
    80002904:	00913423          	sd	s1,8(sp)
    80002908:	02010413          	addi	s0,sp,32
    long min_shard_dif = head->size  - size;
    8000290c:	00008597          	auipc	a1,0x8
    80002910:	8745b583          	ld	a1,-1932(a1) # 8000a180 <_ZN13FreeShardList4headE>
    80002914:	0085b683          	ld	a3,8(a1)
    80002918:	40c686b3          	sub	a3,a3,a2
    void* start_adr = head->mem_free_block;
    8000291c:	0005b483          	ld	s1,0(a1)
    node* pom = head;
    80002920:	00058713          	mv	a4,a1
    node* prevReplace = nullptr;
    80002924:	00000813          	li	a6,0
    80002928:	0600006f          	j	80002988 <_ZN13FreeShardList9find_bestEm+0xa4>
        head = (node*)HEAP_START_ADDR;
    8000292c:	00007597          	auipc	a1,0x7
    80002930:	77c5b583          	ld	a1,1916(a1) # 8000a0a8 <_GLOBAL_OFFSET_TABLE_+0x20>
    80002934:	0005b783          	ld	a5,0(a1)
    80002938:	00008717          	auipc	a4,0x8
    8000293c:	84870713          	addi	a4,a4,-1976 # 8000a180 <_ZN13FreeShardList4headE>
    80002940:	00f73023          	sd	a5,0(a4)
        head->next = nullptr;
    80002944:	0007b823          	sd	zero,16(a5)
        head->mem_free_block = head;
    80002948:	00f7b023          	sd	a5,0(a5)
        head->size = (size_t)HEAP_END_ADDR-(size_t)HEAP_START_ADDR;
    8000294c:	00073683          	ld	a3,0(a4)
    80002950:	00007797          	auipc	a5,0x7
    80002954:	7a07b783          	ld	a5,1952(a5) # 8000a0f0 <_GLOBAL_OFFSET_TABLE_+0x68>
    80002958:	0007b783          	ld	a5,0(a5)
    8000295c:	0005b583          	ld	a1,0(a1)
    80002960:	40b787b3          	sub	a5,a5,a1
    80002964:	00f6b423          	sd	a5,8(a3)
        tail= head;
    80002968:	00d73423          	sd	a3,8(a4)
    8000296c:	f89ff06f          	j	800028f4 <_ZN13FreeShardList9find_bestEm+0x10>
        if((shard_diff < min_shard_dif && shard_diff >= 0)|| min_shard_dif < 0){
    80002970:	0006da63          	bgez	a3,80002984 <_ZN13FreeShardList9find_bestEm+0xa0>
            start_adr = pom->mem_free_block;
    80002974:	00053483          	ld	s1,0(a0)
            prevReplace = prev;
    80002978:	00070813          	mv	a6,a4
            toReplace = pom;
    8000297c:	00050593          	mv	a1,a0
            min_shard_dif = shard_diff;
    80002980:	00078693          	mv	a3,a5
    80002984:	00050713          	mv	a4,a0
    while(pom->next!= nullptr){
    80002988:	01073503          	ld	a0,16(a4)
    8000298c:	00050c63          	beqz	a0,800029a4 <_ZN13FreeShardList9find_bestEm+0xc0>
        long shard_diff = pom->size - size;
    80002990:	00853783          	ld	a5,8(a0)
    80002994:	40c787b3          	sub	a5,a5,a2
        if((shard_diff < min_shard_dif && shard_diff >= 0)|| min_shard_dif < 0){
    80002998:	fcd7dce3          	bge	a5,a3,80002970 <_ZN13FreeShardList9find_bestEm+0x8c>
    8000299c:	fc07dce3          	bgez	a5,80002974 <_ZN13FreeShardList9find_bestEm+0x90>
    800029a0:	fd1ff06f          	j	80002970 <_ZN13FreeShardList9find_bestEm+0x8c>
    if(min_shard_dif >= 0) {
    800029a4:	0006dc63          	bgez	a3,800029bc <_ZN13FreeShardList9find_bestEm+0xd8>
}
    800029a8:	01813083          	ld	ra,24(sp)
    800029ac:	01013403          	ld	s0,16(sp)
    800029b0:	00813483          	ld	s1,8(sp)
    800029b4:	02010113          	addi	sp,sp,32
    800029b8:	00008067          	ret
        allocate_mem(prevReplace,toReplace,size);
    800029bc:	00080513          	mv	a0,a6
    800029c0:	00000097          	auipc	ra,0x0
    800029c4:	e84080e7          	jalr	-380(ra) # 80002844 <_ZN13FreeShardList12allocate_memEP4nodeS1_m>
        return start_adr;
    800029c8:	00048513          	mv	a0,s1
    800029cc:	fddff06f          	j	800029a8 <_ZN13FreeShardList9find_bestEm+0xc4>
    if((long)size < 0) return nullptr;
    800029d0:	00000513          	li	a0,0
}
    800029d4:	00008067          	ret

00000000800029d8 <_ZN13FreeShardList11free_memoryEPv>:





int FreeShardList::free_memory(void *address) {
    800029d8:	ff010113          	addi	sp,sp,-16
    800029dc:	00813423          	sd	s0,8(sp)
    800029e0:	01010413          	addi	s0,sp,16

    int result = 0;
    void* adrStart = (void*)((long*)address - 1);
    800029e4:	ff850693          	addi	a3,a0,-8
    if(adrStart < HEAP_START_ADDR || adrStart> HEAP_END_ADDR) return -1;
    800029e8:	00007797          	auipc	a5,0x7
    800029ec:	6c07b783          	ld	a5,1728(a5) # 8000a0a8 <_GLOBAL_OFFSET_TABLE_+0x20>
    800029f0:	0007b783          	ld	a5,0(a5)
    800029f4:	18f6e063          	bltu	a3,a5,80002b74 <_ZN13FreeShardList11free_memoryEPv+0x19c>
    800029f8:	00007797          	auipc	a5,0x7
    800029fc:	6f87b783          	ld	a5,1784(a5) # 8000a0f0 <_GLOBAL_OFFSET_TABLE_+0x68>
    80002a00:	0007b783          	ld	a5,0(a5)
    80002a04:	16d7ec63          	bltu	a5,a3,80002b7c <_ZN13FreeShardList11free_memoryEPv+0x1a4>
    size_t size = MEM_BLOCK_SIZE* (*(long*)adrStart);
    80002a08:	ff853803          	ld	a6,-8(a0)
    80002a0c:	00681813          	slli	a6,a6,0x6
    node* prev = nullptr;
    node* curr = head;
    80002a10:	00007797          	auipc	a5,0x7
    80002a14:	7707b783          	ld	a5,1904(a5) # 8000a180 <_ZN13FreeShardList4headE>
    if((void*)curr == adrStart) return -3;
    80002a18:	16f68663          	beq	a3,a5,80002b84 <_ZN13FreeShardList11free_memoryEPv+0x1ac>
    node* prev = nullptr;
    80002a1c:	00000593          	li	a1,0
    while(adrStart > curr->mem_free_block && curr->next != nullptr) {
    80002a20:	0007b603          	ld	a2,0(a5)
    80002a24:	00d67e63          	bgeu	a2,a3,80002a40 <_ZN13FreeShardList11free_memoryEPv+0x68>
    80002a28:	0107b703          	ld	a4,16(a5)
    80002a2c:	00070a63          	beqz	a4,80002a40 <_ZN13FreeShardList11free_memoryEPv+0x68>
        if((void*)curr == adrStart) return -3;
        prev = curr;
    80002a30:	00078593          	mv	a1,a5
        if((void*)curr == adrStart) return -3;
    80002a34:	14d78c63          	beq	a5,a3,80002b8c <_ZN13FreeShardList11free_memoryEPv+0x1b4>
        curr = curr->next;
    80002a38:	00070793          	mv	a5,a4
    80002a3c:	fe5ff06f          	j	80002a20 <_ZN13FreeShardList11free_memoryEPv+0x48>
    }
    if(adrStart < curr->mem_free_block) {
    80002a40:	0ec6fa63          	bgeu	a3,a2,80002b34 <_ZN13FreeShardList11free_memoryEPv+0x15c>
        if (prev == nullptr) {
    80002a44:	04058063          	beqz	a1,80002a84 <_ZN13FreeShardList11free_memoryEPv+0xac>
                newHead->next = curr;
                newHead->mem_free_block = (void *) newHead;
                head = newHead;
            }
        } else {
            if ((uint64)adrStart < (uint64)prev->mem_free_block + (uint64)prev->size) result = -2;
    80002a48:	0005b703          	ld	a4,0(a1)
    80002a4c:	0085b883          	ld	a7,8(a1)
    80002a50:	01170733          	add	a4,a4,a7
    80002a54:	00068313          	mv	t1,a3
    80002a58:	14e6e263          	bltu	a3,a4,80002b9c <_ZN13FreeShardList11free_memoryEPv+0x1c4>
            else if ((uint64)adrStart == (uint64)prev->mem_free_block + (uint64)prev->size &&
    80002a5c:	06d70a63          	beq	a4,a3,80002ad0 <_ZN13FreeShardList11free_memoryEPv+0xf8>
                    (uint64)curr->mem_free_block > (uint64)adrStart + (uint64)size) {
                prev->size += size;
            } else if ((uint64)adrStart == (uint64)prev->mem_free_block + (uint64)prev->size &&
    80002a60:	08670463          	beq	a4,t1,80002ae8 <_ZN13FreeShardList11free_memoryEPv+0x110>
                    (uint64)curr->mem_free_block == (uint64)adrStart + (uint64)size) {
                prev->next = curr->next;
                prev->size = prev->size + curr->size + size;
            } else if ((uint64)adrStart + (uint64)size == (uint64)curr->mem_free_block) {
    80002a64:	01068733          	add	a4,a3,a6
    80002a68:	0ac70463          	beq	a4,a2,80002b10 <_ZN13FreeShardList11free_memoryEPv+0x138>
                newNode->size = size + curr->size;
                newNode->mem_free_block = (void *) newNode;
                prev->next = newNode;
            } else {
                node *newNode = (node *) adrStart;
                newNode->size = size;
    80002a6c:	01053023          	sd	a6,0(a0)
                newNode->mem_free_block = (void *) newNode;
    80002a70:	fed53c23          	sd	a3,-8(a0)
                newNode->next = curr;
    80002a74:	00f53423          	sd	a5,8(a0)
                prev->next = newNode;
    80002a78:	00d5b823          	sd	a3,16(a1)
    int result = 0;
    80002a7c:	00000513          	li	a0,0
    80002a80:	1100006f          	j	80002b90 <_ZN13FreeShardList11free_memoryEPv+0x1b8>
            if ( (uint64)adrStart + (uint64)size ==  (uint64)curr->mem_free_block) {
    80002a84:	01068733          	add	a4,a3,a6
    80002a88:	02c70063          	beq	a4,a2,80002aa8 <_ZN13FreeShardList11free_memoryEPv+0xd0>
                newHead->size = size;
    80002a8c:	01053023          	sd	a6,0(a0)
                newHead->next = curr;
    80002a90:	00f53423          	sd	a5,8(a0)
                newHead->mem_free_block = (void *) newHead;
    80002a94:	fed53c23          	sd	a3,-8(a0)
                head = newHead;
    80002a98:	00007797          	auipc	a5,0x7
    80002a9c:	6ed7b423          	sd	a3,1768(a5) # 8000a180 <_ZN13FreeShardList4headE>
    int result = 0;
    80002aa0:	00000513          	li	a0,0
    80002aa4:	0ec0006f          	j	80002b90 <_ZN13FreeShardList11free_memoryEPv+0x1b8>
                newHead->size = curr->size + size;
    80002aa8:	0087b703          	ld	a4,8(a5)
    80002aac:	01070833          	add	a6,a4,a6
    80002ab0:	01053023          	sd	a6,0(a0)
                newHead->next = curr->next;
    80002ab4:	0107b783          	ld	a5,16(a5)
    80002ab8:	00f53423          	sd	a5,8(a0)
                newHead->mem_free_block = (void *) newHead;
    80002abc:	fed53c23          	sd	a3,-8(a0)
                head = newHead;
    80002ac0:	00007797          	auipc	a5,0x7
    80002ac4:	6cd7b023          	sd	a3,1728(a5) # 8000a180 <_ZN13FreeShardList4headE>
    int result = 0;
    80002ac8:	00000513          	li	a0,0
    80002acc:	0c40006f          	j	80002b90 <_ZN13FreeShardList11free_memoryEPv+0x1b8>
                    (uint64)curr->mem_free_block > (uint64)adrStart + (uint64)size) {
    80002ad0:	01068e33          	add	t3,a3,a6
            else if ((uint64)adrStart == (uint64)prev->mem_free_block + (uint64)prev->size &&
    80002ad4:	f8ce76e3          	bgeu	t3,a2,80002a60 <_ZN13FreeShardList11free_memoryEPv+0x88>
                prev->size += size;
    80002ad8:	01088833          	add	a6,a7,a6
    80002adc:	0105b423          	sd	a6,8(a1)
    int result = 0;
    80002ae0:	00000513          	li	a0,0
                prev->size += size;
    80002ae4:	0ac0006f          	j	80002b90 <_ZN13FreeShardList11free_memoryEPv+0x1b8>
                    (uint64)curr->mem_free_block == (uint64)adrStart + (uint64)size) {
    80002ae8:	01068733          	add	a4,a3,a6
            } else if ((uint64)adrStart == (uint64)prev->mem_free_block + (uint64)prev->size &&
    80002aec:	f6e61ce3          	bne	a2,a4,80002a64 <_ZN13FreeShardList11free_memoryEPv+0x8c>
                prev->next = curr->next;
    80002af0:	0107b703          	ld	a4,16(a5)
    80002af4:	00e5b823          	sd	a4,16(a1)
                prev->size = prev->size + curr->size + size;
    80002af8:	0087b783          	ld	a5,8(a5)
    80002afc:	00f888b3          	add	a7,a7,a5
    80002b00:	01088833          	add	a6,a7,a6
    80002b04:	0105b423          	sd	a6,8(a1)
    int result = 0;
    80002b08:	00000513          	li	a0,0
                prev->size = prev->size + curr->size + size;
    80002b0c:	0840006f          	j	80002b90 <_ZN13FreeShardList11free_memoryEPv+0x1b8>
                newNode->next = curr->next;
    80002b10:	0107b703          	ld	a4,16(a5)
    80002b14:	00e53423          	sd	a4,8(a0)
                newNode->size = size + curr->size;
    80002b18:	0087b783          	ld	a5,8(a5)
    80002b1c:	01078833          	add	a6,a5,a6
    80002b20:	01053023          	sd	a6,0(a0)
                newNode->mem_free_block = (void *) newNode;
    80002b24:	fed53c23          	sd	a3,-8(a0)
                prev->next = newNode;
    80002b28:	00d5b823          	sd	a3,16(a1)
    int result = 0;
    80002b2c:	00000513          	li	a0,0
    80002b30:	0600006f          	j	80002b90 <_ZN13FreeShardList11free_memoryEPv+0x1b8>
            }
        }
    }
    else{
        if((uint64)curr->mem_free_block + (uint64)curr->size == (uint64)adrStart){
    80002b34:	0087b703          	ld	a4,8(a5)
    80002b38:	00e60633          	add	a2,a2,a4
    80002b3c:	02d60463          	beq	a2,a3,80002b64 <_ZN13FreeShardList11free_memoryEPv+0x18c>
            curr->size+=size;

        }
        else if((uint64)curr->mem_free_block + curr->size > (uint64)adrStart) return -4;
    80002b40:	06c6e263          	bltu	a3,a2,80002ba4 <_ZN13FreeShardList11free_memoryEPv+0x1cc>
        else{
            node* newTail = (node*)adrStart;
            newTail->next = nullptr;
    80002b44:	00053423          	sd	zero,8(a0)
            newTail->size = size;
    80002b48:	01053023          	sd	a6,0(a0)
            newTail->mem_free_block =(void*)newTail;
    80002b4c:	fed53c23          	sd	a3,-8(a0)
            curr->next = newTail;
    80002b50:	00d7b823          	sd	a3,16(a5)
            tail = newTail;
    80002b54:	00007797          	auipc	a5,0x7
    80002b58:	62d7ba23          	sd	a3,1588(a5) # 8000a188 <_ZN13FreeShardList4tailE>
    int result = 0;
    80002b5c:	00000513          	li	a0,0
    80002b60:	0300006f          	j	80002b90 <_ZN13FreeShardList11free_memoryEPv+0x1b8>
            curr->size+=size;
    80002b64:	01070733          	add	a4,a4,a6
    80002b68:	00e7b423          	sd	a4,8(a5)
    int result = 0;
    80002b6c:	00000513          	li	a0,0
    80002b70:	0200006f          	j	80002b90 <_ZN13FreeShardList11free_memoryEPv+0x1b8>
    if(adrStart < HEAP_START_ADDR || adrStart> HEAP_END_ADDR) return -1;
    80002b74:	fff00513          	li	a0,-1
    80002b78:	0180006f          	j	80002b90 <_ZN13FreeShardList11free_memoryEPv+0x1b8>
    80002b7c:	fff00513          	li	a0,-1
    80002b80:	0100006f          	j	80002b90 <_ZN13FreeShardList11free_memoryEPv+0x1b8>
    if((void*)curr == adrStart) return -3;
    80002b84:	ffd00513          	li	a0,-3
    80002b88:	0080006f          	j	80002b90 <_ZN13FreeShardList11free_memoryEPv+0x1b8>
        if((void*)curr == adrStart) return -3;
    80002b8c:	ffd00513          	li	a0,-3
        }
    }
    return result;
}
    80002b90:	00813403          	ld	s0,8(sp)
    80002b94:	01010113          	addi	sp,sp,16
    80002b98:	00008067          	ret
            if ((uint64)adrStart < (uint64)prev->mem_free_block + (uint64)prev->size) result = -2;
    80002b9c:	ffe00513          	li	a0,-2
    80002ba0:	ff1ff06f          	j	80002b90 <_ZN13FreeShardList11free_memoryEPv+0x1b8>
        else if((uint64)curr->mem_free_block + curr->size > (uint64)adrStart) return -4;
    80002ba4:	ffc00513          	li	a0,-4
    80002ba8:	fe9ff06f          	j	80002b90 <_ZN13FreeShardList11free_memoryEPv+0x1b8>

0000000080002bac <_Z6mediumPv>:
    void periodicActivation () {
        Console::putc('B');
        Console::putc(' ');
    }
};
void medium(void* args){
    80002bac:	ff010113          	addi	sp,sp,-16
    80002bb0:	00113423          	sd	ra,8(sp)
    80002bb4:	00813023          	sd	s0,0(sp)
    80002bb8:	01010413          	addi	s0,sp,16
    while (true){
       Thread::dispatch();
    80002bbc:	fffff097          	auipc	ra,0xfffff
    80002bc0:	7d0080e7          	jalr	2000(ra) # 8000238c <_ZN6Thread8dispatchEv>
    while (true){
    80002bc4:	ff9ff06f          	j	80002bbc <_Z6mediumPv+0x10>

0000000080002bc8 <_Z4initv>:
    }
}

void init(){
    80002bc8:	fd010113          	addi	sp,sp,-48
    80002bcc:	02113423          	sd	ra,40(sp)
    80002bd0:	02813023          	sd	s0,32(sp)
    80002bd4:	00913c23          	sd	s1,24(sp)
    80002bd8:	01213823          	sd	s2,16(sp)
    80002bdc:	01313423          	sd	s3,8(sp)
    80002be0:	03010413          	addi	s0,sp,48
    Interrupt::w_stvec((uint64) &Interrupt::callRoutine);
    80002be4:	00007517          	auipc	a0,0x7
    80002be8:	4b453503          	ld	a0,1204(a0) # 8000a098 <_GLOBAL_OFFSET_TABLE_+0x10>
    80002bec:	00001097          	auipc	ra,0x1
    80002bf0:	7c0080e7          	jalr	1984(ra) # 800043ac <_ZN9Interrupt7w_stvecEm>
    Thread* startThread = new Thread(&medium, nullptr);
    80002bf4:	01000513          	li	a0,16
    80002bf8:	00000097          	auipc	ra,0x0
    80002bfc:	8a4080e7          	jalr	-1884(ra) # 8000249c <_Znwm>
    80002c00:	00050493          	mv	s1,a0
    80002c04:	00000613          	li	a2,0
    80002c08:	00000597          	auipc	a1,0x0
    80002c0c:	fa458593          	addi	a1,a1,-92 # 80002bac <_Z6mediumPv>
    80002c10:	fffff097          	auipc	ra,0xfffff
    80002c14:	68c080e7          	jalr	1676(ra) # 8000229c <_ZN6ThreadC1EPFvPvES0_>
    startThread->start();
    80002c18:	00048513          	mv	a0,s1
    80002c1c:	fffff097          	auipc	ra,0xfffff
    80002c20:	730080e7          	jalr	1840(ra) # 8000234c <_ZN6Thread5startEv>
    PCB::sleeping_list = new PCB_List();
    80002c24:	01000513          	li	a0,16
    80002c28:	00000097          	auipc	ra,0x0
    80002c2c:	874080e7          	jalr	-1932(ra) # 8000249c <_Znwm>
    80002c30:	00050493          	mv	s1,a0
    80002c34:	fffff097          	auipc	ra,0xfffff
    80002c38:	f40080e7          	jalr	-192(ra) # 80001b74 <_ZN8PCB_ListC1Ev>
    80002c3c:	00007797          	auipc	a5,0x7
    80002c40:	4a47b783          	ld	a5,1188(a5) # 8000a0e0 <_GLOBAL_OFFSET_TABLE_+0x58>
    80002c44:	0097b023          	sd	s1,0(a5)
    PCB::perioThreads = new PCB_List();
    80002c48:	01000513          	li	a0,16
    80002c4c:	00000097          	auipc	ra,0x0
    80002c50:	850080e7          	jalr	-1968(ra) # 8000249c <_Znwm>
    80002c54:	00050493          	mv	s1,a0
    80002c58:	fffff097          	auipc	ra,0xfffff
    80002c5c:	f1c080e7          	jalr	-228(ra) # 80001b74 <_ZN8PCB_ListC1Ev>
    80002c60:	00007797          	auipc	a5,0x7
    80002c64:	4507b783          	ld	a5,1104(a5) # 8000a0b0 <_GLOBAL_OFFSET_TABLE_+0x28>
    80002c68:	0097b023          	sd	s1,0(a5)
    PutCharThread* putCharThread =new PutCharThread();
    80002c6c:	01000513          	li	a0,16
    80002c70:	00000097          	auipc	ra,0x0
    80002c74:	82c080e7          	jalr	-2004(ra) # 8000249c <_Znwm>
    80002c78:	00050913          	mv	s2,a0

class PutCharThread : public Thread{

public:

    PutCharThread() : Thread(){
    80002c7c:	fffff097          	auipc	ra,0xfffff
    80002c80:	7bc080e7          	jalr	1980(ra) # 80002438 <_ZN6ThreadC1Ev>
    80002c84:	00007797          	auipc	a5,0x7
    80002c88:	2c478793          	addi	a5,a5,708 # 80009f48 <_ZTV13PutCharThread+0x10>
    80002c8c:	00f93023          	sd	a5,0(s2)
    GetCharThread* getCharThread = new GetCharThread();
    80002c90:	01000513          	li	a0,16
    80002c94:	00000097          	auipc	ra,0x0
    80002c98:	808080e7          	jalr	-2040(ra) # 8000249c <_Znwm>
    80002c9c:	00050493          	mv	s1,a0
};

class GetCharThread : public Thread{
public:

    GetCharThread() : Thread(){
    80002ca0:	fffff097          	auipc	ra,0xfffff
    80002ca4:	798080e7          	jalr	1944(ra) # 80002438 <_ZN6ThreadC1Ev>
    80002ca8:	00007797          	auipc	a5,0x7
    80002cac:	2c878793          	addi	a5,a5,712 # 80009f70 <_ZTV13GetCharThread+0x10>
    80002cb0:	00f4b023          	sd	a5,0(s1)
    Cons::outputBuffer = new CharBuffer(128 * sizeof (char));
    80002cb4:	03800513          	li	a0,56
    80002cb8:	fffff097          	auipc	ra,0xfffff
    80002cbc:	7e4080e7          	jalr	2020(ra) # 8000249c <_Znwm>
    80002cc0:	00050993          	mv	s3,a0
    80002cc4:	08000593          	li	a1,128
    80002cc8:	00001097          	auipc	ra,0x1
    80002ccc:	fb8080e7          	jalr	-72(ra) # 80003c80 <_ZN10CharBufferC1Ei>
    80002cd0:	00007797          	auipc	a5,0x7
    80002cd4:	4287b783          	ld	a5,1064(a5) # 8000a0f8 <_GLOBAL_OFFSET_TABLE_+0x70>
    80002cd8:	0137b023          	sd	s3,0(a5)
    Cons::inputBuffer = new CharBuffer(128 * sizeof (char));
    80002cdc:	03800513          	li	a0,56
    80002ce0:	fffff097          	auipc	ra,0xfffff
    80002ce4:	7bc080e7          	jalr	1980(ra) # 8000249c <_Znwm>
    80002ce8:	00050993          	mv	s3,a0
    80002cec:	08000593          	li	a1,128
    80002cf0:	00001097          	auipc	ra,0x1
    80002cf4:	f90080e7          	jalr	-112(ra) # 80003c80 <_ZN10CharBufferC1Ei>
    80002cf8:	00007797          	auipc	a5,0x7
    80002cfc:	3d87b783          	ld	a5,984(a5) # 8000a0d0 <_GLOBAL_OFFSET_TABLE_+0x48>
    80002d00:	0137b023          	sd	s3,0(a5)

    putCharThread->start();
    80002d04:	00090513          	mv	a0,s2
    80002d08:	fffff097          	auipc	ra,0xfffff
    80002d0c:	644080e7          	jalr	1604(ra) # 8000234c <_ZN6Thread5startEv>
    getCharThread->start();
    80002d10:	00048513          	mv	a0,s1
    80002d14:	fffff097          	auipc	ra,0xfffff
    80002d18:	638080e7          	jalr	1592(ra) # 8000234c <_ZN6Thread5startEv>

    //Interrupt::userMaskSoft();
    switchToUserMode();
    80002d1c:	fffff097          	auipc	ra,0xfffff
    80002d20:	95c080e7          	jalr	-1700(ra) # 80001678 <switchToUserMode>
}
    80002d24:	02813083          	ld	ra,40(sp)
    80002d28:	02013403          	ld	s0,32(sp)
    80002d2c:	01813483          	ld	s1,24(sp)
    80002d30:	01013903          	ld	s2,16(sp)
    80002d34:	00813983          	ld	s3,8(sp)
    80002d38:	03010113          	addi	sp,sp,48
    80002d3c:	00008067          	ret
    80002d40:	00050913          	mv	s2,a0
    Thread* startThread = new Thread(&medium, nullptr);
    80002d44:	00048513          	mv	a0,s1
    80002d48:	fffff097          	auipc	ra,0xfffff
    80002d4c:	7a4080e7          	jalr	1956(ra) # 800024ec <_ZdlPv>
    80002d50:	00090513          	mv	a0,s2
    80002d54:	00008097          	auipc	ra,0x8
    80002d58:	534080e7          	jalr	1332(ra) # 8000b288 <_Unwind_Resume>
    80002d5c:	00050913          	mv	s2,a0
    PCB::sleeping_list = new PCB_List();
    80002d60:	00048513          	mv	a0,s1
    80002d64:	fffff097          	auipc	ra,0xfffff
    80002d68:	788080e7          	jalr	1928(ra) # 800024ec <_ZdlPv>
    80002d6c:	00090513          	mv	a0,s2
    80002d70:	00008097          	auipc	ra,0x8
    80002d74:	518080e7          	jalr	1304(ra) # 8000b288 <_Unwind_Resume>
    80002d78:	00050913          	mv	s2,a0
    PCB::perioThreads = new PCB_List();
    80002d7c:	00048513          	mv	a0,s1
    80002d80:	fffff097          	auipc	ra,0xfffff
    80002d84:	76c080e7          	jalr	1900(ra) # 800024ec <_ZdlPv>
    80002d88:	00090513          	mv	a0,s2
    80002d8c:	00008097          	auipc	ra,0x8
    80002d90:	4fc080e7          	jalr	1276(ra) # 8000b288 <_Unwind_Resume>
    80002d94:	00050493          	mv	s1,a0
    PutCharThread* putCharThread =new PutCharThread();
    80002d98:	00090513          	mv	a0,s2
    80002d9c:	fffff097          	auipc	ra,0xfffff
    80002da0:	750080e7          	jalr	1872(ra) # 800024ec <_ZdlPv>
    80002da4:	00048513          	mv	a0,s1
    80002da8:	00008097          	auipc	ra,0x8
    80002dac:	4e0080e7          	jalr	1248(ra) # 8000b288 <_Unwind_Resume>
    80002db0:	00050913          	mv	s2,a0
    GetCharThread* getCharThread = new GetCharThread();
    80002db4:	00048513          	mv	a0,s1
    80002db8:	fffff097          	auipc	ra,0xfffff
    80002dbc:	734080e7          	jalr	1844(ra) # 800024ec <_ZdlPv>
    80002dc0:	00090513          	mv	a0,s2
    80002dc4:	00008097          	auipc	ra,0x8
    80002dc8:	4c4080e7          	jalr	1220(ra) # 8000b288 <_Unwind_Resume>
    80002dcc:	00050493          	mv	s1,a0
    Cons::outputBuffer = new CharBuffer(128 * sizeof (char));
    80002dd0:	00098513          	mv	a0,s3
    80002dd4:	fffff097          	auipc	ra,0xfffff
    80002dd8:	718080e7          	jalr	1816(ra) # 800024ec <_ZdlPv>
    80002ddc:	00048513          	mv	a0,s1
    80002de0:	00008097          	auipc	ra,0x8
    80002de4:	4a8080e7          	jalr	1192(ra) # 8000b288 <_Unwind_Resume>
    80002de8:	00050493          	mv	s1,a0
    Cons::inputBuffer = new CharBuffer(128 * sizeof (char));
    80002dec:	00098513          	mv	a0,s3
    80002df0:	fffff097          	auipc	ra,0xfffff
    80002df4:	6fc080e7          	jalr	1788(ra) # 800024ec <_ZdlPv>
    80002df8:	00048513          	mv	a0,s1
    80002dfc:	00008097          	auipc	ra,0x8
    80002e00:	48c080e7          	jalr	1164(ra) # 8000b288 <_Unwind_Resume>

0000000080002e04 <_Z4destv>:
void dest(){
    80002e04:	ff010113          	addi	sp,sp,-16
    80002e08:	00113423          	sd	ra,8(sp)
    80002e0c:	00813023          	sd	s0,0(sp)
    80002e10:	01010413          	addi	s0,sp,16
    while (Cons::outputBuffer->getSize() > 0){Thread::dispatch();}
    80002e14:	00007797          	auipc	a5,0x7
    80002e18:	2e47b783          	ld	a5,740(a5) # 8000a0f8 <_GLOBAL_OFFSET_TABLE_+0x70>
    80002e1c:	0007b503          	ld	a0,0(a5)
    80002e20:	00001097          	auipc	ra,0x1
    80002e24:	e44080e7          	jalr	-444(ra) # 80003c64 <_ZN10CharBuffer7getSizeEv>
    80002e28:	00a05863          	blez	a0,80002e38 <_Z4destv+0x34>
    80002e2c:	fffff097          	auipc	ra,0xfffff
    80002e30:	560080e7          	jalr	1376(ra) # 8000238c <_ZN6Thread8dispatchEv>
    80002e34:	fe1ff06f          	j	80002e14 <_Z4destv+0x10>

}
    80002e38:	00813083          	ld	ra,8(sp)
    80002e3c:	00013403          	ld	s0,0(sp)
    80002e40:	01010113          	addi	sp,sp,16
    80002e44:	00008067          	ret

0000000080002e48 <_ZN16ProducerKeyboard16producerKeyboardEPv>:
    void run() override {
        producerKeyboard(td);
    }
};

void ProducerKeyboard::producerKeyboard(void *arg) {
    80002e48:	fd010113          	addi	sp,sp,-48
    80002e4c:	02113423          	sd	ra,40(sp)
    80002e50:	02813023          	sd	s0,32(sp)
    80002e54:	00913c23          	sd	s1,24(sp)
    80002e58:	01213823          	sd	s2,16(sp)
    80002e5c:	01313423          	sd	s3,8(sp)
    80002e60:	03010413          	addi	s0,sp,48
    80002e64:	00050993          	mv	s3,a0
    80002e68:	00058493          	mv	s1,a1
    struct thread_data *data = (struct thread_data *) arg;

    int key;
    int i = 0;
    80002e6c:	00000913          	li	s2,0
    80002e70:	00c0006f          	j	80002e7c <_ZN16ProducerKeyboard16producerKeyboardEPv+0x34>
    while ((key = getc()) != 0x1b) {
        data->buffer->put(key);
        i++;

        if (i % (10 * data->id) == 0) {
            Thread::dispatch();
    80002e74:	fffff097          	auipc	ra,0xfffff
    80002e78:	518080e7          	jalr	1304(ra) # 8000238c <_ZN6Thread8dispatchEv>
    while ((key = getc()) != 0x1b) {
    80002e7c:	ffffe097          	auipc	ra,0xffffe
    80002e80:	78c080e7          	jalr	1932(ra) # 80001608 <getc>
    80002e84:	0005059b          	sext.w	a1,a0
    80002e88:	01b00793          	li	a5,27
    80002e8c:	02f58a63          	beq	a1,a5,80002ec0 <_ZN16ProducerKeyboard16producerKeyboardEPv+0x78>
        data->buffer->put(key);
    80002e90:	0084b503          	ld	a0,8(s1)
    80002e94:	00002097          	auipc	ra,0x2
    80002e98:	e58080e7          	jalr	-424(ra) # 80004cec <_ZN9BufferCPP3putEi>
        i++;
    80002e9c:	0019071b          	addiw	a4,s2,1
    80002ea0:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    80002ea4:	0004a683          	lw	a3,0(s1)
    80002ea8:	0026979b          	slliw	a5,a3,0x2
    80002eac:	00d787bb          	addw	a5,a5,a3
    80002eb0:	0017979b          	slliw	a5,a5,0x1
    80002eb4:	02f767bb          	remw	a5,a4,a5
    80002eb8:	fc0792e3          	bnez	a5,80002e7c <_ZN16ProducerKeyboard16producerKeyboardEPv+0x34>
    80002ebc:	fb9ff06f          	j	80002e74 <_ZN16ProducerKeyboard16producerKeyboardEPv+0x2c>
        }
    }

    threadEnd = 1;
    80002ec0:	00100793          	li	a5,1
    80002ec4:	00007717          	auipc	a4,0x7
    80002ec8:	2cf72623          	sw	a5,716(a4) # 8000a190 <threadEnd>
    td->buffer->put('!');
    80002ecc:	0109b783          	ld	a5,16(s3)
    80002ed0:	02100593          	li	a1,33
    80002ed4:	0087b503          	ld	a0,8(a5)
    80002ed8:	00002097          	auipc	ra,0x2
    80002edc:	e14080e7          	jalr	-492(ra) # 80004cec <_ZN9BufferCPP3putEi>

    data->wait->signal();
    80002ee0:	0104b503          	ld	a0,16(s1)
    80002ee4:	00000097          	auipc	ra,0x0
    80002ee8:	834080e7          	jalr	-1996(ra) # 80002718 <_ZN9Semaphore6signalEv>
}
    80002eec:	02813083          	ld	ra,40(sp)
    80002ef0:	02013403          	ld	s0,32(sp)
    80002ef4:	01813483          	ld	s1,24(sp)
    80002ef8:	01013903          	ld	s2,16(sp)
    80002efc:	00813983          	ld	s3,8(sp)
    80002f00:	03010113          	addi	sp,sp,48
    80002f04:	00008067          	ret

0000000080002f08 <_ZN8Producer8producerEPv>:
    void run() override {
        producer(td);
    }
};

void Producer::producer(void *arg) {
    80002f08:	fe010113          	addi	sp,sp,-32
    80002f0c:	00113c23          	sd	ra,24(sp)
    80002f10:	00813823          	sd	s0,16(sp)
    80002f14:	00913423          	sd	s1,8(sp)
    80002f18:	01213023          	sd	s2,0(sp)
    80002f1c:	02010413          	addi	s0,sp,32
    80002f20:	00058493          	mv	s1,a1
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    80002f24:	00000913          	li	s2,0
    80002f28:	00c0006f          	j	80002f34 <_ZN8Producer8producerEPv+0x2c>
    while (!threadEnd) {
        data->buffer->put(data->id + '0');
        i++;

        if (i % (10 * data->id) == 0) {
            Thread::dispatch();
    80002f2c:	fffff097          	auipc	ra,0xfffff
    80002f30:	460080e7          	jalr	1120(ra) # 8000238c <_ZN6Thread8dispatchEv>
    while (!threadEnd) {
    80002f34:	00007797          	auipc	a5,0x7
    80002f38:	25c7a783          	lw	a5,604(a5) # 8000a190 <threadEnd>
    80002f3c:	02079e63          	bnez	a5,80002f78 <_ZN8Producer8producerEPv+0x70>
        data->buffer->put(data->id + '0');
    80002f40:	0004a583          	lw	a1,0(s1)
    80002f44:	0305859b          	addiw	a1,a1,48
    80002f48:	0084b503          	ld	a0,8(s1)
    80002f4c:	00002097          	auipc	ra,0x2
    80002f50:	da0080e7          	jalr	-608(ra) # 80004cec <_ZN9BufferCPP3putEi>
        i++;
    80002f54:	0019071b          	addiw	a4,s2,1
    80002f58:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    80002f5c:	0004a683          	lw	a3,0(s1)
    80002f60:	0026979b          	slliw	a5,a3,0x2
    80002f64:	00d787bb          	addw	a5,a5,a3
    80002f68:	0017979b          	slliw	a5,a5,0x1
    80002f6c:	02f767bb          	remw	a5,a4,a5
    80002f70:	fc0792e3          	bnez	a5,80002f34 <_ZN8Producer8producerEPv+0x2c>
    80002f74:	fb9ff06f          	j	80002f2c <_ZN8Producer8producerEPv+0x24>
        }
    }

    data->wait->signal();
    80002f78:	0104b503          	ld	a0,16(s1)
    80002f7c:	fffff097          	auipc	ra,0xfffff
    80002f80:	79c080e7          	jalr	1948(ra) # 80002718 <_ZN9Semaphore6signalEv>
}
    80002f84:	01813083          	ld	ra,24(sp)
    80002f88:	01013403          	ld	s0,16(sp)
    80002f8c:	00813483          	ld	s1,8(sp)
    80002f90:	00013903          	ld	s2,0(sp)
    80002f94:	02010113          	addi	sp,sp,32
    80002f98:	00008067          	ret

0000000080002f9c <_ZN8Consumer8consumerEPv>:
    void run() override {
        consumer(td);
    }
};

void Consumer::consumer(void *arg) {
    80002f9c:	fd010113          	addi	sp,sp,-48
    80002fa0:	02113423          	sd	ra,40(sp)
    80002fa4:	02813023          	sd	s0,32(sp)
    80002fa8:	00913c23          	sd	s1,24(sp)
    80002fac:	01213823          	sd	s2,16(sp)
    80002fb0:	01313423          	sd	s3,8(sp)
    80002fb4:	01413023          	sd	s4,0(sp)
    80002fb8:	03010413          	addi	s0,sp,48
    80002fbc:	00050993          	mv	s3,a0
    80002fc0:	00058913          	mv	s2,a1
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    80002fc4:	00000a13          	li	s4,0
    80002fc8:	01c0006f          	j	80002fe4 <_ZN8Consumer8consumerEPv+0x48>
        i++;

        putc(key);

        if (i % (5 * data->id) == 0) {
            Thread::dispatch();
    80002fcc:	fffff097          	auipc	ra,0xfffff
    80002fd0:	3c0080e7          	jalr	960(ra) # 8000238c <_ZN6Thread8dispatchEv>
    80002fd4:	0500006f          	j	80003024 <_ZN8Consumer8consumerEPv+0x88>
        }

        if (i % 80 == 0) {
            putc('\n');
    80002fd8:	00a00513          	li	a0,10
    80002fdc:	ffffe097          	auipc	ra,0xffffe
    80002fe0:	664080e7          	jalr	1636(ra) # 80001640 <putc>
    while (!threadEnd) {
    80002fe4:	00007797          	auipc	a5,0x7
    80002fe8:	1ac7a783          	lw	a5,428(a5) # 8000a190 <threadEnd>
    80002fec:	06079263          	bnez	a5,80003050 <_ZN8Consumer8consumerEPv+0xb4>
        int key = data->buffer->get();
    80002ff0:	00893503          	ld	a0,8(s2)
    80002ff4:	00002097          	auipc	ra,0x2
    80002ff8:	d88080e7          	jalr	-632(ra) # 80004d7c <_ZN9BufferCPP3getEv>
        i++;
    80002ffc:	001a049b          	addiw	s1,s4,1
    80003000:	00048a1b          	sext.w	s4,s1
        putc(key);
    80003004:	0ff57513          	andi	a0,a0,255
    80003008:	ffffe097          	auipc	ra,0xffffe
    8000300c:	638080e7          	jalr	1592(ra) # 80001640 <putc>
        if (i % (5 * data->id) == 0) {
    80003010:	00092703          	lw	a4,0(s2)
    80003014:	0027179b          	slliw	a5,a4,0x2
    80003018:	00e787bb          	addw	a5,a5,a4
    8000301c:	02f4e7bb          	remw	a5,s1,a5
    80003020:	fa0786e3          	beqz	a5,80002fcc <_ZN8Consumer8consumerEPv+0x30>
        if (i % 80 == 0) {
    80003024:	05000793          	li	a5,80
    80003028:	02f4e4bb          	remw	s1,s1,a5
    8000302c:	fa049ce3          	bnez	s1,80002fe4 <_ZN8Consumer8consumerEPv+0x48>
    80003030:	fa9ff06f          	j	80002fd8 <_ZN8Consumer8consumerEPv+0x3c>
        }
    }


    while (td->buffer->getCnt() > 0) {
        int key = td->buffer->get();
    80003034:	0109b783          	ld	a5,16(s3)
    80003038:	0087b503          	ld	a0,8(a5)
    8000303c:	00002097          	auipc	ra,0x2
    80003040:	d40080e7          	jalr	-704(ra) # 80004d7c <_ZN9BufferCPP3getEv>
        Console::putc(key);
    80003044:	0ff57513          	andi	a0,a0,255
    80003048:	fffff097          	auipc	ra,0xfffff
    8000304c:	724080e7          	jalr	1828(ra) # 8000276c <_ZN7Console4putcEc>
    while (td->buffer->getCnt() > 0) {
    80003050:	0109b783          	ld	a5,16(s3)
    80003054:	0087b503          	ld	a0,8(a5)
    80003058:	00002097          	auipc	ra,0x2
    8000305c:	db0080e7          	jalr	-592(ra) # 80004e08 <_ZN9BufferCPP6getCntEv>
    80003060:	fca04ae3          	bgtz	a0,80003034 <_ZN8Consumer8consumerEPv+0x98>
    }

    data->wait->signal();
    80003064:	01093503          	ld	a0,16(s2)
    80003068:	fffff097          	auipc	ra,0xfffff
    8000306c:	6b0080e7          	jalr	1712(ra) # 80002718 <_ZN9Semaphore6signalEv>
}
    80003070:	02813083          	ld	ra,40(sp)
    80003074:	02013403          	ld	s0,32(sp)
    80003078:	01813483          	ld	s1,24(sp)
    8000307c:	01013903          	ld	s2,16(sp)
    80003080:	00813983          	ld	s3,8(sp)
    80003084:	00013a03          	ld	s4,0(sp)
    80003088:	03010113          	addi	sp,sp,48
    8000308c:	00008067          	ret

0000000080003090 <_Z29producerConsumer_CPP_Sync_APIv>:

void producerConsumer_CPP_Sync_API() {
    80003090:	f8010113          	addi	sp,sp,-128
    80003094:	06113c23          	sd	ra,120(sp)
    80003098:	06813823          	sd	s0,112(sp)
    8000309c:	06913423          	sd	s1,104(sp)
    800030a0:	07213023          	sd	s2,96(sp)
    800030a4:	05313c23          	sd	s3,88(sp)
    800030a8:	05413823          	sd	s4,80(sp)
    800030ac:	05513423          	sd	s5,72(sp)
    800030b0:	05613023          	sd	s6,64(sp)
    800030b4:	03713c23          	sd	s7,56(sp)
    800030b8:	03813823          	sd	s8,48(sp)
    800030bc:	03913423          	sd	s9,40(sp)
    800030c0:	08010413          	addi	s0,sp,128
    for (int i = 0; i < threadNum; i++) {
        delete threads[i];
    }
    delete consumerThread;
    delete waitForAll;
    delete buffer;
    800030c4:	00010b93          	mv	s7,sp
    printString("Unesite broj proizvodjaca?\n");
    800030c8:	00005517          	auipc	a0,0x5
    800030cc:	f5850513          	addi	a0,a0,-168 # 80008020 <CONSOLE_STATUS+0x8>
    800030d0:	00002097          	auipc	ra,0x2
    800030d4:	81c080e7          	jalr	-2020(ra) # 800048ec <_Z11printStringPKc>
    getString(input, 30);
    800030d8:	01e00593          	li	a1,30
    800030dc:	f8040493          	addi	s1,s0,-128
    800030e0:	00048513          	mv	a0,s1
    800030e4:	00002097          	auipc	ra,0x2
    800030e8:	884080e7          	jalr	-1916(ra) # 80004968 <_Z9getStringPci>
    threadNum = stringToInt(input);
    800030ec:	00048513          	mv	a0,s1
    800030f0:	00002097          	auipc	ra,0x2
    800030f4:	944080e7          	jalr	-1724(ra) # 80004a34 <_Z11stringToIntPKc>
    800030f8:	00050913          	mv	s2,a0
    printString("Unesite velicinu bafera?\n");
    800030fc:	00005517          	auipc	a0,0x5
    80003100:	f4450513          	addi	a0,a0,-188 # 80008040 <CONSOLE_STATUS+0x28>
    80003104:	00001097          	auipc	ra,0x1
    80003108:	7e8080e7          	jalr	2024(ra) # 800048ec <_Z11printStringPKc>
    getString(input, 30);
    8000310c:	01e00593          	li	a1,30
    80003110:	00048513          	mv	a0,s1
    80003114:	00002097          	auipc	ra,0x2
    80003118:	854080e7          	jalr	-1964(ra) # 80004968 <_Z9getStringPci>
    n = stringToInt(input);
    8000311c:	00048513          	mv	a0,s1
    80003120:	00002097          	auipc	ra,0x2
    80003124:	914080e7          	jalr	-1772(ra) # 80004a34 <_Z11stringToIntPKc>
    80003128:	00050493          	mv	s1,a0
    printString("Broj proizvodjaca "); printInt(threadNum);
    8000312c:	00005517          	auipc	a0,0x5
    80003130:	f3450513          	addi	a0,a0,-204 # 80008060 <CONSOLE_STATUS+0x48>
    80003134:	00001097          	auipc	ra,0x1
    80003138:	7b8080e7          	jalr	1976(ra) # 800048ec <_Z11printStringPKc>
    8000313c:	00000613          	li	a2,0
    80003140:	00a00593          	li	a1,10
    80003144:	00090513          	mv	a0,s2
    80003148:	00002097          	auipc	ra,0x2
    8000314c:	93c080e7          	jalr	-1732(ra) # 80004a84 <_Z8printIntiii>
    printString(" i velicina bafera "); printInt(n);
    80003150:	00005517          	auipc	a0,0x5
    80003154:	f2850513          	addi	a0,a0,-216 # 80008078 <CONSOLE_STATUS+0x60>
    80003158:	00001097          	auipc	ra,0x1
    8000315c:	794080e7          	jalr	1940(ra) # 800048ec <_Z11printStringPKc>
    80003160:	00000613          	li	a2,0
    80003164:	00a00593          	li	a1,10
    80003168:	00048513          	mv	a0,s1
    8000316c:	00002097          	auipc	ra,0x2
    80003170:	918080e7          	jalr	-1768(ra) # 80004a84 <_Z8printIntiii>
    printString(".\n");
    80003174:	00005517          	auipc	a0,0x5
    80003178:	f1c50513          	addi	a0,a0,-228 # 80008090 <CONSOLE_STATUS+0x78>
    8000317c:	00001097          	auipc	ra,0x1
    80003180:	770080e7          	jalr	1904(ra) # 800048ec <_Z11printStringPKc>
    if(threadNum > n) {
    80003184:	0324c463          	blt	s1,s2,800031ac <_Z29producerConsumer_CPP_Sync_APIv+0x11c>
    } else if (threadNum < 1) {
    80003188:	03205c63          	blez	s2,800031c0 <_Z29producerConsumer_CPP_Sync_APIv+0x130>
    BufferCPP *buffer = new BufferCPP(n);
    8000318c:	03800513          	li	a0,56
    80003190:	fffff097          	auipc	ra,0xfffff
    80003194:	30c080e7          	jalr	780(ra) # 8000249c <_Znwm>
    80003198:	00050a93          	mv	s5,a0
    8000319c:	00048593          	mv	a1,s1
    800031a0:	00002097          	auipc	ra,0x2
    800031a4:	9f8080e7          	jalr	-1544(ra) # 80004b98 <_ZN9BufferCPPC1Ei>
    800031a8:	0300006f          	j	800031d8 <_Z29producerConsumer_CPP_Sync_APIv+0x148>
        printString("Broj proizvodjaca ne sme biti manji od velicine bafera!\n");
    800031ac:	00005517          	auipc	a0,0x5
    800031b0:	eec50513          	addi	a0,a0,-276 # 80008098 <CONSOLE_STATUS+0x80>
    800031b4:	00001097          	auipc	ra,0x1
    800031b8:	738080e7          	jalr	1848(ra) # 800048ec <_Z11printStringPKc>
        return;
    800031bc:	0140006f          	j	800031d0 <_Z29producerConsumer_CPP_Sync_APIv+0x140>
        printString("Broj proizvodjaca mora biti veci od nula!\n");
    800031c0:	00005517          	auipc	a0,0x5
    800031c4:	f1850513          	addi	a0,a0,-232 # 800080d8 <CONSOLE_STATUS+0xc0>
    800031c8:	00001097          	auipc	ra,0x1
    800031cc:	724080e7          	jalr	1828(ra) # 800048ec <_Z11printStringPKc>
        return;
    800031d0:	000b8113          	mv	sp,s7
    800031d4:	2400006f          	j	80003414 <_Z29producerConsumer_CPP_Sync_APIv+0x384>
    waitForAll = new Semaphore(0);
    800031d8:	01000513          	li	a0,16
    800031dc:	fffff097          	auipc	ra,0xfffff
    800031e0:	2c0080e7          	jalr	704(ra) # 8000249c <_Znwm>
    800031e4:	00050493          	mv	s1,a0
    800031e8:	00000593          	li	a1,0
    800031ec:	fffff097          	auipc	ra,0xfffff
    800031f0:	108080e7          	jalr	264(ra) # 800022f4 <_ZN9SemaphoreC1Ej>
    800031f4:	00007717          	auipc	a4,0x7
    800031f8:	f9c70713          	addi	a4,a4,-100 # 8000a190 <threadEnd>
    800031fc:	00973423          	sd	s1,8(a4)
    Thread* threads[threadNum];
    80003200:	00391793          	slli	a5,s2,0x3
    80003204:	00f78793          	addi	a5,a5,15
    80003208:	ff07f793          	andi	a5,a5,-16
    8000320c:	40f10133          	sub	sp,sp,a5
    80003210:	00010993          	mv	s3,sp
    struct thread_data data[threadNum + 1];
    80003214:	0019069b          	addiw	a3,s2,1
    80003218:	00169793          	slli	a5,a3,0x1
    8000321c:	00d787b3          	add	a5,a5,a3
    80003220:	00379793          	slli	a5,a5,0x3
    80003224:	00f78793          	addi	a5,a5,15
    80003228:	ff07f793          	andi	a5,a5,-16
    8000322c:	40f10133          	sub	sp,sp,a5
    80003230:	00010a13          	mv	s4,sp
    data[threadNum].id = threadNum;
    80003234:	00191493          	slli	s1,s2,0x1
    80003238:	012487b3          	add	a5,s1,s2
    8000323c:	00379793          	slli	a5,a5,0x3
    80003240:	00fa07b3          	add	a5,s4,a5
    80003244:	0127a023          	sw	s2,0(a5)
    data[threadNum].buffer = buffer;
    80003248:	0157b423          	sd	s5,8(a5)
    data[threadNum].wait = waitForAll;
    8000324c:	00873703          	ld	a4,8(a4)
    80003250:	00e7b823          	sd	a4,16(a5)
    consumerThread = new Consumer(data+threadNum);
    80003254:	01800513          	li	a0,24
    80003258:	fffff097          	auipc	ra,0xfffff
    8000325c:	244080e7          	jalr	580(ra) # 8000249c <_Znwm>
    80003260:	00050b13          	mv	s6,a0
    80003264:	012484b3          	add	s1,s1,s2
    80003268:	00349493          	slli	s1,s1,0x3
    8000326c:	009a04b3          	add	s1,s4,s1
    Consumer(thread_data* _td):Thread(), td(_td) {}
    80003270:	fffff097          	auipc	ra,0xfffff
    80003274:	1c8080e7          	jalr	456(ra) # 80002438 <_ZN6ThreadC1Ev>
    80003278:	00007797          	auipc	a5,0x7
    8000327c:	dd078793          	addi	a5,a5,-560 # 8000a048 <_ZTV8Consumer+0x10>
    80003280:	00fb3023          	sd	a5,0(s6)
    80003284:	009b3823          	sd	s1,16(s6)
    consumerThread->start();
    80003288:	000b0513          	mv	a0,s6
    8000328c:	fffff097          	auipc	ra,0xfffff
    80003290:	0c0080e7          	jalr	192(ra) # 8000234c <_ZN6Thread5startEv>
    for (int i = 0; i < threadNum; i++) {
    80003294:	00000493          	li	s1,0
    80003298:	0380006f          	j	800032d0 <_Z29producerConsumer_CPP_Sync_APIv+0x240>
    Producer(thread_data* _td):Thread(), td(_td) {}
    8000329c:	00007797          	auipc	a5,0x7
    800032a0:	d8478793          	addi	a5,a5,-636 # 8000a020 <_ZTV8Producer+0x10>
    800032a4:	00fcb023          	sd	a5,0(s9)
    800032a8:	018cb823          	sd	s8,16(s9)
            threads[i] = new Producer(data+i);
    800032ac:	00349793          	slli	a5,s1,0x3
    800032b0:	00f987b3          	add	a5,s3,a5
    800032b4:	0197b023          	sd	s9,0(a5)
        threads[i]->start();
    800032b8:	00349793          	slli	a5,s1,0x3
    800032bc:	00f987b3          	add	a5,s3,a5
    800032c0:	0007b503          	ld	a0,0(a5)
    800032c4:	fffff097          	auipc	ra,0xfffff
    800032c8:	088080e7          	jalr	136(ra) # 8000234c <_ZN6Thread5startEv>
    for (int i = 0; i < threadNum; i++) {
    800032cc:	0014849b          	addiw	s1,s1,1
    800032d0:	0b24d063          	bge	s1,s2,80003370 <_Z29producerConsumer_CPP_Sync_APIv+0x2e0>
        data[i].id = i;
    800032d4:	00149793          	slli	a5,s1,0x1
    800032d8:	009787b3          	add	a5,a5,s1
    800032dc:	00379793          	slli	a5,a5,0x3
    800032e0:	00fa07b3          	add	a5,s4,a5
    800032e4:	0097a023          	sw	s1,0(a5)
        data[i].buffer = buffer;
    800032e8:	0157b423          	sd	s5,8(a5)
        data[i].wait = waitForAll;
    800032ec:	00007717          	auipc	a4,0x7
    800032f0:	eac73703          	ld	a4,-340(a4) # 8000a198 <waitForAll>
    800032f4:	00e7b823          	sd	a4,16(a5)
        if(i>0) {
    800032f8:	02905863          	blez	s1,80003328 <_Z29producerConsumer_CPP_Sync_APIv+0x298>
            threads[i] = new Producer(data+i);
    800032fc:	01800513          	li	a0,24
    80003300:	fffff097          	auipc	ra,0xfffff
    80003304:	19c080e7          	jalr	412(ra) # 8000249c <_Znwm>
    80003308:	00050c93          	mv	s9,a0
    8000330c:	00149c13          	slli	s8,s1,0x1
    80003310:	009c0c33          	add	s8,s8,s1
    80003314:	003c1c13          	slli	s8,s8,0x3
    80003318:	018a0c33          	add	s8,s4,s8
    Producer(thread_data* _td):Thread(), td(_td) {}
    8000331c:	fffff097          	auipc	ra,0xfffff
    80003320:	11c080e7          	jalr	284(ra) # 80002438 <_ZN6ThreadC1Ev>
    80003324:	f79ff06f          	j	8000329c <_Z29producerConsumer_CPP_Sync_APIv+0x20c>
            threads[i] = new ProducerKeyboard(data+i);
    80003328:	01800513          	li	a0,24
    8000332c:	fffff097          	auipc	ra,0xfffff
    80003330:	170080e7          	jalr	368(ra) # 8000249c <_Znwm>
    80003334:	00050c93          	mv	s9,a0
    80003338:	00149c13          	slli	s8,s1,0x1
    8000333c:	009c0c33          	add	s8,s8,s1
    80003340:	003c1c13          	slli	s8,s8,0x3
    80003344:	018a0c33          	add	s8,s4,s8
    ProducerKeyboard(thread_data* _td):Thread(), td(_td) {}
    80003348:	fffff097          	auipc	ra,0xfffff
    8000334c:	0f0080e7          	jalr	240(ra) # 80002438 <_ZN6ThreadC1Ev>
    80003350:	00007797          	auipc	a5,0x7
    80003354:	ca878793          	addi	a5,a5,-856 # 80009ff8 <_ZTV16ProducerKeyboard+0x10>
    80003358:	00fcb023          	sd	a5,0(s9)
    8000335c:	018cb823          	sd	s8,16(s9)
            threads[i] = new ProducerKeyboard(data+i);
    80003360:	00349793          	slli	a5,s1,0x3
    80003364:	00f987b3          	add	a5,s3,a5
    80003368:	0197b023          	sd	s9,0(a5)
    8000336c:	f4dff06f          	j	800032b8 <_Z29producerConsumer_CPP_Sync_APIv+0x228>
    Thread::dispatch();
    80003370:	fffff097          	auipc	ra,0xfffff
    80003374:	01c080e7          	jalr	28(ra) # 8000238c <_ZN6Thread8dispatchEv>
    for (int i = 0; i <= threadNum; i++) {
    80003378:	00000493          	li	s1,0
    8000337c:	00994e63          	blt	s2,s1,80003398 <_Z29producerConsumer_CPP_Sync_APIv+0x308>
        waitForAll->wait();
    80003380:	00007517          	auipc	a0,0x7
    80003384:	e1853503          	ld	a0,-488(a0) # 8000a198 <waitForAll>
    80003388:	fffff097          	auipc	ra,0xfffff
    8000338c:	364080e7          	jalr	868(ra) # 800026ec <_ZN9Semaphore4waitEv>
    for (int i = 0; i <= threadNum; i++) {
    80003390:	0014849b          	addiw	s1,s1,1
    80003394:	fe9ff06f          	j	8000337c <_Z29producerConsumer_CPP_Sync_APIv+0x2ec>
    for (int i = 0; i < threadNum; i++) {
    80003398:	00000493          	li	s1,0
    8000339c:	0080006f          	j	800033a4 <_Z29producerConsumer_CPP_Sync_APIv+0x314>
    800033a0:	0014849b          	addiw	s1,s1,1
    800033a4:	0324d263          	bge	s1,s2,800033c8 <_Z29producerConsumer_CPP_Sync_APIv+0x338>
        delete threads[i];
    800033a8:	00349793          	slli	a5,s1,0x3
    800033ac:	00f987b3          	add	a5,s3,a5
    800033b0:	0007b503          	ld	a0,0(a5)
    800033b4:	fe0506e3          	beqz	a0,800033a0 <_Z29producerConsumer_CPP_Sync_APIv+0x310>
    800033b8:	00053783          	ld	a5,0(a0)
    800033bc:	0087b783          	ld	a5,8(a5)
    800033c0:	000780e7          	jalr	a5
    800033c4:	fddff06f          	j	800033a0 <_Z29producerConsumer_CPP_Sync_APIv+0x310>
    delete consumerThread;
    800033c8:	000b0a63          	beqz	s6,800033dc <_Z29producerConsumer_CPP_Sync_APIv+0x34c>
    800033cc:	000b3783          	ld	a5,0(s6)
    800033d0:	0087b783          	ld	a5,8(a5)
    800033d4:	000b0513          	mv	a0,s6
    800033d8:	000780e7          	jalr	a5
    delete waitForAll;
    800033dc:	00007517          	auipc	a0,0x7
    800033e0:	dbc53503          	ld	a0,-580(a0) # 8000a198 <waitForAll>
    800033e4:	00050863          	beqz	a0,800033f4 <_Z29producerConsumer_CPP_Sync_APIv+0x364>
    800033e8:	00053783          	ld	a5,0(a0)
    800033ec:	0087b783          	ld	a5,8(a5)
    800033f0:	000780e7          	jalr	a5
    delete buffer;
    800033f4:	000a8e63          	beqz	s5,80003410 <_Z29producerConsumer_CPP_Sync_APIv+0x380>
    800033f8:	000a8513          	mv	a0,s5
    800033fc:	00002097          	auipc	ra,0x2
    80003400:	a94080e7          	jalr	-1388(ra) # 80004e90 <_ZN9BufferCPPD1Ev>
    80003404:	000a8513          	mv	a0,s5
    80003408:	fffff097          	auipc	ra,0xfffff
    8000340c:	0e4080e7          	jalr	228(ra) # 800024ec <_ZdlPv>
    80003410:	000b8113          	mv	sp,s7

}
    80003414:	f8040113          	addi	sp,s0,-128
    80003418:	07813083          	ld	ra,120(sp)
    8000341c:	07013403          	ld	s0,112(sp)
    80003420:	06813483          	ld	s1,104(sp)
    80003424:	06013903          	ld	s2,96(sp)
    80003428:	05813983          	ld	s3,88(sp)
    8000342c:	05013a03          	ld	s4,80(sp)
    80003430:	04813a83          	ld	s5,72(sp)
    80003434:	04013b03          	ld	s6,64(sp)
    80003438:	03813b83          	ld	s7,56(sp)
    8000343c:	03013c03          	ld	s8,48(sp)
    80003440:	02813c83          	ld	s9,40(sp)
    80003444:	08010113          	addi	sp,sp,128
    80003448:	00008067          	ret
    8000344c:	00050493          	mv	s1,a0
    BufferCPP *buffer = new BufferCPP(n);
    80003450:	000a8513          	mv	a0,s5
    80003454:	fffff097          	auipc	ra,0xfffff
    80003458:	098080e7          	jalr	152(ra) # 800024ec <_ZdlPv>
    8000345c:	00048513          	mv	a0,s1
    80003460:	00008097          	auipc	ra,0x8
    80003464:	e28080e7          	jalr	-472(ra) # 8000b288 <_Unwind_Resume>
    80003468:	00050913          	mv	s2,a0
    waitForAll = new Semaphore(0);
    8000346c:	00048513          	mv	a0,s1
    80003470:	fffff097          	auipc	ra,0xfffff
    80003474:	07c080e7          	jalr	124(ra) # 800024ec <_ZdlPv>
    80003478:	00090513          	mv	a0,s2
    8000347c:	00008097          	auipc	ra,0x8
    80003480:	e0c080e7          	jalr	-500(ra) # 8000b288 <_Unwind_Resume>
    80003484:	00050493          	mv	s1,a0
    consumerThread = new Consumer(data+threadNum);
    80003488:	000b0513          	mv	a0,s6
    8000348c:	fffff097          	auipc	ra,0xfffff
    80003490:	060080e7          	jalr	96(ra) # 800024ec <_ZdlPv>
    80003494:	00048513          	mv	a0,s1
    80003498:	00008097          	auipc	ra,0x8
    8000349c:	df0080e7          	jalr	-528(ra) # 8000b288 <_Unwind_Resume>
    800034a0:	00050493          	mv	s1,a0
            threads[i] = new Producer(data+i);
    800034a4:	000c8513          	mv	a0,s9
    800034a8:	fffff097          	auipc	ra,0xfffff
    800034ac:	044080e7          	jalr	68(ra) # 800024ec <_ZdlPv>
    800034b0:	00048513          	mv	a0,s1
    800034b4:	00008097          	auipc	ra,0x8
    800034b8:	dd4080e7          	jalr	-556(ra) # 8000b288 <_Unwind_Resume>
    800034bc:	00050493          	mv	s1,a0
            threads[i] = new ProducerKeyboard(data+i);
    800034c0:	000c8513          	mv	a0,s9
    800034c4:	fffff097          	auipc	ra,0xfffff
    800034c8:	028080e7          	jalr	40(ra) # 800024ec <_ZdlPv>
    800034cc:	00048513          	mv	a0,s1
    800034d0:	00008097          	auipc	ra,0x8
    800034d4:	db8080e7          	jalr	-584(ra) # 8000b288 <_Unwind_Resume>

00000000800034d8 <_Z8userMainv>:
#include "../test/ConsumerProducer_CPP_Sync_API_test.hpp" // zadatak 3., kompletan CPP API sa semaforima, sinhrona promena konteksta

//#include "../test/ThreadSleep_C_API_test.hpp" // thread_sleep test C API
//#include "../test/ConsumerProducer_CPP_API_test.hpp" // zadatak 4. CPP API i asinhrona promena konteksta

void userMain() {
    800034d8:	ff010113          	addi	sp,sp,-16
    800034dc:	00113423          	sd	ra,8(sp)
    800034e0:	00813023          	sd	s0,0(sp)
    800034e4:	01010413          	addi	s0,sp,16
    //Threads_C_API_test(); // zadatak 2., niti C API i sinhrona promena konteksta
    //Threads_CPP_API_test(); // zadatak 2., niti CPP API i sinhrona promena konteksta

    //producerConsumer_C_API(); // zadatak 3., kompletan C API sa semaforima, sinhrona promena konteksta
    producerConsumer_CPP_Sync_API(); // zadatak 3., kompletan CPP API sa semaforima, sinhrona promena konteksta
    800034e8:	00000097          	auipc	ra,0x0
    800034ec:	ba8080e7          	jalr	-1112(ra) # 80003090 <_Z29producerConsumer_CPP_Sync_APIv>

    //testSleeping(); // thread_sleep test C API
    //ConsumerProducerCPP::testConsumerProducer(); // zadatak 4. CPP API i asinhrona promena konteksta, kompletan test svega


}
    800034f0:	00813083          	ld	ra,8(sp)
    800034f4:	00013403          	ld	s0,0(sp)
    800034f8:	01010113          	addi	sp,sp,16
    800034fc:	00008067          	ret

0000000080003500 <main>:
//COMPLETED
int main(){
    80003500:	fe010113          	addi	sp,sp,-32
    80003504:	00113c23          	sd	ra,24(sp)
    80003508:	00813823          	sd	s0,16(sp)
    8000350c:	00913423          	sd	s1,8(sp)
    80003510:	01213023          	sd	s2,0(sp)
    80003514:	02010413          	addi	s0,sp,32
    init();
    80003518:	fffff097          	auipc	ra,0xfffff
    8000351c:	6b0080e7          	jalr	1712(ra) # 80002bc8 <_Z4initv>
    //userMain();
    PrintP *thread = new PrintP(30);
    80003520:	01000513          	li	a0,16
    80003524:	fffff097          	auipc	ra,0xfffff
    80003528:	f78080e7          	jalr	-136(ra) # 8000249c <_Znwm>
    8000352c:	00050913          	mv	s2,a0
    PrintP(time_t time) : PeriodicThread(time){}
    80003530:	01e00593          	li	a1,30
    80003534:	fffff097          	auipc	ra,0xfffff
    80003538:	020080e7          	jalr	32(ra) # 80002554 <_ZN14PeriodicThreadC1Em>
    8000353c:	00007797          	auipc	a5,0x7
    80003540:	a5c78793          	addi	a5,a5,-1444 # 80009f98 <_ZTV6PrintP+0x10>
    80003544:	00f93023          	sd	a5,0(s2)
    PrintA *thread1 = new PrintA(5);
    80003548:	01000513          	li	a0,16
    8000354c:	fffff097          	auipc	ra,0xfffff
    80003550:	f50080e7          	jalr	-176(ra) # 8000249c <_Znwm>
    80003554:	00050493          	mv	s1,a0
    PrintA(time_t time) : PeriodicThread(time){}
    80003558:	00500593          	li	a1,5
    8000355c:	fffff097          	auipc	ra,0xfffff
    80003560:	ff8080e7          	jalr	-8(ra) # 80002554 <_ZN14PeriodicThreadC1Em>
    80003564:	00007797          	auipc	a5,0x7
    80003568:	a6478793          	addi	a5,a5,-1436 # 80009fc8 <_ZTV6PrintA+0x10>
    8000356c:	00f4b023          	sd	a5,0(s1)
    thread->start();
    80003570:	00090513          	mv	a0,s2
    80003574:	fffff097          	auipc	ra,0xfffff
    80003578:	dd8080e7          	jalr	-552(ra) # 8000234c <_ZN6Thread5startEv>
    thread1->start();
    8000357c:	00048513          	mv	a0,s1
    80003580:	fffff097          	auipc	ra,0xfffff
    80003584:	dcc080e7          	jalr	-564(ra) # 8000234c <_ZN6Thread5startEv>
    80003588:	00c0006f          	j	80003594 <main+0x94>
    while (true){
        char c = Console::getc();
        if(c == 103) {
            block_All_Periodic();
    8000358c:	ffffe097          	auipc	ra,0xffffe
    80003590:	048080e7          	jalr	72(ra) # 800015d4 <block_All_Periodic>
        char c = Console::getc();
    80003594:	fffff097          	auipc	ra,0xfffff
    80003598:	1b0080e7          	jalr	432(ra) # 80002744 <_ZN7Console4getcEv>
        if(c == 103) {
    8000359c:	06700793          	li	a5,103
    800035a0:	fef51ae3          	bne	a0,a5,80003594 <main+0x94>
    800035a4:	fe9ff06f          	j	8000358c <main+0x8c>
    800035a8:	00050493          	mv	s1,a0
    PrintP *thread = new PrintP(30);
    800035ac:	00090513          	mv	a0,s2
    800035b0:	fffff097          	auipc	ra,0xfffff
    800035b4:	f3c080e7          	jalr	-196(ra) # 800024ec <_ZdlPv>
    800035b8:	00048513          	mv	a0,s1
    800035bc:	00008097          	auipc	ra,0x8
    800035c0:	ccc080e7          	jalr	-820(ra) # 8000b288 <_Unwind_Resume>
    800035c4:	00050913          	mv	s2,a0
    PrintA *thread1 = new PrintA(5);
    800035c8:	00048513          	mv	a0,s1
    800035cc:	fffff097          	auipc	ra,0xfffff
    800035d0:	f20080e7          	jalr	-224(ra) # 800024ec <_ZdlPv>
    800035d4:	00090513          	mv	a0,s2
    800035d8:	00008097          	auipc	ra,0x8
    800035dc:	cb0080e7          	jalr	-848(ra) # 8000b288 <_Unwind_Resume>

00000000800035e0 <_ZN13GetCharThread3runEv>:
    }
protected:
    void run() override{
    800035e0:	ff010113          	addi	sp,sp,-16
    800035e4:	00113423          	sd	ra,8(sp)
    800035e8:	00813023          	sd	s0,0(sp)
    800035ec:	01010413          	addi	s0,sp,16
        while (true){
            Thread::dispatch();
    800035f0:	fffff097          	auipc	ra,0xfffff
    800035f4:	d9c080e7          	jalr	-612(ra) # 8000238c <_ZN6Thread8dispatchEv>
        while (true){
    800035f8:	ff9ff06f          	j	800035f0 <_ZN13GetCharThread3runEv+0x10>

00000000800035fc <_ZN13PutCharThread3runEv>:
    void run() override{
    800035fc:	fd010113          	addi	sp,sp,-48
    80003600:	02113423          	sd	ra,40(sp)
    80003604:	02813023          	sd	s0,32(sp)
    80003608:	00913c23          	sd	s1,24(sp)
    8000360c:	03010413          	addi	s0,sp,48
            volatile char status = *((char *) CONSOLE_STATUS);
    80003610:	00007797          	auipc	a5,0x7
    80003614:	a907b783          	ld	a5,-1392(a5) # 8000a0a0 <_GLOBAL_OFFSET_TABLE_+0x18>
    80003618:	0007b483          	ld	s1,0(a5)
    8000361c:	0004c783          	lbu	a5,0(s1)
    80003620:	fcf40fa3          	sb	a5,-33(s0)
            while ((status & CONSOLE_TX_STATUS_BIT)) {
    80003624:	fdf44783          	lbu	a5,-33(s0)
    80003628:	0ff7f793          	andi	a5,a5,255
    8000362c:	0207f793          	andi	a5,a5,32
    80003630:	fe0780e3          	beqz	a5,80003610 <_ZN13PutCharThread3runEv+0x14>
                char c = Cons::outputBuffer->get();
    80003634:	00007797          	auipc	a5,0x7
    80003638:	ac47b783          	ld	a5,-1340(a5) # 8000a0f8 <_GLOBAL_OFFSET_TABLE_+0x70>
    8000363c:	0007b503          	ld	a0,0(a5)
    80003640:	00000097          	auipc	ra,0x0
    80003644:	4e8080e7          	jalr	1256(ra) # 80003b28 <_ZN10CharBuffer3getEv>
                *((char *) CONSOLE_TX_DATA) = c;
    80003648:	00007797          	auipc	a5,0x7
    8000364c:	a707b783          	ld	a5,-1424(a5) # 8000a0b8 <_GLOBAL_OFFSET_TABLE_+0x30>
    80003650:	0007b783          	ld	a5,0(a5)
    80003654:	00a78023          	sb	a0,0(a5)
                status = *((char *) CONSOLE_STATUS);
    80003658:	0004c783          	lbu	a5,0(s1)
    8000365c:	fcf40fa3          	sb	a5,-33(s0)
            while ((status & CONSOLE_TX_STATUS_BIT)) {
    80003660:	fc5ff06f          	j	80003624 <_ZN13PutCharThread3runEv+0x28>

0000000080003664 <_ZN13PutCharThreadD1Ev>:
class PutCharThread : public Thread{
    80003664:	ff010113          	addi	sp,sp,-16
    80003668:	00113423          	sd	ra,8(sp)
    8000366c:	00813023          	sd	s0,0(sp)
    80003670:	01010413          	addi	s0,sp,16
    80003674:	00007797          	auipc	a5,0x7
    80003678:	8d478793          	addi	a5,a5,-1836 # 80009f48 <_ZTV13PutCharThread+0x10>
    8000367c:	00f53023          	sd	a5,0(a0)
    80003680:	fffff097          	auipc	ra,0xfffff
    80003684:	e94080e7          	jalr	-364(ra) # 80002514 <_ZN6ThreadD1Ev>
    80003688:	00813083          	ld	ra,8(sp)
    8000368c:	00013403          	ld	s0,0(sp)
    80003690:	01010113          	addi	sp,sp,16
    80003694:	00008067          	ret

0000000080003698 <_ZN13PutCharThreadD0Ev>:
    80003698:	fe010113          	addi	sp,sp,-32
    8000369c:	00113c23          	sd	ra,24(sp)
    800036a0:	00813823          	sd	s0,16(sp)
    800036a4:	00913423          	sd	s1,8(sp)
    800036a8:	02010413          	addi	s0,sp,32
    800036ac:	00050493          	mv	s1,a0
    800036b0:	00007797          	auipc	a5,0x7
    800036b4:	89878793          	addi	a5,a5,-1896 # 80009f48 <_ZTV13PutCharThread+0x10>
    800036b8:	00f53023          	sd	a5,0(a0)
    800036bc:	fffff097          	auipc	ra,0xfffff
    800036c0:	e58080e7          	jalr	-424(ra) # 80002514 <_ZN6ThreadD1Ev>
    800036c4:	00048513          	mv	a0,s1
    800036c8:	fffff097          	auipc	ra,0xfffff
    800036cc:	e24080e7          	jalr	-476(ra) # 800024ec <_ZdlPv>
    800036d0:	01813083          	ld	ra,24(sp)
    800036d4:	01013403          	ld	s0,16(sp)
    800036d8:	00813483          	ld	s1,8(sp)
    800036dc:	02010113          	addi	sp,sp,32
    800036e0:	00008067          	ret

00000000800036e4 <_ZN13GetCharThreadD1Ev>:
class GetCharThread : public Thread{
    800036e4:	ff010113          	addi	sp,sp,-16
    800036e8:	00113423          	sd	ra,8(sp)
    800036ec:	00813023          	sd	s0,0(sp)
    800036f0:	01010413          	addi	s0,sp,16
    800036f4:	00007797          	auipc	a5,0x7
    800036f8:	87c78793          	addi	a5,a5,-1924 # 80009f70 <_ZTV13GetCharThread+0x10>
    800036fc:	00f53023          	sd	a5,0(a0)
    80003700:	fffff097          	auipc	ra,0xfffff
    80003704:	e14080e7          	jalr	-492(ra) # 80002514 <_ZN6ThreadD1Ev>
    80003708:	00813083          	ld	ra,8(sp)
    8000370c:	00013403          	ld	s0,0(sp)
    80003710:	01010113          	addi	sp,sp,16
    80003714:	00008067          	ret

0000000080003718 <_ZN13GetCharThreadD0Ev>:
    80003718:	fe010113          	addi	sp,sp,-32
    8000371c:	00113c23          	sd	ra,24(sp)
    80003720:	00813823          	sd	s0,16(sp)
    80003724:	00913423          	sd	s1,8(sp)
    80003728:	02010413          	addi	s0,sp,32
    8000372c:	00050493          	mv	s1,a0
    80003730:	00007797          	auipc	a5,0x7
    80003734:	84078793          	addi	a5,a5,-1984 # 80009f70 <_ZTV13GetCharThread+0x10>
    80003738:	00f53023          	sd	a5,0(a0)
    8000373c:	fffff097          	auipc	ra,0xfffff
    80003740:	dd8080e7          	jalr	-552(ra) # 80002514 <_ZN6ThreadD1Ev>
    80003744:	00048513          	mv	a0,s1
    80003748:	fffff097          	auipc	ra,0xfffff
    8000374c:	da4080e7          	jalr	-604(ra) # 800024ec <_ZdlPv>
    80003750:	01813083          	ld	ra,24(sp)
    80003754:	01013403          	ld	s0,16(sp)
    80003758:	00813483          	ld	s1,8(sp)
    8000375c:	02010113          	addi	sp,sp,32
    80003760:	00008067          	ret

0000000080003764 <_ZN8ConsumerD1Ev>:
class Consumer:public Thread {
    80003764:	ff010113          	addi	sp,sp,-16
    80003768:	00113423          	sd	ra,8(sp)
    8000376c:	00813023          	sd	s0,0(sp)
    80003770:	01010413          	addi	s0,sp,16
    80003774:	00007797          	auipc	a5,0x7
    80003778:	8d478793          	addi	a5,a5,-1836 # 8000a048 <_ZTV8Consumer+0x10>
    8000377c:	00f53023          	sd	a5,0(a0)
    80003780:	fffff097          	auipc	ra,0xfffff
    80003784:	d94080e7          	jalr	-620(ra) # 80002514 <_ZN6ThreadD1Ev>
    80003788:	00813083          	ld	ra,8(sp)
    8000378c:	00013403          	ld	s0,0(sp)
    80003790:	01010113          	addi	sp,sp,16
    80003794:	00008067          	ret

0000000080003798 <_ZN8ConsumerD0Ev>:
    80003798:	fe010113          	addi	sp,sp,-32
    8000379c:	00113c23          	sd	ra,24(sp)
    800037a0:	00813823          	sd	s0,16(sp)
    800037a4:	00913423          	sd	s1,8(sp)
    800037a8:	02010413          	addi	s0,sp,32
    800037ac:	00050493          	mv	s1,a0
    800037b0:	00007797          	auipc	a5,0x7
    800037b4:	89878793          	addi	a5,a5,-1896 # 8000a048 <_ZTV8Consumer+0x10>
    800037b8:	00f53023          	sd	a5,0(a0)
    800037bc:	fffff097          	auipc	ra,0xfffff
    800037c0:	d58080e7          	jalr	-680(ra) # 80002514 <_ZN6ThreadD1Ev>
    800037c4:	00048513          	mv	a0,s1
    800037c8:	fffff097          	auipc	ra,0xfffff
    800037cc:	d24080e7          	jalr	-732(ra) # 800024ec <_ZdlPv>
    800037d0:	01813083          	ld	ra,24(sp)
    800037d4:	01013403          	ld	s0,16(sp)
    800037d8:	00813483          	ld	s1,8(sp)
    800037dc:	02010113          	addi	sp,sp,32
    800037e0:	00008067          	ret

00000000800037e4 <_ZN8ProducerD1Ev>:
class Producer:public Thread {
    800037e4:	ff010113          	addi	sp,sp,-16
    800037e8:	00113423          	sd	ra,8(sp)
    800037ec:	00813023          	sd	s0,0(sp)
    800037f0:	01010413          	addi	s0,sp,16
    800037f4:	00007797          	auipc	a5,0x7
    800037f8:	82c78793          	addi	a5,a5,-2004 # 8000a020 <_ZTV8Producer+0x10>
    800037fc:	00f53023          	sd	a5,0(a0)
    80003800:	fffff097          	auipc	ra,0xfffff
    80003804:	d14080e7          	jalr	-748(ra) # 80002514 <_ZN6ThreadD1Ev>
    80003808:	00813083          	ld	ra,8(sp)
    8000380c:	00013403          	ld	s0,0(sp)
    80003810:	01010113          	addi	sp,sp,16
    80003814:	00008067          	ret

0000000080003818 <_ZN8ProducerD0Ev>:
    80003818:	fe010113          	addi	sp,sp,-32
    8000381c:	00113c23          	sd	ra,24(sp)
    80003820:	00813823          	sd	s0,16(sp)
    80003824:	00913423          	sd	s1,8(sp)
    80003828:	02010413          	addi	s0,sp,32
    8000382c:	00050493          	mv	s1,a0
    80003830:	00006797          	auipc	a5,0x6
    80003834:	7f078793          	addi	a5,a5,2032 # 8000a020 <_ZTV8Producer+0x10>
    80003838:	00f53023          	sd	a5,0(a0)
    8000383c:	fffff097          	auipc	ra,0xfffff
    80003840:	cd8080e7          	jalr	-808(ra) # 80002514 <_ZN6ThreadD1Ev>
    80003844:	00048513          	mv	a0,s1
    80003848:	fffff097          	auipc	ra,0xfffff
    8000384c:	ca4080e7          	jalr	-860(ra) # 800024ec <_ZdlPv>
    80003850:	01813083          	ld	ra,24(sp)
    80003854:	01013403          	ld	s0,16(sp)
    80003858:	00813483          	ld	s1,8(sp)
    8000385c:	02010113          	addi	sp,sp,32
    80003860:	00008067          	ret

0000000080003864 <_ZN16ProducerKeyboardD1Ev>:
class ProducerKeyboard:public Thread {
    80003864:	ff010113          	addi	sp,sp,-16
    80003868:	00113423          	sd	ra,8(sp)
    8000386c:	00813023          	sd	s0,0(sp)
    80003870:	01010413          	addi	s0,sp,16
    80003874:	00006797          	auipc	a5,0x6
    80003878:	78478793          	addi	a5,a5,1924 # 80009ff8 <_ZTV16ProducerKeyboard+0x10>
    8000387c:	00f53023          	sd	a5,0(a0)
    80003880:	fffff097          	auipc	ra,0xfffff
    80003884:	c94080e7          	jalr	-876(ra) # 80002514 <_ZN6ThreadD1Ev>
    80003888:	00813083          	ld	ra,8(sp)
    8000388c:	00013403          	ld	s0,0(sp)
    80003890:	01010113          	addi	sp,sp,16
    80003894:	00008067          	ret

0000000080003898 <_ZN16ProducerKeyboardD0Ev>:
    80003898:	fe010113          	addi	sp,sp,-32
    8000389c:	00113c23          	sd	ra,24(sp)
    800038a0:	00813823          	sd	s0,16(sp)
    800038a4:	00913423          	sd	s1,8(sp)
    800038a8:	02010413          	addi	s0,sp,32
    800038ac:	00050493          	mv	s1,a0
    800038b0:	00006797          	auipc	a5,0x6
    800038b4:	74878793          	addi	a5,a5,1864 # 80009ff8 <_ZTV16ProducerKeyboard+0x10>
    800038b8:	00f53023          	sd	a5,0(a0)
    800038bc:	fffff097          	auipc	ra,0xfffff
    800038c0:	c58080e7          	jalr	-936(ra) # 80002514 <_ZN6ThreadD1Ev>
    800038c4:	00048513          	mv	a0,s1
    800038c8:	fffff097          	auipc	ra,0xfffff
    800038cc:	c24080e7          	jalr	-988(ra) # 800024ec <_ZdlPv>
    800038d0:	01813083          	ld	ra,24(sp)
    800038d4:	01013403          	ld	s0,16(sp)
    800038d8:	00813483          	ld	s1,8(sp)
    800038dc:	02010113          	addi	sp,sp,32
    800038e0:	00008067          	ret

00000000800038e4 <_ZN6PrintPD1Ev>:
class PrintP : public PeriodicThread{
    800038e4:	ff010113          	addi	sp,sp,-16
    800038e8:	00113423          	sd	ra,8(sp)
    800038ec:	00813023          	sd	s0,0(sp)
    800038f0:	01010413          	addi	s0,sp,16
    800038f4:	00006797          	auipc	a5,0x6
    800038f8:	5d478793          	addi	a5,a5,1492 # 80009ec8 <_ZTV14PeriodicThread+0x10>
    800038fc:	00f53023          	sd	a5,0(a0)
    80003900:	fffff097          	auipc	ra,0xfffff
    80003904:	c14080e7          	jalr	-1004(ra) # 80002514 <_ZN6ThreadD1Ev>
    80003908:	00813083          	ld	ra,8(sp)
    8000390c:	00013403          	ld	s0,0(sp)
    80003910:	01010113          	addi	sp,sp,16
    80003914:	00008067          	ret

0000000080003918 <_ZN6PrintPD0Ev>:
    80003918:	fe010113          	addi	sp,sp,-32
    8000391c:	00113c23          	sd	ra,24(sp)
    80003920:	00813823          	sd	s0,16(sp)
    80003924:	00913423          	sd	s1,8(sp)
    80003928:	02010413          	addi	s0,sp,32
    8000392c:	00050493          	mv	s1,a0
    80003930:	00006797          	auipc	a5,0x6
    80003934:	59878793          	addi	a5,a5,1432 # 80009ec8 <_ZTV14PeriodicThread+0x10>
    80003938:	00f53023          	sd	a5,0(a0)
    8000393c:	fffff097          	auipc	ra,0xfffff
    80003940:	bd8080e7          	jalr	-1064(ra) # 80002514 <_ZN6ThreadD1Ev>
    80003944:	00048513          	mv	a0,s1
    80003948:	fffff097          	auipc	ra,0xfffff
    8000394c:	ba4080e7          	jalr	-1116(ra) # 800024ec <_ZdlPv>
    80003950:	01813083          	ld	ra,24(sp)
    80003954:	01013403          	ld	s0,16(sp)
    80003958:	00813483          	ld	s1,8(sp)
    8000395c:	02010113          	addi	sp,sp,32
    80003960:	00008067          	ret

0000000080003964 <_ZN6PrintAD1Ev>:
class PrintA : public PeriodicThread{
    80003964:	ff010113          	addi	sp,sp,-16
    80003968:	00113423          	sd	ra,8(sp)
    8000396c:	00813023          	sd	s0,0(sp)
    80003970:	01010413          	addi	s0,sp,16
    80003974:	00006797          	auipc	a5,0x6
    80003978:	55478793          	addi	a5,a5,1364 # 80009ec8 <_ZTV14PeriodicThread+0x10>
    8000397c:	00f53023          	sd	a5,0(a0)
    80003980:	fffff097          	auipc	ra,0xfffff
    80003984:	b94080e7          	jalr	-1132(ra) # 80002514 <_ZN6ThreadD1Ev>
    80003988:	00813083          	ld	ra,8(sp)
    8000398c:	00013403          	ld	s0,0(sp)
    80003990:	01010113          	addi	sp,sp,16
    80003994:	00008067          	ret

0000000080003998 <_ZN6PrintAD0Ev>:
    80003998:	fe010113          	addi	sp,sp,-32
    8000399c:	00113c23          	sd	ra,24(sp)
    800039a0:	00813823          	sd	s0,16(sp)
    800039a4:	00913423          	sd	s1,8(sp)
    800039a8:	02010413          	addi	s0,sp,32
    800039ac:	00050493          	mv	s1,a0
    800039b0:	00006797          	auipc	a5,0x6
    800039b4:	51878793          	addi	a5,a5,1304 # 80009ec8 <_ZTV14PeriodicThread+0x10>
    800039b8:	00f53023          	sd	a5,0(a0)
    800039bc:	fffff097          	auipc	ra,0xfffff
    800039c0:	b58080e7          	jalr	-1192(ra) # 80002514 <_ZN6ThreadD1Ev>
    800039c4:	00048513          	mv	a0,s1
    800039c8:	fffff097          	auipc	ra,0xfffff
    800039cc:	b24080e7          	jalr	-1244(ra) # 800024ec <_ZdlPv>
    800039d0:	01813083          	ld	ra,24(sp)
    800039d4:	01013403          	ld	s0,16(sp)
    800039d8:	00813483          	ld	s1,8(sp)
    800039dc:	02010113          	addi	sp,sp,32
    800039e0:	00008067          	ret

00000000800039e4 <_ZN6PrintP18periodicActivationEv>:
    void periodicActivation () {
    800039e4:	ff010113          	addi	sp,sp,-16
    800039e8:	00113423          	sd	ra,8(sp)
    800039ec:	00813023          	sd	s0,0(sp)
    800039f0:	01010413          	addi	s0,sp,16
        Console::putc('A');
    800039f4:	04100513          	li	a0,65
    800039f8:	fffff097          	auipc	ra,0xfffff
    800039fc:	d74080e7          	jalr	-652(ra) # 8000276c <_ZN7Console4putcEc>
        Console::putc(' ');
    80003a00:	02000513          	li	a0,32
    80003a04:	fffff097          	auipc	ra,0xfffff
    80003a08:	d68080e7          	jalr	-664(ra) # 8000276c <_ZN7Console4putcEc>
    }
    80003a0c:	00813083          	ld	ra,8(sp)
    80003a10:	00013403          	ld	s0,0(sp)
    80003a14:	01010113          	addi	sp,sp,16
    80003a18:	00008067          	ret

0000000080003a1c <_ZN6PrintA18periodicActivationEv>:
    void periodicActivation () {
    80003a1c:	ff010113          	addi	sp,sp,-16
    80003a20:	00113423          	sd	ra,8(sp)
    80003a24:	00813023          	sd	s0,0(sp)
    80003a28:	01010413          	addi	s0,sp,16
        Console::putc('B');
    80003a2c:	04200513          	li	a0,66
    80003a30:	fffff097          	auipc	ra,0xfffff
    80003a34:	d3c080e7          	jalr	-708(ra) # 8000276c <_ZN7Console4putcEc>
        Console::putc(' ');
    80003a38:	02000513          	li	a0,32
    80003a3c:	fffff097          	auipc	ra,0xfffff
    80003a40:	d30080e7          	jalr	-720(ra) # 8000276c <_ZN7Console4putcEc>
    }
    80003a44:	00813083          	ld	ra,8(sp)
    80003a48:	00013403          	ld	s0,0(sp)
    80003a4c:	01010113          	addi	sp,sp,16
    80003a50:	00008067          	ret

0000000080003a54 <_ZN16ProducerKeyboard3runEv>:
    void run() override {
    80003a54:	ff010113          	addi	sp,sp,-16
    80003a58:	00113423          	sd	ra,8(sp)
    80003a5c:	00813023          	sd	s0,0(sp)
    80003a60:	01010413          	addi	s0,sp,16
        producerKeyboard(td);
    80003a64:	01053583          	ld	a1,16(a0)
    80003a68:	fffff097          	auipc	ra,0xfffff
    80003a6c:	3e0080e7          	jalr	992(ra) # 80002e48 <_ZN16ProducerKeyboard16producerKeyboardEPv>
    }
    80003a70:	00813083          	ld	ra,8(sp)
    80003a74:	00013403          	ld	s0,0(sp)
    80003a78:	01010113          	addi	sp,sp,16
    80003a7c:	00008067          	ret

0000000080003a80 <_ZN8Producer3runEv>:
    void run() override {
    80003a80:	ff010113          	addi	sp,sp,-16
    80003a84:	00113423          	sd	ra,8(sp)
    80003a88:	00813023          	sd	s0,0(sp)
    80003a8c:	01010413          	addi	s0,sp,16
        producer(td);
    80003a90:	01053583          	ld	a1,16(a0)
    80003a94:	fffff097          	auipc	ra,0xfffff
    80003a98:	474080e7          	jalr	1140(ra) # 80002f08 <_ZN8Producer8producerEPv>
    }
    80003a9c:	00813083          	ld	ra,8(sp)
    80003aa0:	00013403          	ld	s0,0(sp)
    80003aa4:	01010113          	addi	sp,sp,16
    80003aa8:	00008067          	ret

0000000080003aac <_ZN8Consumer3runEv>:
    void run() override {
    80003aac:	ff010113          	addi	sp,sp,-16
    80003ab0:	00113423          	sd	ra,8(sp)
    80003ab4:	00813023          	sd	s0,0(sp)
    80003ab8:	01010413          	addi	s0,sp,16
        consumer(td);
    80003abc:	01053583          	ld	a1,16(a0)
    80003ac0:	fffff097          	auipc	ra,0xfffff
    80003ac4:	4dc080e7          	jalr	1244(ra) # 80002f9c <_ZN8Consumer8consumerEPv>
    }
    80003ac8:	00813083          	ld	ra,8(sp)
    80003acc:	00013403          	ld	s0,0(sp)
    80003ad0:	01010113          	addi	sp,sp,16
    80003ad4:	00008067          	ret

0000000080003ad8 <_ZN15MemoryAllocator9mem_allocEm>:
#include "../h/MemoryAllocator.h"




void *MemoryAllocator::mem_alloc(size_t size) {
    80003ad8:	ff010113          	addi	sp,sp,-16
    80003adc:	00113423          	sd	ra,8(sp)
    80003ae0:	00813023          	sd	s0,0(sp)
    80003ae4:	01010413          	addi	s0,sp,16
    return FreeShardList::find_best(size);
    80003ae8:	fffff097          	auipc	ra,0xfffff
    80003aec:	dfc080e7          	jalr	-516(ra) # 800028e4 <_ZN13FreeShardList9find_bestEm>

}
    80003af0:	00813083          	ld	ra,8(sp)
    80003af4:	00013403          	ld	s0,0(sp)
    80003af8:	01010113          	addi	sp,sp,16
    80003afc:	00008067          	ret

0000000080003b00 <_ZN15MemoryAllocator8mem_freeEPv>:

int MemoryAllocator::mem_free(void * mem) {
    80003b00:	ff010113          	addi	sp,sp,-16
    80003b04:	00113423          	sd	ra,8(sp)
    80003b08:	00813023          	sd	s0,0(sp)
    80003b0c:	01010413          	addi	s0,sp,16
    return FreeShardList::free_memory(mem);
    80003b10:	fffff097          	auipc	ra,0xfffff
    80003b14:	ec8080e7          	jalr	-312(ra) # 800029d8 <_ZN13FreeShardList11free_memoryEPv>


}
    80003b18:	00813083          	ld	ra,8(sp)
    80003b1c:	00013403          	ld	s0,0(sp)
    80003b20:	01010113          	addi	sp,sp,16
    80003b24:	00008067          	ret

0000000080003b28 <_ZN10CharBuffer3getEv>:
#include "../h/Cons.hpp"



char CharBuffer::get() {
    80003b28:	fe010113          	addi	sp,sp,-32
    80003b2c:	00113c23          	sd	ra,24(sp)
    80003b30:	00813823          	sd	s0,16(sp)
    80003b34:	00913423          	sd	s1,8(sp)
    80003b38:	01213023          	sd	s2,0(sp)
    80003b3c:	02010413          	addi	s0,sp,32
    80003b40:	00050493          	mv	s1,a0
   getSem->wait();
    80003b44:	01053503          	ld	a0,16(a0)
    80003b48:	ffffe097          	auipc	ra,0xffffe
    80003b4c:	438080e7          	jalr	1080(ra) # 80001f80 <_ZN3Sem4waitEv>
   mutexGet->wait();
    80003b50:	0004b503          	ld	a0,0(s1)
    80003b54:	ffffe097          	auipc	ra,0xffffe
    80003b58:	42c080e7          	jalr	1068(ra) # 80001f80 <_ZN3Sem4waitEv>
    char c = buffer[head];
    80003b5c:	0304b703          	ld	a4,48(s1)
    80003b60:	0204a783          	lw	a5,32(s1)
    80003b64:	00f70733          	add	a4,a4,a5
    80003b68:	00074903          	lbu	s2,0(a4)
    head = (head + 1)%size;
    80003b6c:	0017879b          	addiw	a5,a5,1
    80003b70:	0284a703          	lw	a4,40(s1)
    80003b74:	02e7e7bb          	remw	a5,a5,a4
    80003b78:	02f4a023          	sw	a5,32(s1)
    currSize--;
    80003b7c:	02c4a783          	lw	a5,44(s1)
    80003b80:	fff7879b          	addiw	a5,a5,-1
    80003b84:	02f4a623          	sw	a5,44(s1)
    mutexGet->signal();
    80003b88:	0004b503          	ld	a0,0(s1)
    80003b8c:	ffffe097          	auipc	ra,0xffffe
    80003b90:	48c080e7          	jalr	1164(ra) # 80002018 <_ZN3Sem6signalEv>
   putSem->signal();
    80003b94:	0184b503          	ld	a0,24(s1)
    80003b98:	ffffe097          	auipc	ra,0xffffe
    80003b9c:	480080e7          	jalr	1152(ra) # 80002018 <_ZN3Sem6signalEv>
    return c;
}
    80003ba0:	00090513          	mv	a0,s2
    80003ba4:	01813083          	ld	ra,24(sp)
    80003ba8:	01013403          	ld	s0,16(sp)
    80003bac:	00813483          	ld	s1,8(sp)
    80003bb0:	00013903          	ld	s2,0(sp)
    80003bb4:	02010113          	addi	sp,sp,32
    80003bb8:	00008067          	ret

0000000080003bbc <_ZN10CharBuffer3putEc>:

void CharBuffer::put(char c) {
    if(this->currSize >= this->size) return;
    80003bbc:	02c52703          	lw	a4,44(a0)
    80003bc0:	02852783          	lw	a5,40(a0)
    80003bc4:	00f74463          	blt	a4,a5,80003bcc <_ZN10CharBuffer3putEc+0x10>
    80003bc8:	00008067          	ret
void CharBuffer::put(char c) {
    80003bcc:	fe010113          	addi	sp,sp,-32
    80003bd0:	00113c23          	sd	ra,24(sp)
    80003bd4:	00813823          	sd	s0,16(sp)
    80003bd8:	00913423          	sd	s1,8(sp)
    80003bdc:	01213023          	sd	s2,0(sp)
    80003be0:	02010413          	addi	s0,sp,32
    80003be4:	00050493          	mv	s1,a0
    80003be8:	00058913          	mv	s2,a1
    putSem->wait();
    80003bec:	01853503          	ld	a0,24(a0)
    80003bf0:	ffffe097          	auipc	ra,0xffffe
    80003bf4:	390080e7          	jalr	912(ra) # 80001f80 <_ZN3Sem4waitEv>
    mutexPut->wait();
    80003bf8:	0084b503          	ld	a0,8(s1)
    80003bfc:	ffffe097          	auipc	ra,0xffffe
    80003c00:	384080e7          	jalr	900(ra) # 80001f80 <_ZN3Sem4waitEv>
    buffer[tail] = c;
    80003c04:	0304b783          	ld	a5,48(s1)
    80003c08:	0244a703          	lw	a4,36(s1)
    80003c0c:	00e787b3          	add	a5,a5,a4
    80003c10:	01278023          	sb	s2,0(a5)
    tail = (tail + 1)%size;
    80003c14:	0244a783          	lw	a5,36(s1)
    80003c18:	0017879b          	addiw	a5,a5,1
    80003c1c:	0284a703          	lw	a4,40(s1)
    80003c20:	02e7e7bb          	remw	a5,a5,a4
    80003c24:	02f4a223          	sw	a5,36(s1)
    currSize++;
    80003c28:	02c4a783          	lw	a5,44(s1)
    80003c2c:	0017879b          	addiw	a5,a5,1
    80003c30:	02f4a623          	sw	a5,44(s1)
    mutexPut->signal();
    80003c34:	0084b503          	ld	a0,8(s1)
    80003c38:	ffffe097          	auipc	ra,0xffffe
    80003c3c:	3e0080e7          	jalr	992(ra) # 80002018 <_ZN3Sem6signalEv>
    getSem->signal();
    80003c40:	0104b503          	ld	a0,16(s1)
    80003c44:	ffffe097          	auipc	ra,0xffffe
    80003c48:	3d4080e7          	jalr	980(ra) # 80002018 <_ZN3Sem6signalEv>

}
    80003c4c:	01813083          	ld	ra,24(sp)
    80003c50:	01013403          	ld	s0,16(sp)
    80003c54:	00813483          	ld	s1,8(sp)
    80003c58:	00013903          	ld	s2,0(sp)
    80003c5c:	02010113          	addi	sp,sp,32
    80003c60:	00008067          	ret

0000000080003c64 <_ZN10CharBuffer7getSizeEv>:

int CharBuffer::getSize() {
    80003c64:	ff010113          	addi	sp,sp,-16
    80003c68:	00813423          	sd	s0,8(sp)
    80003c6c:	01010413          	addi	s0,sp,16
    return currSize;
}
    80003c70:	02c52503          	lw	a0,44(a0)
    80003c74:	00813403          	ld	s0,8(sp)
    80003c78:	01010113          	addi	sp,sp,16
    80003c7c:	00008067          	ret

0000000080003c80 <_ZN10CharBufferC1Ei>:

CharBuffer::CharBuffer(int size) {
    80003c80:	fd010113          	addi	sp,sp,-48
    80003c84:	02113423          	sd	ra,40(sp)
    80003c88:	02813023          	sd	s0,32(sp)
    80003c8c:	00913c23          	sd	s1,24(sp)
    80003c90:	01213823          	sd	s2,16(sp)
    80003c94:	01313423          	sd	s3,8(sp)
    80003c98:	03010413          	addi	s0,sp,48
    80003c9c:	00050493          	mv	s1,a0
    80003ca0:	00058913          	mv	s2,a1
    mutexGet = new Sem(1);
    80003ca4:	01000513          	li	a0,16
    80003ca8:	ffffe097          	auipc	ra,0xffffe
    80003cac:	7f4080e7          	jalr	2036(ra) # 8000249c <_Znwm>
    80003cb0:	00050993          	mv	s3,a0
    80003cb4:	00100593          	li	a1,1
    80003cb8:	ffffe097          	auipc	ra,0xffffe
    80003cbc:	204080e7          	jalr	516(ra) # 80001ebc <_ZN3SemC1Ei>
    80003cc0:	0134b023          	sd	s3,0(s1)
    mutexPut = new Sem(1);
    80003cc4:	01000513          	li	a0,16
    80003cc8:	ffffe097          	auipc	ra,0xffffe
    80003ccc:	7d4080e7          	jalr	2004(ra) # 8000249c <_Znwm>
    80003cd0:	00050993          	mv	s3,a0
    80003cd4:	00100593          	li	a1,1
    80003cd8:	ffffe097          	auipc	ra,0xffffe
    80003cdc:	1e4080e7          	jalr	484(ra) # 80001ebc <_ZN3SemC1Ei>
    80003ce0:	0134b423          	sd	s3,8(s1)
    getSem = new Sem(0);
    80003ce4:	01000513          	li	a0,16
    80003ce8:	ffffe097          	auipc	ra,0xffffe
    80003cec:	7b4080e7          	jalr	1972(ra) # 8000249c <_Znwm>
    80003cf0:	00050993          	mv	s3,a0
    80003cf4:	00000593          	li	a1,0
    80003cf8:	ffffe097          	auipc	ra,0xffffe
    80003cfc:	1c4080e7          	jalr	452(ra) # 80001ebc <_ZN3SemC1Ei>
    80003d00:	0134b823          	sd	s3,16(s1)
    putSem = new Sem(size);
    80003d04:	01000513          	li	a0,16
    80003d08:	ffffe097          	auipc	ra,0xffffe
    80003d0c:	794080e7          	jalr	1940(ra) # 8000249c <_Znwm>
    80003d10:	00050993          	mv	s3,a0
    80003d14:	00090593          	mv	a1,s2
    80003d18:	ffffe097          	auipc	ra,0xffffe
    80003d1c:	1a4080e7          	jalr	420(ra) # 80001ebc <_ZN3SemC1Ei>
    80003d20:	0134bc23          	sd	s3,24(s1)
    this->size = size;
    80003d24:	0324a423          	sw	s2,40(s1)
    head = 0;
    80003d28:	0204a023          	sw	zero,32(s1)
    tail = 0;
    80003d2c:	0204a223          	sw	zero,36(s1)
    currSize = 0;
    80003d30:	0204a623          	sw	zero,44(s1)
    buffer = new char[size];
    80003d34:	00090513          	mv	a0,s2
    80003d38:	ffffe097          	auipc	ra,0xffffe
    80003d3c:	78c080e7          	jalr	1932(ra) # 800024c4 <_Znam>
    80003d40:	02a4b823          	sd	a0,48(s1)
}
    80003d44:	02813083          	ld	ra,40(sp)
    80003d48:	02013403          	ld	s0,32(sp)
    80003d4c:	01813483          	ld	s1,24(sp)
    80003d50:	01013903          	ld	s2,16(sp)
    80003d54:	00813983          	ld	s3,8(sp)
    80003d58:	03010113          	addi	sp,sp,48
    80003d5c:	00008067          	ret
    80003d60:	00050493          	mv	s1,a0
    mutexGet = new Sem(1);
    80003d64:	00098513          	mv	a0,s3
    80003d68:	ffffe097          	auipc	ra,0xffffe
    80003d6c:	784080e7          	jalr	1924(ra) # 800024ec <_ZdlPv>
    80003d70:	00048513          	mv	a0,s1
    80003d74:	00007097          	auipc	ra,0x7
    80003d78:	514080e7          	jalr	1300(ra) # 8000b288 <_Unwind_Resume>
    80003d7c:	00050493          	mv	s1,a0
    mutexPut = new Sem(1);
    80003d80:	00098513          	mv	a0,s3
    80003d84:	ffffe097          	auipc	ra,0xffffe
    80003d88:	768080e7          	jalr	1896(ra) # 800024ec <_ZdlPv>
    80003d8c:	00048513          	mv	a0,s1
    80003d90:	00007097          	auipc	ra,0x7
    80003d94:	4f8080e7          	jalr	1272(ra) # 8000b288 <_Unwind_Resume>
    80003d98:	00050493          	mv	s1,a0
    getSem = new Sem(0);
    80003d9c:	00098513          	mv	a0,s3
    80003da0:	ffffe097          	auipc	ra,0xffffe
    80003da4:	74c080e7          	jalr	1868(ra) # 800024ec <_ZdlPv>
    80003da8:	00048513          	mv	a0,s1
    80003dac:	00007097          	auipc	ra,0x7
    80003db0:	4dc080e7          	jalr	1244(ra) # 8000b288 <_Unwind_Resume>
    80003db4:	00050493          	mv	s1,a0
    putSem = new Sem(size);
    80003db8:	00098513          	mv	a0,s3
    80003dbc:	ffffe097          	auipc	ra,0xffffe
    80003dc0:	730080e7          	jalr	1840(ra) # 800024ec <_ZdlPv>
    80003dc4:	00048513          	mv	a0,s1
    80003dc8:	00007097          	auipc	ra,0x7
    80003dcc:	4c0080e7          	jalr	1216(ra) # 8000b288 <_Unwind_Resume>

0000000080003dd0 <_ZN10CharBufferD1Ev>:

CharBuffer::~CharBuffer() {
    80003dd0:	fe010113          	addi	sp,sp,-32
    80003dd4:	00113c23          	sd	ra,24(sp)
    80003dd8:	00813823          	sd	s0,16(sp)
    80003ddc:	00913423          	sd	s1,8(sp)
    80003de0:	02010413          	addi	s0,sp,32
    80003de4:	00050493          	mv	s1,a0
    delete mutexGet;
    80003de8:	00053503          	ld	a0,0(a0)
    80003dec:	00050663          	beqz	a0,80003df8 <_ZN10CharBufferD1Ev+0x28>
    80003df0:	ffffe097          	auipc	ra,0xffffe
    80003df4:	6fc080e7          	jalr	1788(ra) # 800024ec <_ZdlPv>
    delete mutexPut;
    80003df8:	0084b503          	ld	a0,8(s1)
    80003dfc:	00050663          	beqz	a0,80003e08 <_ZN10CharBufferD1Ev+0x38>
    80003e00:	ffffe097          	auipc	ra,0xffffe
    80003e04:	6ec080e7          	jalr	1772(ra) # 800024ec <_ZdlPv>
    delete getSem;
    80003e08:	0104b503          	ld	a0,16(s1)
    80003e0c:	00050663          	beqz	a0,80003e18 <_ZN10CharBufferD1Ev+0x48>
    80003e10:	ffffe097          	auipc	ra,0xffffe
    80003e14:	6dc080e7          	jalr	1756(ra) # 800024ec <_ZdlPv>
    delete putSem;
    80003e18:	0184b503          	ld	a0,24(s1)
    80003e1c:	00050663          	beqz	a0,80003e28 <_ZN10CharBufferD1Ev+0x58>
    80003e20:	ffffe097          	auipc	ra,0xffffe
    80003e24:	6cc080e7          	jalr	1740(ra) # 800024ec <_ZdlPv>
    delete buffer;
    80003e28:	0304b503          	ld	a0,48(s1)
    80003e2c:	00050663          	beqz	a0,80003e38 <_ZN10CharBufferD1Ev+0x68>
    80003e30:	ffffe097          	auipc	ra,0xffffe
    80003e34:	6bc080e7          	jalr	1724(ra) # 800024ec <_ZdlPv>
    size = head = tail = 0;
}
    80003e38:	01813083          	ld	ra,24(sp)
    80003e3c:	01013403          	ld	s0,16(sp)
    80003e40:	00813483          	ld	s1,8(sp)
    80003e44:	02010113          	addi	sp,sp,32
    80003e48:	00008067          	ret

0000000080003e4c <_ZN10CharBuffer10getMaxSizeEv>:

int CharBuffer::getMaxSize() {
    80003e4c:	ff010113          	addi	sp,sp,-16
    80003e50:	00813423          	sd	s0,8(sp)
    80003e54:	01010413          	addi	s0,sp,16
    return size;
}
    80003e58:	02852503          	lw	a0,40(a0)
    80003e5c:	00813403          	ld	s0,8(sp)
    80003e60:	01010113          	addi	sp,sp,16
    80003e64:	00008067          	ret

0000000080003e68 <_ZN4ConsC1Ev>:

CharBuffer* Cons::inputBuffer;
CharBuffer* Cons::outputBuffer;
Cons::Cons() {
    80003e68:	ff010113          	addi	sp,sp,-16
    80003e6c:	00813423          	sd	s0,8(sp)
    80003e70:	01010413          	addi	s0,sp,16

}
    80003e74:	00813403          	ld	s0,8(sp)
    80003e78:	01010113          	addi	sp,sp,16
    80003e7c:	00008067          	ret

0000000080003e80 <_ZN9Interrupt7callSysEmmmmm>:
        plic_complete(irq);
    }

}

void Interrupt::callSys(uint64 opCode, uint64 arg1,uint64 arg2 , uint64 arg3 , uint64 arg4) {
    80003e80:	f5010113          	addi	sp,sp,-176
    80003e84:	0a113423          	sd	ra,168(sp)
    80003e88:	0a813023          	sd	s0,160(sp)
    80003e8c:	08913c23          	sd	s1,152(sp)
    80003e90:	09213823          	sd	s2,144(sp)
    80003e94:	09313423          	sd	s3,136(sp)
    80003e98:	09413023          	sd	s4,128(sp)
    80003e9c:	07513c23          	sd	s5,120(sp)
    80003ea0:	0b010413          	addi	s0,sp,176
    80003ea4:	00058493          	mv	s1,a1
    //switchToSystemStack();
    if(opCode == 0x1){
    80003ea8:	00100793          	li	a5,1
    80003eac:	0af50a63          	beq	a0,a5,80003f60 <_ZN9Interrupt7callSysEmmmmm+0xe0>
    80003eb0:	00060913          	mv	s2,a2
    80003eb4:	00068993          	mv	s3,a3
    80003eb8:	00070a13          	mv	s4,a4
        header++;
        __asm__ volatile("mv a0,%0" : : "r"((uint64)header));


    }
    else if(opCode == 0x2){
    80003ebc:	00200793          	li	a5,2
    80003ec0:	0ef50463          	beq	a0,a5,80003fa8 <_ZN9Interrupt7callSysEmmmmm+0x128>
        uint64 adr = arg1;
        int res = MemoryAllocator::mem_free((void*) adr);
        __asm__ volatile("mv a0,%0" : : "r"((uint64)res));

    }
    else if(opCode == 0x10){
    80003ec4:	01000793          	li	a5,16
    80003ec8:	0ef50a63          	beq	a0,a5,80003fbc <_ZN9Interrupt7callSysEmmmmm+0x13c>
                                                       DEFAULT_TIME_SLICE);
            res = 0;
            __asm__ volatile("mv a0,%0" : : "r"(res));
        }
    }
    else if(opCode == 0x11) {
    80003ecc:	01100793          	li	a5,17
    80003ed0:	18f50e63          	beq	a0,a5,8000406c <_ZN9Interrupt7callSysEmmmmm+0x1ec>
            }
            res = 0;
            __asm__ volatile("mv a0,%0" : : "r"(res));
        }
    }
    else if(opCode == 0x12){
    80003ed4:	01200793          	li	a5,18
    80003ed8:	26f50e63          	beq	a0,a5,80004154 <_ZN9Interrupt7callSysEmmmmm+0x2d4>
            uint64 res = -1;
            __asm__ volatile("mv a0,%0" : : "r"(res));
        }

    }
    else if(opCode == 0x13){
    80003edc:	01300793          	li	a5,19
    80003ee0:	2af50463          	beq	a0,a5,80004188 <_ZN9Interrupt7callSysEmmmmm+0x308>
        PCB::timeLeft = 0;
        PCB::dispatch();
    }
    else if(opCode == 0x21){
    80003ee4:	02100793          	li	a5,33
    80003ee8:	2af50c63          	beq	a0,a5,800041a0 <_ZN9Interrupt7callSysEmmmmm+0x320>
            res = 0;
            __asm__ volatile("mv a0,%0" : : "r"(res));
        }

    }
    else if(opCode == 0x22){
    80003eec:	02200793          	li	a5,34
    80003ef0:	30f50663          	beq	a0,a5,800041fc <_ZN9Interrupt7callSysEmmmmm+0x37c>
        else {
            res = -1;
            __asm__ volatile("mv a0,%0" : : "r"(res));
        }
    }
    else if(opCode == 0x23){
    80003ef4:	02300793          	li	a5,35
    80003ef8:	32f50663          	beq	a0,a5,80004224 <_ZN9Interrupt7callSysEmmmmm+0x3a4>
        } else {
            res = -1;
            __asm__ volatile("mv a0,%0" : : "r"(res));
        }
    }
    else if(opCode == 0x24){
    80003efc:	02400793          	li	a5,36
    80003f00:	36f50463          	beq	a0,a5,80004268 <_ZN9Interrupt7callSysEmmmmm+0x3e8>
            res = -1;
            __asm__ volatile("mv a0,%0" : : "r"(res));
        }


    } else if(opCode == 0x31){
    80003f04:	03100793          	li	a5,49
    80003f08:	38f50463          	beq	a0,a5,80004290 <_ZN9Interrupt7callSysEmmmmm+0x410>
        PCB::dispatch();
        res = 0;
        __asm__ volatile("mv a0,%0" : : "r"(res));

    }
    else if(opCode == 0x41){
    80003f0c:	04100793          	li	a5,65
    80003f10:	3af50663          	beq	a0,a5,800042bc <_ZN9Interrupt7callSysEmmmmm+0x43c>
        uint64 chr;
        char c = Cons::inputBuffer->get();
        chr = (uint64)c;
        __asm__ volatile("mv a0,%0" : : "r"(chr));
    }
    else if(opCode == 0x42){
    80003f14:	04200793          	li	a5,66
    80003f18:	3cf50063          	beq	a0,a5,800042d8 <_ZN9Interrupt7callSysEmmmmm+0x458>
        uint64 chr = arg1;
        Cons::outputBuffer->put((char)chr);

    }
    else if(opCode == 0x50){
    80003f1c:	05000793          	li	a5,80
    80003f20:	3cf50a63          	beq	a0,a5,800042f4 <_ZN9Interrupt7callSysEmmmmm+0x474>
        mc_status(SSTATUS_SPP);
    }
    else if(opCode == 0x55){
    80003f24:	05500793          	li	a5,85
    80003f28:	3cf50c63          	beq	a0,a5,80004300 <_ZN9Interrupt7callSysEmmmmm+0x480>
        uint64 handle = arg1;
        ((PCB *) (*(thread_t *) handle)->PCB)->isPeriodic = true;

    }
    else if(opCode == 0x56){
    80003f2c:	05600793          	li	a5,86
    80003f30:	04f51a63          	bne	a0,a5,80003f84 <_ZN9Interrupt7callSysEmmmmm+0x104>
        if(PCB::isPeriodicBlocked) {
    80003f34:	00006797          	auipc	a5,0x6
    80003f38:	1a47b783          	ld	a5,420(a5) # 8000a0d8 <_GLOBAL_OFFSET_TABLE_+0x50>
    80003f3c:	0007c783          	lbu	a5,0(a5)
    80003f40:	3c079a63          	bnez	a5,80004314 <_ZN9Interrupt7callSysEmmmmm+0x494>
            while (periodicThread != nullptr) {
                Scheduler::put(periodicThread);
                periodicThread = PCB::perioThreads->get();
            }
        }
        else PCB::isPeriodicBlocked = true;
    80003f44:	00006797          	auipc	a5,0x6
    80003f48:	1947b783          	ld	a5,404(a5) # 8000a0d8 <_GLOBAL_OFFSET_TABLE_+0x50>
    80003f4c:	00100713          	li	a4,1
    80003f50:	00e78023          	sb	a4,0(a5)
        PCB::dispatch();
    80003f54:	ffffe097          	auipc	ra,0xffffe
    80003f58:	a9c080e7          	jalr	-1380(ra) # 800019f0 <_ZN3PCB8dispatchEv>
    }
    //switchToUserStack();
}
    80003f5c:	0280006f          	j	80003f84 <_ZN9Interrupt7callSysEmmmmm+0x104>
        void* retAdr = MemoryAllocator::mem_alloc((size_t) size);
    80003f60:	00659513          	slli	a0,a1,0x6
    80003f64:	00000097          	auipc	ra,0x0
    80003f68:	b74080e7          	jalr	-1164(ra) # 80003ad8 <_ZN15MemoryAllocator9mem_allocEm>
        size/=MEM_BLOCK_SIZE;
    80003f6c:	fff00593          	li	a1,-1
    80003f70:	0065d593          	srli	a1,a1,0x6
    80003f74:	00b4f5b3          	and	a1,s1,a1
        *header = size;
    80003f78:	00b53023          	sd	a1,0(a0)
        header++;
    80003f7c:	00850513          	addi	a0,a0,8
        __asm__ volatile("mv a0,%0" : : "r"((uint64)header));
    80003f80:	00050513          	mv	a0,a0
}
    80003f84:	0a813083          	ld	ra,168(sp)
    80003f88:	0a013403          	ld	s0,160(sp)
    80003f8c:	09813483          	ld	s1,152(sp)
    80003f90:	09013903          	ld	s2,144(sp)
    80003f94:	08813983          	ld	s3,136(sp)
    80003f98:	08013a03          	ld	s4,128(sp)
    80003f9c:	07813a83          	ld	s5,120(sp)
    80003fa0:	0b010113          	addi	sp,sp,176
    80003fa4:	00008067          	ret
        int res = MemoryAllocator::mem_free((void*) adr);
    80003fa8:	00058513          	mv	a0,a1
    80003fac:	00000097          	auipc	ra,0x0
    80003fb0:	b54080e7          	jalr	-1196(ra) # 80003b00 <_ZN15MemoryAllocator8mem_freeEPv>
        __asm__ volatile("mv a0,%0" : : "r"((uint64)res));
    80003fb4:	00050513          	mv	a0,a0
    80003fb8:	fcdff06f          	j	80003f84 <_ZN9Interrupt7callSysEmmmmm+0x104>
        (*(thread_t*)handle)->PCB = PCB::allocatePCB();
    80003fbc:	0005ba83          	ld	s5,0(a1)
    80003fc0:	ffffe097          	auipc	ra,0xffffe
    80003fc4:	840080e7          	jalr	-1984(ra) # 80001800 <_ZN3PCB11allocatePCBEv>
    80003fc8:	00aab023          	sd	a0,0(s5)
        if((*(thread_t*)handle)->PCB == 0){
    80003fcc:	0004b783          	ld	a5,0(s1)
    80003fd0:	0007b783          	ld	a5,0(a5)
    80003fd4:	08078663          	beqz	a5,80004060 <_ZN9Interrupt7callSysEmmmmm+0x1e0>
            *(PCB *) (*(thread_t *) handle)->PCB = PCB((PCB::Body) body, (void *) args, (uint64 *) stac,
    80003fd8:	00200713          	li	a4,2
    80003fdc:	000a0693          	mv	a3,s4
    80003fe0:	00098613          	mv	a2,s3
    80003fe4:	00090593          	mv	a1,s2
    80003fe8:	f5840513          	addi	a0,s0,-168
    80003fec:	ffffd097          	auipc	ra,0xffffd
    80003ff0:	6f8080e7          	jalr	1784(ra) # 800016e4 <_ZN3PCBC1EPFvPvES0_Pmm>
    80003ff4:	0004b783          	ld	a5,0(s1)
    80003ff8:	0007b783          	ld	a5,0(a5)
    80003ffc:	f6043e83          	ld	t4,-160(s0)
    80004000:	f6843e03          	ld	t3,-152(s0)
    80004004:	f7043303          	ld	t1,-144(s0)
    80004008:	f7843883          	ld	a7,-136(s0)
    8000400c:	f8043803          	ld	a6,-128(s0)
    80004010:	f8843503          	ld	a0,-120(s0)
    80004014:	f9043583          	ld	a1,-112(s0)
    80004018:	f9843603          	ld	a2,-104(s0)
    8000401c:	fa043683          	ld	a3,-96(s0)
    80004020:	fa843703          	ld	a4,-88(s0)
    80004024:	f5843f03          	ld	t5,-168(s0)
    80004028:	01e7b023          	sd	t5,0(a5)
    8000402c:	01d7b423          	sd	t4,8(a5)
    80004030:	01c7b823          	sd	t3,16(a5)
    80004034:	0067bc23          	sd	t1,24(a5)
    80004038:	0317b023          	sd	a7,32(a5)
    8000403c:	0307b423          	sd	a6,40(a5)
    80004040:	02a7b823          	sd	a0,48(a5)
    80004044:	02b7bc23          	sd	a1,56(a5)
    80004048:	04c7b023          	sd	a2,64(a5)
    8000404c:	04d7b423          	sd	a3,72(a5)
    80004050:	04e7b823          	sd	a4,80(a5)
            __asm__ volatile("mv a0,%0" : : "r"(res));
    80004054:	00000793          	li	a5,0
    80004058:	00078513          	mv	a0,a5
    8000405c:	f29ff06f          	j	80003f84 <_ZN9Interrupt7callSysEmmmmm+0x104>
            __asm__ volatile("mv a0,%0" : : "r"(res));
    80004060:	fff00793          	li	a5,-1
    80004064:	00078513          	mv	a0,a5
    80004068:	f1dff06f          	j	80003f84 <_ZN9Interrupt7callSysEmmmmm+0x104>
        (*(thread_t *) handle)->PCB = PCB::allocatePCB();
    8000406c:	0005ba83          	ld	s5,0(a1)
    80004070:	ffffd097          	auipc	ra,0xffffd
    80004074:	790080e7          	jalr	1936(ra) # 80001800 <_ZN3PCB11allocatePCBEv>
    80004078:	00aab023          	sd	a0,0(s5)
        if ((*(thread_t *) handle)->PCB == 0) {
    8000407c:	0004b783          	ld	a5,0(s1)
    80004080:	0007b783          	ld	a5,0(a5)
    80004084:	0a078663          	beqz	a5,80004130 <_ZN9Interrupt7callSysEmmmmm+0x2b0>
            *(PCB *) (*(thread_t *) handle)->PCB = PCB((PCB::Body) body, (void *) args, (uint64 *) stac,
    80004088:	00200713          	li	a4,2
    8000408c:	000a0693          	mv	a3,s4
    80004090:	00098613          	mv	a2,s3
    80004094:	00090593          	mv	a1,s2
    80004098:	f5840513          	addi	a0,s0,-168
    8000409c:	ffffd097          	auipc	ra,0xffffd
    800040a0:	648080e7          	jalr	1608(ra) # 800016e4 <_ZN3PCBC1EPFvPvES0_Pmm>
    800040a4:	0004b783          	ld	a5,0(s1)
    800040a8:	0007b783          	ld	a5,0(a5)
    800040ac:	f6043e83          	ld	t4,-160(s0)
    800040b0:	f6843e03          	ld	t3,-152(s0)
    800040b4:	f7043303          	ld	t1,-144(s0)
    800040b8:	f7843883          	ld	a7,-136(s0)
    800040bc:	f8043803          	ld	a6,-128(s0)
    800040c0:	f8843503          	ld	a0,-120(s0)
    800040c4:	f9043583          	ld	a1,-112(s0)
    800040c8:	f9843603          	ld	a2,-104(s0)
    800040cc:	fa043683          	ld	a3,-96(s0)
    800040d0:	fa843703          	ld	a4,-88(s0)
    800040d4:	f5843f03          	ld	t5,-168(s0)
    800040d8:	01e7b023          	sd	t5,0(a5)
    800040dc:	01d7b423          	sd	t4,8(a5)
    800040e0:	01c7b823          	sd	t3,16(a5)
    800040e4:	0067bc23          	sd	t1,24(a5)
    800040e8:	0317b023          	sd	a7,32(a5)
    800040ec:	0307b423          	sd	a6,40(a5)
    800040f0:	02a7b823          	sd	a0,48(a5)
    800040f4:	02b7bc23          	sd	a1,56(a5)
    800040f8:	04c7b023          	sd	a2,64(a5)
    800040fc:	04d7b423          	sd	a3,72(a5)
    80004100:	04e7b823          	sd	a4,80(a5)
            if (PCB::running == nullptr) {
    80004104:	00006797          	auipc	a5,0x6
    80004108:	fe47b783          	ld	a5,-28(a5) # 8000a0e8 <_GLOBAL_OFFSET_TABLE_+0x60>
    8000410c:	0007b783          	ld	a5,0(a5)
    80004110:	02078663          	beqz	a5,8000413c <_ZN9Interrupt7callSysEmmmmm+0x2bc>
                Scheduler::put((PCB *) (*(thread_t *) handle)->PCB);
    80004114:	0004b783          	ld	a5,0(s1)
    80004118:	0007b503          	ld	a0,0(a5)
    8000411c:	ffffe097          	auipc	ra,0xffffe
    80004120:	fe0080e7          	jalr	-32(ra) # 800020fc <_ZN9Scheduler3putEP3PCB>
            __asm__ volatile("mv a0,%0" : : "r"(res));
    80004124:	00000793          	li	a5,0
    80004128:	00078513          	mv	a0,a5
    8000412c:	e59ff06f          	j	80003f84 <_ZN9Interrupt7callSysEmmmmm+0x104>
            __asm__ volatile("mv a0,%0" : : "r"(res));
    80004130:	fff00793          	li	a5,-1
    80004134:	00078513          	mv	a0,a5
    80004138:	e4dff06f          	j	80003f84 <_ZN9Interrupt7callSysEmmmmm+0x104>
                PCB::running = (PCB *) (*(thread_t *) handle)->PCB;
    8000413c:	0004b783          	ld	a5,0(s1)
    80004140:	0007b703          	ld	a4,0(a5)
    80004144:	00006797          	auipc	a5,0x6
    80004148:	fa47b783          	ld	a5,-92(a5) # 8000a0e8 <_GLOBAL_OFFSET_TABLE_+0x60>
    8000414c:	00e7b023          	sd	a4,0(a5)
    80004150:	fd5ff06f          	j	80004124 <_ZN9Interrupt7callSysEmmmmm+0x2a4>
        if(PCB::running!= nullptr) {
    80004154:	00006797          	auipc	a5,0x6
    80004158:	f947b783          	ld	a5,-108(a5) # 8000a0e8 <_GLOBAL_OFFSET_TABLE_+0x60>
    8000415c:	0007b503          	ld	a0,0(a5)
    80004160:	00050e63          	beqz	a0,8000417c <_ZN9Interrupt7callSysEmmmmm+0x2fc>
            PCB::running->setFinished(true);
    80004164:	00100593          	li	a1,1
    80004168:	ffffd097          	auipc	ra,0xffffd
    8000416c:	5d4080e7          	jalr	1492(ra) # 8000173c <_ZN3PCB11setFinishedEb>
            __asm__ volatile("mv a0,%0" : : "r"(res));
    80004170:	00000793          	li	a5,0
    80004174:	00078513          	mv	a0,a5
    80004178:	e0dff06f          	j	80003f84 <_ZN9Interrupt7callSysEmmmmm+0x104>
            __asm__ volatile("mv a0,%0" : : "r"(res));
    8000417c:	fff00793          	li	a5,-1
    80004180:	00078513          	mv	a0,a5
    80004184:	e01ff06f          	j	80003f84 <_ZN9Interrupt7callSysEmmmmm+0x104>
        PCB::timeLeft = 0;
    80004188:	00006797          	auipc	a5,0x6
    8000418c:	f387b783          	ld	a5,-200(a5) # 8000a0c0 <_GLOBAL_OFFSET_TABLE_+0x38>
    80004190:	0007b023          	sd	zero,0(a5)
        PCB::dispatch();
    80004194:	ffffe097          	auipc	ra,0xffffe
    80004198:	85c080e7          	jalr	-1956(ra) # 800019f0 <_ZN3PCB8dispatchEv>
    8000419c:	de9ff06f          	j	80003f84 <_ZN9Interrupt7callSysEmmmmm+0x104>
        (*(sem_t *)handle)->Sem = Sem::allocateSem();
    800041a0:	0005b983          	ld	s3,0(a1)
    800041a4:	ffffe097          	auipc	ra,0xffffe
    800041a8:	eb4080e7          	jalr	-332(ra) # 80002058 <_ZN3Sem11allocateSemEv>
    800041ac:	00a9b023          	sd	a0,0(s3)
        if((*(sem_t *)handle)->Sem == 0){
    800041b0:	0004b783          	ld	a5,0(s1)
    800041b4:	0007b783          	ld	a5,0(a5)
    800041b8:	02078c63          	beqz	a5,800041f0 <_ZN9Interrupt7callSysEmmmmm+0x370>
            *(Sem *) (*(sem_t *) handle)->Sem = Sem((int) init);
    800041bc:	0009059b          	sext.w	a1,s2
    800041c0:	fb040513          	addi	a0,s0,-80
    800041c4:	ffffe097          	auipc	ra,0xffffe
    800041c8:	cf8080e7          	jalr	-776(ra) # 80001ebc <_ZN3SemC1Ei>
    800041cc:	0004b783          	ld	a5,0(s1)
    800041d0:	0007b783          	ld	a5,0(a5)
    800041d4:	fb043703          	ld	a4,-80(s0)
    800041d8:	00e7b023          	sd	a4,0(a5)
    800041dc:	fb843703          	ld	a4,-72(s0)
    800041e0:	00e7b423          	sd	a4,8(a5)
            __asm__ volatile("mv a0,%0" : : "r"(res));
    800041e4:	00000793          	li	a5,0
    800041e8:	00078513          	mv	a0,a5
    800041ec:	d99ff06f          	j	80003f84 <_ZN9Interrupt7callSysEmmmmm+0x104>
            __asm__ volatile("mv a0,%0" : : "r"(res));
    800041f0:	fff00793          	li	a5,-1
    800041f4:	00078513          	mv	a0,a5
    800041f8:	d8dff06f          	j	80003f84 <_ZN9Interrupt7callSysEmmmmm+0x104>
        if((Sem*)((sem_t)handle)->Sem!= nullptr) {
    800041fc:	0005b503          	ld	a0,0(a1)
    80004200:	00050c63          	beqz	a0,80004218 <_ZN9Interrupt7callSysEmmmmm+0x398>
            ((Sem *) ((sem_t ) handle)->Sem)->deblockAll();
    80004204:	ffffe097          	auipc	ra,0xffffe
    80004208:	e8c080e7          	jalr	-372(ra) # 80002090 <_ZN3Sem10deblockAllEv>
            __asm__ volatile("mv a0,%0" : : "r"(res));
    8000420c:	00000793          	li	a5,0
    80004210:	00078513          	mv	a0,a5
    80004214:	d71ff06f          	j	80003f84 <_ZN9Interrupt7callSysEmmmmm+0x104>
            __asm__ volatile("mv a0,%0" : : "r"(res));
    80004218:	fff00793          	li	a5,-1
    8000421c:	00078513          	mv	a0,a5
    80004220:	d65ff06f          	j	80003f84 <_ZN9Interrupt7callSysEmmmmm+0x104>
        if((Sem*)((sem_t)handle)->Sem!= nullptr) {
    80004224:	0005b503          	ld	a0,0(a1)
    80004228:	02050a63          	beqz	a0,8000425c <_ZN9Interrupt7callSysEmmmmm+0x3dc>
            ((Sem *) ((sem_t ) handle)->Sem)->wait();
    8000422c:	ffffe097          	auipc	ra,0xffffe
    80004230:	d54080e7          	jalr	-684(ra) # 80001f80 <_ZN3Sem4waitEv>
            if(!PCB::running->unblockError) {
    80004234:	00006797          	auipc	a5,0x6
    80004238:	eb47b783          	ld	a5,-332(a5) # 8000a0e8 <_GLOBAL_OFFSET_TABLE_+0x60>
    8000423c:	0007b783          	ld	a5,0(a5)
    80004240:	0007c783          	lbu	a5,0(a5)
    80004244:	00079663          	bnez	a5,80004250 <_ZN9Interrupt7callSysEmmmmm+0x3d0>
                __asm__ volatile("mv a0,%0" : : "r"(res));
    80004248:	00078513          	mv	a0,a5
    8000424c:	d39ff06f          	j	80003f84 <_ZN9Interrupt7callSysEmmmmm+0x104>
                __asm__ volatile("mv a0,%0" : : "r"(res));
    80004250:	ffe00793          	li	a5,-2
    80004254:	00078513          	mv	a0,a5
    80004258:	d2dff06f          	j	80003f84 <_ZN9Interrupt7callSysEmmmmm+0x104>
            __asm__ volatile("mv a0,%0" : : "r"(res));
    8000425c:	fff00793          	li	a5,-1
    80004260:	00078513          	mv	a0,a5
    80004264:	d21ff06f          	j	80003f84 <_ZN9Interrupt7callSysEmmmmm+0x104>
        if((Sem*)((sem_t)handle)->Sem!= nullptr) {
    80004268:	0005b503          	ld	a0,0(a1)
    8000426c:	00050c63          	beqz	a0,80004284 <_ZN9Interrupt7callSysEmmmmm+0x404>
            ((Sem *) ((sem_t ) handle)->Sem)->signal();
    80004270:	ffffe097          	auipc	ra,0xffffe
    80004274:	da8080e7          	jalr	-600(ra) # 80002018 <_ZN3Sem6signalEv>
            __asm__ volatile("mv a0,%0" : : "r"(res));
    80004278:	00000793          	li	a5,0
    8000427c:	00078513          	mv	a0,a5
    80004280:	d05ff06f          	j	80003f84 <_ZN9Interrupt7callSysEmmmmm+0x104>
            __asm__ volatile("mv a0,%0" : : "r"(res));
    80004284:	fff00793          	li	a5,-1
    80004288:	00078513          	mv	a0,a5
    8000428c:	cf9ff06f          	j	80003f84 <_ZN9Interrupt7callSysEmmmmm+0x104>
        PCB::sleep((time_t) time);
    80004290:	00058513          	mv	a0,a1
    80004294:	ffffd097          	auipc	ra,0xffffd
    80004298:	6ec080e7          	jalr	1772(ra) # 80001980 <_ZN3PCB5sleepEm>
        PCB::timeLeft = 0;
    8000429c:	00006797          	auipc	a5,0x6
    800042a0:	e247b783          	ld	a5,-476(a5) # 8000a0c0 <_GLOBAL_OFFSET_TABLE_+0x38>
    800042a4:	0007b023          	sd	zero,0(a5)
        PCB::dispatch();
    800042a8:	ffffd097          	auipc	ra,0xffffd
    800042ac:	748080e7          	jalr	1864(ra) # 800019f0 <_ZN3PCB8dispatchEv>
        __asm__ volatile("mv a0,%0" : : "r"(res));
    800042b0:	00000793          	li	a5,0
    800042b4:	00078513          	mv	a0,a5
    800042b8:	ccdff06f          	j	80003f84 <_ZN9Interrupt7callSysEmmmmm+0x104>
        char c = Cons::inputBuffer->get();
    800042bc:	00006797          	auipc	a5,0x6
    800042c0:	e147b783          	ld	a5,-492(a5) # 8000a0d0 <_GLOBAL_OFFSET_TABLE_+0x48>
    800042c4:	0007b503          	ld	a0,0(a5)
    800042c8:	00000097          	auipc	ra,0x0
    800042cc:	860080e7          	jalr	-1952(ra) # 80003b28 <_ZN10CharBuffer3getEv>
        __asm__ volatile("mv a0,%0" : : "r"(chr));
    800042d0:	00050513          	mv	a0,a0
    800042d4:	cb1ff06f          	j	80003f84 <_ZN9Interrupt7callSysEmmmmm+0x104>
        Cons::outputBuffer->put((char)chr);
    800042d8:	0ff5f593          	andi	a1,a1,255
    800042dc:	00006797          	auipc	a5,0x6
    800042e0:	e1c7b783          	ld	a5,-484(a5) # 8000a0f8 <_GLOBAL_OFFSET_TABLE_+0x70>
    800042e4:	0007b503          	ld	a0,0(a5)
    800042e8:	00000097          	auipc	ra,0x0
    800042ec:	8d4080e7          	jalr	-1836(ra) # 80003bbc <_ZN10CharBuffer3putEc>
    800042f0:	c95ff06f          	j	80003f84 <_ZN9Interrupt7callSysEmmmmm+0x104>

inline void Interrupt::ms_status(uint64 mask) {
    __asm__ volatile("csrs sstatus, %[mask]" : : [mask]"r"(mask));
}
inline void Interrupt::mc_status(uint64 mask) {
    __asm__ volatile("csrc sstatus, %[mask]" : : [mask]"r"(mask));
    800042f4:	10000793          	li	a5,256
    800042f8:	1007b073          	csrc	sstatus,a5
}
    800042fc:	c89ff06f          	j	80003f84 <_ZN9Interrupt7callSysEmmmmm+0x104>
        ((PCB *) (*(thread_t *) handle)->PCB)->isPeriodic = true;
    80004300:	0005b783          	ld	a5,0(a1)
    80004304:	0007b783          	ld	a5,0(a5)
    80004308:	00100713          	li	a4,1
    8000430c:	00e780a3          	sb	a4,1(a5)
    80004310:	c75ff06f          	j	80003f84 <_ZN9Interrupt7callSysEmmmmm+0x104>
            PCB::isPeriodicBlocked = false;
    80004314:	00006797          	auipc	a5,0x6
    80004318:	dc47b783          	ld	a5,-572(a5) # 8000a0d8 <_GLOBAL_OFFSET_TABLE_+0x50>
    8000431c:	00078023          	sb	zero,0(a5)
            PCB* periodicThread = PCB::perioThreads->get();
    80004320:	00006797          	auipc	a5,0x6
    80004324:	d907b783          	ld	a5,-624(a5) # 8000a0b0 <_GLOBAL_OFFSET_TABLE_+0x28>
    80004328:	0007b503          	ld	a0,0(a5)
    8000432c:	ffffe097          	auipc	ra,0xffffe
    80004330:	90c080e7          	jalr	-1780(ra) # 80001c38 <_ZN8PCB_List3getEv>
            while (periodicThread != nullptr) {
    80004334:	c20500e3          	beqz	a0,80003f54 <_ZN9Interrupt7callSysEmmmmm+0xd4>
                Scheduler::put(periodicThread);
    80004338:	ffffe097          	auipc	ra,0xffffe
    8000433c:	dc4080e7          	jalr	-572(ra) # 800020fc <_ZN9Scheduler3putEP3PCB>
                periodicThread = PCB::perioThreads->get();
    80004340:	00006797          	auipc	a5,0x6
    80004344:	d707b783          	ld	a5,-656(a5) # 8000a0b0 <_GLOBAL_OFFSET_TABLE_+0x28>
    80004348:	0007b503          	ld	a0,0(a5)
    8000434c:	ffffe097          	auipc	ra,0xffffe
    80004350:	8ec080e7          	jalr	-1812(ra) # 80001c38 <_ZN8PCB_List3getEv>
            while (periodicThread != nullptr) {
    80004354:	fe1ff06f          	j	80004334 <_ZN9Interrupt7callSysEmmmmm+0x4b4>

0000000080004358 <_ZN9Interrupt8r_statusEv>:

uint64 Interrupt::r_status() {
    80004358:	ff010113          	addi	sp,sp,-16
    8000435c:	00813423          	sd	s0,8(sp)
    80004360:	01010413          	addi	s0,sp,16
    uint64 sstatus = r_statusi();
    return sstatus;
}
inline uint64 Interrupt::r_statusi(){
    uint64 sstatus;
    __asm__ volatile ("csrr %[sstatus],sstatus":  [sstatus]"=r"(sstatus));
    80004364:	10002573          	csrr	a0,sstatus
}
    80004368:	00813403          	ld	s0,8(sp)
    8000436c:	01010113          	addi	sp,sp,16
    80004370:	00008067          	ret

0000000080004374 <_ZN9Interrupt8w_statusEm>:
    return sstatus;
}

 void Interrupt::w_status(uint64 sstatus){
    80004374:	ff010113          	addi	sp,sp,-16
    80004378:	00813423          	sd	s0,8(sp)
    8000437c:	01010413          	addi	s0,sp,16
     w_statusi(sstatus);

}
inline void Interrupt::w_statusi(uint64 sstatus){

    __asm__ volatile ("csrw sstatus,%[sstatus]": : [sstatus]"r"(sstatus));
    80004380:	10051073          	csrw	sstatus,a0
}
    80004384:	00813403          	ld	s0,8(sp)
    80004388:	01010113          	addi	sp,sp,16
    8000438c:	00008067          	ret

0000000080004390 <_ZN9Interrupt7r_stvecEv>:

}
uint64 Interrupt::r_stvec(){
    80004390:	ff010113          	addi	sp,sp,-16
    80004394:	00813423          	sd	s0,8(sp)
    80004398:	01010413          	addi	s0,sp,16
    uint64 stvec = r_stveci();
    return stvec;
}
inline uint64 Interrupt::r_stveci(){
    uint64 stvec;
    __asm__ volatile ("csrr %[stvec],stvec":  [stvec]"=r"(stvec));
    8000439c:	10502573          	csrr	a0,stvec
}
    800043a0:	00813403          	ld	s0,8(sp)
    800043a4:	01010113          	addi	sp,sp,16
    800043a8:	00008067          	ret

00000000800043ac <_ZN9Interrupt7w_stvecEm>:
    return stvec;
}

void Interrupt::w_stvec(uint64 stvec) {
    800043ac:	ff010113          	addi	sp,sp,-16
    800043b0:	00813423          	sd	s0,8(sp)
    800043b4:	01010413          	addi	s0,sp,16
    w_stveci(stvec);
}
inline void Interrupt::w_stveci(uint64 stvec) {
    __asm__ volatile ("csrw stvec,%[stvec]": : [stvec]"r"(stvec));
    800043b8:	10551073          	csrw	stvec,a0
}
    800043bc:	00813403          	ld	s0,8(sp)
    800043c0:	01010113          	addi	sp,sp,16
    800043c4:	00008067          	ret

00000000800043c8 <_ZN9Interrupt8r_scauseEv>:

}

 uint64 Interrupt::r_scause() {
    800043c8:	ff010113          	addi	sp,sp,-16
    800043cc:	00813423          	sd	s0,8(sp)
    800043d0:	01010413          	addi	s0,sp,16
    return scause;
}

inline uint64 Interrupt::r_scausei() {
    uint64 scause;
    __asm__ volatile ("csrr %[scause],scause":  [scause]"=r"(scause));
    800043d4:	14202573          	csrr	a0,scause
}
    800043d8:	00813403          	ld	s0,8(sp)
    800043dc:	01010113          	addi	sp,sp,16
    800043e0:	00008067          	ret

00000000800043e4 <_ZN9Interrupt8w_scauseEm>:
    return scause;
}

 void Interrupt::w_scause(uint64 scause) {
    800043e4:	ff010113          	addi	sp,sp,-16
    800043e8:	00813423          	sd	s0,8(sp)
    800043ec:	01010413          	addi	s0,sp,16
     w_scausei(scause);
}
inline void Interrupt::w_scausei(uint64 scause) {
    __asm__ volatile ("csrw scause,%[scause]": : [scause]"r"(scause));
    800043f0:	14251073          	csrw	scause,a0
}
    800043f4:	00813403          	ld	s0,8(sp)
    800043f8:	01010113          	addi	sp,sp,16
    800043fc:	00008067          	ret

0000000080004400 <_ZN9Interrupt6w_sepcEm>:

}

void Interrupt::w_sepc(uint64 sepc) {
    80004400:	ff010113          	addi	sp,sp,-16
    80004404:	00813423          	sd	s0,8(sp)
    80004408:	01010413          	addi	s0,sp,16
    w_sepci(sepc);
}

inline void Interrupt::w_sepci(uint64 sepc) {
    __asm__ volatile ("csrw sepc,%[sepc]": : [sepc]"r"(sepc));
    8000440c:	14151073          	csrw	sepc,a0
}
    80004410:	00813403          	ld	s0,8(sp)
    80004414:	01010113          	addi	sp,sp,16
    80004418:	00008067          	ret

000000008000441c <_ZN9Interrupt6r_sepcEv>:

}

 uint64 Interrupt::r_sepc() {
    8000441c:	ff010113          	addi	sp,sp,-16
    80004420:	00813423          	sd	s0,8(sp)
    80004424:	01010413          	addi	s0,sp,16
    return sepc;
}

inline uint64 Interrupt::r_sepci() {
    uint64 sepc;
    __asm__ volatile ("csrr %[sepc],sepc":  [sepc]"=r"(sepc));
    80004428:	14102573          	csrr	a0,sepc
}
    8000442c:	00813403          	ld	s0,8(sp)
    80004430:	01010113          	addi	sp,sp,16
    80004434:	00008067          	ret

0000000080004438 <_ZN9Interrupt13handleSysCallEv>:
void Interrupt::handleSysCall() {
    80004438:	fd010113          	addi	sp,sp,-48
    8000443c:	02113423          	sd	ra,40(sp)
    80004440:	02813023          	sd	s0,32(sp)
    80004444:	00913c23          	sd	s1,24(sp)
    80004448:	01213823          	sd	s2,16(sp)
    8000444c:	03010413          	addi	s0,sp,48
    __asm__ volatile ("csrr %[scause],scause":  [scause]"=r"(scause));
    80004450:	14202773          	csrr	a4,scause
    if(scause == 0x0000000000000009UL || scause == 0x0000000000000008UL) {
    80004454:	ff870693          	addi	a3,a4,-8
    80004458:	00100793          	li	a5,1
    8000445c:	02d7fe63          	bgeu	a5,a3,80004498 <_ZN9Interrupt13handleSysCallEv+0x60>
    else if(scause == 0x8000000000000001UL){
    80004460:	fff00793          	li	a5,-1
    80004464:	03f79793          	slli	a5,a5,0x3f
    80004468:	00178793          	addi	a5,a5,1
    8000446c:	06f70063          	beq	a4,a5,800044cc <_ZN9Interrupt13handleSysCallEv+0x94>
    else if(scause == 0x8000000000000009UL){
    80004470:	fff00793          	li	a5,-1
    80004474:	03f79793          	slli	a5,a5,0x3f
    80004478:	00978793          	addi	a5,a5,9
    8000447c:	16f70c63          	beq	a4,a5,800045f4 <_ZN9Interrupt13handleSysCallEv+0x1bc>
}
    80004480:	02813083          	ld	ra,40(sp)
    80004484:	02013403          	ld	s0,32(sp)
    80004488:	01813483          	ld	s1,24(sp)
    8000448c:	01013903          	ld	s2,16(sp)
    80004490:	03010113          	addi	sp,sp,48
    80004494:	00008067          	ret
    __asm__ volatile ("csrr %[sepc],sepc":  [sepc]"=r"(sepc));
    80004498:	141024f3          	csrr	s1,sepc
        uint64 sepc = r_sepci() + 4;
    8000449c:	00448493          	addi	s1,s1,4
    __asm__ volatile ("csrr %[scause],scause":  [scause]"=r"(scause));
    800044a0:	14202973          	csrr	s2,scause
        __asm__ volatile("ld %0,80(s0)" : "=r"(opCode));
    800044a4:	05043503          	ld	a0,80(s0)
        __asm__ volatile("ld %0,88(s0)" : "=r"(arg1));
    800044a8:	05843583          	ld	a1,88(s0)
        __asm__ volatile("ld %0,96(s0)" : "=r"(arg2));
    800044ac:	06043603          	ld	a2,96(s0)
        __asm__ volatile("ld %0,104(s0)" : "=r"(arg3));
    800044b0:	06843683          	ld	a3,104(s0)
        __asm__ volatile("ld %0,112(s0)" : "=r"(arg4));
    800044b4:	07043703          	ld	a4,112(s0)
        callSys(opCode,arg1,arg2,arg3,arg4);
    800044b8:	00000097          	auipc	ra,0x0
    800044bc:	9c8080e7          	jalr	-1592(ra) # 80003e80 <_ZN9Interrupt7callSysEmmmmm>
    __asm__ volatile ("csrw scause,%[scause]": : [scause]"r"(scause));
    800044c0:	14291073          	csrw	scause,s2
    __asm__ volatile ("csrw sepc,%[sepc]": : [sepc]"r"(sepc));
    800044c4:	14149073          	csrw	sepc,s1
}
    800044c8:	fb9ff06f          	j	80004480 <_ZN9Interrupt13handleSysCallEv+0x48>
    }
}

inline uint64 Interrupt::r_siei() {
    uint64 sie;
    __asm__ volatile ("csrr %[sie],sie":  [sie]"=r"(sie));
    800044cc:	104027f3          	csrr	a5,sie
        if((sie & 2) == 0){
    800044d0:	0027f793          	andi	a5,a5,2
    800044d4:	00079863          	bnez	a5,800044e4 <_ZN9Interrupt13handleSysCallEv+0xac>
    __asm__ volatile("csrc sip, %[mask]" : : [mask]"r"(mask));
    800044d8:	00200793          	li	a5,2
    800044dc:	1447b073          	csrc	sip,a5
            return;
    800044e0:	fa1ff06f          	j	80004480 <_ZN9Interrupt13handleSysCallEv+0x48>
        PCB::sleeping_list->decTime();
    800044e4:	00006797          	auipc	a5,0x6
    800044e8:	bfc7b783          	ld	a5,-1028(a5) # 8000a0e0 <_GLOBAL_OFFSET_TABLE_+0x58>
    800044ec:	0007b503          	ld	a0,0(a5)
    800044f0:	ffffe097          	auipc	ra,0xffffe
    800044f4:	944080e7          	jalr	-1724(ra) # 80001e34 <_ZN8PCB_List7decTimeEv>
    800044f8:	0200006f          	j	80004518 <_ZN9Interrupt13handleSysCallEv+0xe0>
                pcb->setSleeping(false);
    800044fc:	00000593          	li	a1,0
    80004500:	00048513          	mv	a0,s1
    80004504:	ffffd097          	auipc	ra,0xffffd
    80004508:	460080e7          	jalr	1120(ra) # 80001964 <_ZN3PCB11setSleepingEb>
                Scheduler::put(pcb);
    8000450c:	00048513          	mv	a0,s1
    80004510:	ffffe097          	auipc	ra,0xffffe
    80004514:	bec080e7          	jalr	-1044(ra) # 800020fc <_ZN9Scheduler3putEP3PCB>
        while (PCB::sleeping_list->getTimeLeft() == 0){
    80004518:	00006797          	auipc	a5,0x6
    8000451c:	bc87b783          	ld	a5,-1080(a5) # 8000a0e0 <_GLOBAL_OFFSET_TABLE_+0x58>
    80004520:	0007b503          	ld	a0,0(a5)
    80004524:	ffffe097          	auipc	ra,0xffffe
    80004528:	8e4080e7          	jalr	-1820(ra) # 80001e08 <_ZN8PCB_List11getTimeLeftEv>
    8000452c:	04051a63          	bnez	a0,80004580 <_ZN9Interrupt13handleSysCallEv+0x148>
            PCB* pcb = PCB::sleeping_list->get();
    80004530:	00006797          	auipc	a5,0x6
    80004534:	bb07b783          	ld	a5,-1104(a5) # 8000a0e0 <_GLOBAL_OFFSET_TABLE_+0x58>
    80004538:	0007b503          	ld	a0,0(a5)
    8000453c:	ffffd097          	auipc	ra,0xffffd
    80004540:	6fc080e7          	jalr	1788(ra) # 80001c38 <_ZN8PCB_List3getEv>
    80004544:	00050493          	mv	s1,a0
            if(pcb->isPeriodic && PCB::isPeriodicBlocked){
    80004548:	00154783          	lbu	a5,1(a0)
    8000454c:	fa0788e3          	beqz	a5,800044fc <_ZN9Interrupt13handleSysCallEv+0xc4>
    80004550:	00006797          	auipc	a5,0x6
    80004554:	b887b783          	ld	a5,-1144(a5) # 8000a0d8 <_GLOBAL_OFFSET_TABLE_+0x50>
    80004558:	0007c783          	lbu	a5,0(a5)
    8000455c:	fa0780e3          	beqz	a5,800044fc <_ZN9Interrupt13handleSysCallEv+0xc4>
                PCB::sleeping_list->putTime(pcb,1);
    80004560:	00100613          	li	a2,1
    80004564:	00050593          	mv	a1,a0
    80004568:	00006797          	auipc	a5,0x6
    8000456c:	b787b783          	ld	a5,-1160(a5) # 8000a0e0 <_GLOBAL_OFFSET_TABLE_+0x58>
    80004570:	0007b503          	ld	a0,0(a5)
    80004574:	ffffd097          	auipc	ra,0xffffd
    80004578:	728080e7          	jalr	1832(ra) # 80001c9c <_ZN8PCB_List7putTimeEP3PCBm>
    8000457c:	f9dff06f          	j	80004518 <_ZN9Interrupt13handleSysCallEv+0xe0>
        PCB::timeLeft++;
    80004580:	00006497          	auipc	s1,0x6
    80004584:	b404b483          	ld	s1,-1216(s1) # 8000a0c0 <_GLOBAL_OFFSET_TABLE_+0x38>
    80004588:	0004b783          	ld	a5,0(s1)
    8000458c:	00178793          	addi	a5,a5,1
    80004590:	00f4b023          	sd	a5,0(s1)
        if(PCB::timeLeft >= PCB::running->getTimeSlice()){
    80004594:	00006797          	auipc	a5,0x6
    80004598:	b547b783          	ld	a5,-1196(a5) # 8000a0e8 <_GLOBAL_OFFSET_TABLE_+0x60>
    8000459c:	0007b503          	ld	a0,0(a5)
    800045a0:	ffffd097          	auipc	ra,0xffffd
    800045a4:	38c080e7          	jalr	908(ra) # 8000192c <_ZNK3PCB12getTimeSliceEv>
    800045a8:	0004b783          	ld	a5,0(s1)
    800045ac:	00a7f863          	bgeu	a5,a0,800045bc <_ZN9Interrupt13handleSysCallEv+0x184>
    __asm__ volatile("csrc sip, %[mask]" : : [mask]"r"(mask));
    800045b0:	00200793          	li	a5,2
    800045b4:	1447b073          	csrc	sip,a5
}
    800045b8:	ec9ff06f          	j	80004480 <_ZN9Interrupt13handleSysCallEv+0x48>
          uint64 sepc = r_sepc();
    800045bc:	00000097          	auipc	ra,0x0
    800045c0:	e60080e7          	jalr	-416(ra) # 8000441c <_ZN9Interrupt6r_sepcEv>
    800045c4:	00050493          	mv	s1,a0
    __asm__ volatile ("csrr %[scause],scause":  [scause]"=r"(scause));
    800045c8:	14202973          	csrr	s2,scause
          PCB::timeLeft = 0;
    800045cc:	00006797          	auipc	a5,0x6
    800045d0:	af47b783          	ld	a5,-1292(a5) # 8000a0c0 <_GLOBAL_OFFSET_TABLE_+0x38>
    800045d4:	0007b023          	sd	zero,0(a5)
          PCB::dispatch();
    800045d8:	ffffd097          	auipc	ra,0xffffd
    800045dc:	418080e7          	jalr	1048(ra) # 800019f0 <_ZN3PCB8dispatchEv>
    __asm__ volatile ("csrw scause,%[scause]": : [scause]"r"(scause));
    800045e0:	14291073          	csrw	scause,s2
         w_sepc(sepc);
    800045e4:	00048513          	mv	a0,s1
    800045e8:	00000097          	auipc	ra,0x0
    800045ec:	e18080e7          	jalr	-488(ra) # 80004400 <_ZN9Interrupt6w_sepcEm>
    800045f0:	fc1ff06f          	j	800045b0 <_ZN9Interrupt13handleSysCallEv+0x178>
        int irq = plic_claim();
    800045f4:	00001097          	auipc	ra,0x1
    800045f8:	510080e7          	jalr	1296(ra) # 80005b04 <plic_claim>
    800045fc:	00050493          	mv	s1,a0
        if(irq == CONSOLE_IRQ){
    80004600:	00a00793          	li	a5,10
    80004604:	00f50a63          	beq	a0,a5,80004618 <_ZN9Interrupt13handleSysCallEv+0x1e0>
        plic_complete(irq);
    80004608:	00048513          	mv	a0,s1
    8000460c:	00001097          	auipc	ra,0x1
    80004610:	530080e7          	jalr	1328(ra) # 80005b3c <plic_complete>
    80004614:	e6dff06f          	j	80004480 <_ZN9Interrupt13handleSysCallEv+0x48>
            volatile char status = *((char *)CONSOLE_STATUS);
    80004618:	00006797          	auipc	a5,0x6
    8000461c:	a887b783          	ld	a5,-1400(a5) # 8000a0a0 <_GLOBAL_OFFSET_TABLE_+0x18>
    80004620:	0007b903          	ld	s2,0(a5)
    80004624:	00094783          	lbu	a5,0(s2)
    80004628:	fcf40fa3          	sb	a5,-33(s0)
            while (status & CONSOLE_RX_STATUS_BIT){
    8000462c:	fdf44783          	lbu	a5,-33(s0)
    80004630:	0017f793          	andi	a5,a5,1
    80004634:	fc078ae3          	beqz	a5,80004608 <_ZN9Interrupt13handleSysCallEv+0x1d0>
                char c = (*(char *) CONSOLE_RX_DATA);
    80004638:	00006797          	auipc	a5,0x6
    8000463c:	a587b783          	ld	a5,-1448(a5) # 8000a090 <_GLOBAL_OFFSET_TABLE_+0x8>
    80004640:	0007b783          	ld	a5,0(a5)
                Cons::inputBuffer->put(c);
    80004644:	0007c583          	lbu	a1,0(a5)
    80004648:	00006797          	auipc	a5,0x6
    8000464c:	a887b783          	ld	a5,-1400(a5) # 8000a0d0 <_GLOBAL_OFFSET_TABLE_+0x48>
    80004650:	0007b503          	ld	a0,0(a5)
    80004654:	fffff097          	auipc	ra,0xfffff
    80004658:	568080e7          	jalr	1384(ra) # 80003bbc <_ZN10CharBuffer3putEc>
                status = *((char *)CONSOLE_STATUS);
    8000465c:	00094783          	lbu	a5,0(s2)
    80004660:	fcf40fa3          	sb	a5,-33(s0)
            while (status & CONSOLE_RX_STATUS_BIT){
    80004664:	fc9ff06f          	j	8000462c <_ZN9Interrupt13handleSysCallEv+0x1f4>

0000000080004668 <_ZN9Interrupt9us_statusEm>:
void Interrupt::us_status(uint64 mask) {
    80004668:	ff010113          	addi	sp,sp,-16
    8000466c:	00813423          	sd	s0,8(sp)
    80004670:	01010413          	addi	s0,sp,16
    __asm__ volatile ("csrr %[sstatus],sstatus":  [sstatus]"=r"(sstatus));
    80004674:	100027f3          	csrr	a5,sstatus
    stat= ~stat;
    80004678:	fff7c793          	not	a5,a5
    stat|=mask;
    8000467c:	00a7e533          	or	a0,a5,a0
    __asm__ volatile ("csrw sstatus,%[sstatus]": : [sstatus]"r"(sstatus));
    80004680:	10051073          	csrw	sstatus,a0
}
    80004684:	00813403          	ld	s0,8(sp)
    80004688:	01010113          	addi	sp,sp,16
    8000468c:	00008067          	ret

0000000080004690 <_ZN9Interrupt10popSppSpieEv>:
void Interrupt::popSppSpie() {
    80004690:	ff010113          	addi	sp,sp,-16
    80004694:	00813423          	sd	s0,8(sp)
    80004698:	01010413          	addi	s0,sp,16
    __asm__ volatile("csrw sepc,ra");
    8000469c:	14109073          	csrw	sepc,ra
    __asm__ volatile("sret");
    800046a0:	10200073          	sret
}
    800046a4:	00813403          	ld	s0,8(sp)
    800046a8:	01010113          	addi	sp,sp,16
    800046ac:	00008067          	ret

00000000800046b0 <_ZN9Interrupt4lockEv>:
    if(lock_var++ == 0){
    800046b0:	00006717          	auipc	a4,0x6
    800046b4:	9b070713          	addi	a4,a4,-1616 # 8000a060 <_ZN9Interrupt8lock_varE>
    800046b8:	00072783          	lw	a5,0(a4)
    800046bc:	0017869b          	addiw	a3,a5,1
    800046c0:	00d72023          	sw	a3,0(a4)
    800046c4:	00078463          	beqz	a5,800046cc <_ZN9Interrupt4lockEv+0x1c>
    800046c8:	00008067          	ret
void Interrupt::lock() {
    800046cc:	ff010113          	addi	sp,sp,-16
    800046d0:	00113423          	sd	ra,8(sp)
    800046d4:	00813023          	sd	s0,0(sp)
    800046d8:	01010413          	addi	s0,sp,16
        prevSstatus = r_status();
    800046dc:	00000097          	auipc	ra,0x0
    800046e0:	c7c080e7          	jalr	-900(ra) # 80004358 <_ZN9Interrupt8r_statusEv>
    800046e4:	00006797          	auipc	a5,0x6
    800046e8:	98a7b223          	sd	a0,-1660(a5) # 8000a068 <_ZN9Interrupt11prevSstatusE>
    __asm__ volatile("csrc sstatus, %[mask]" : : [mask]"r"(mask));
    800046ec:	00200793          	li	a5,2
    800046f0:	1007b073          	csrc	sstatus,a5
}
    800046f4:	00813083          	ld	ra,8(sp)
    800046f8:	00013403          	ld	s0,0(sp)
    800046fc:	01010113          	addi	sp,sp,16
    80004700:	00008067          	ret

0000000080004704 <_ZN9Interrupt6unlockEv>:
void Interrupt::unlock() {
    80004704:	ff010113          	addi	sp,sp,-16
    80004708:	00813423          	sd	s0,8(sp)
    8000470c:	01010413          	addi	s0,sp,16
    if(--lock_var == 0){
    80004710:	00006717          	auipc	a4,0x6
    80004714:	95070713          	addi	a4,a4,-1712 # 8000a060 <_ZN9Interrupt8lock_varE>
    80004718:	00072783          	lw	a5,0(a4)
    8000471c:	fff7879b          	addiw	a5,a5,-1
    80004720:	0007869b          	sext.w	a3,a5
    80004724:	00f72023          	sw	a5,0(a4)
    80004728:	00069c63          	bnez	a3,80004740 <_ZN9Interrupt6unlockEv+0x3c>
            ms_status(prevSstatus&SSTATUS_SIE?SSTATUS_SIE:0);
    8000472c:	00006797          	auipc	a5,0x6
    80004730:	93c7a783          	lw	a5,-1732(a5) # 8000a068 <_ZN9Interrupt11prevSstatusE>
    80004734:	0027f793          	andi	a5,a5,2
    80004738:	0007879b          	sext.w	a5,a5
    __asm__ volatile("csrs sstatus, %[mask]" : : [mask]"r"(mask));
    8000473c:	1007a073          	csrs	sstatus,a5
}
    80004740:	00813403          	ld	s0,8(sp)
    80004744:	01010113          	addi	sp,sp,16
    80004748:	00008067          	ret

000000008000474c <_ZN9Interrupt13disable_sintrEv>:
void Interrupt::disable_sintr() {
    8000474c:	ff010113          	addi	sp,sp,-16
    80004750:	00813423          	sd	s0,8(sp)
    80004754:	01010413          	addi	s0,sp,16
    __asm__ volatile("csrc sstatus, %[mask]" : : [mask]"r"(mask));
    80004758:	00200793          	li	a5,2
    8000475c:	1007b073          	csrc	sstatus,a5
}
    80004760:	00813403          	ld	s0,8(sp)
    80004764:	01010113          	addi	sp,sp,16
    80004768:	00008067          	ret

000000008000476c <_ZN9Interrupt12enable_sintrEv>:
void Interrupt::enable_sintr() {
    8000476c:	ff010113          	addi	sp,sp,-16
    80004770:	00813423          	sd	s0,8(sp)
    80004774:	01010413          	addi	s0,sp,16
    __asm__ volatile("csrs sstatus, %[mask]" : : [mask]"r"(mask));
    80004778:	00200793          	li	a5,2
    8000477c:	1007a073          	csrs	sstatus,a5
}
    80004780:	00813403          	ld	s0,8(sp)
    80004784:	01010113          	addi	sp,sp,16
    80004788:	00008067          	ret

000000008000478c <_ZN9Interrupt12userMaskSoftEv>:
 void Interrupt::userMaskSoft(){
    8000478c:	ff010113          	addi	sp,sp,-16
    80004790:	00813423          	sd	s0,8(sp)
    80004794:	01010413          	addi	s0,sp,16
    __asm__ volatile("csrc sie, %[mask]" : : [mask]"r"(mask));
    80004798:	00200793          	li	a5,2
    8000479c:	1047b073          	csrc	sie,a5
}
    800047a0:	00813403          	ld	s0,8(sp)
    800047a4:	01010113          	addi	sp,sp,16
    800047a8:	00008067          	ret

00000000800047ac <_ZN9Interrupt12userMaskHardEv>:
 void Interrupt::userMaskHard(){
    800047ac:	ff010113          	addi	sp,sp,-16
    800047b0:	00813423          	sd	s0,8(sp)
    800047b4:	01010413          	addi	s0,sp,16
    __asm__ volatile("csrc sie, %[mask]" : : [mask]"r"(mask));
    800047b8:	20000793          	li	a5,512
    800047bc:	1047b073          	csrc	sie,a5
}
    800047c0:	00813403          	ld	s0,8(sp)
    800047c4:	01010113          	addi	sp,sp,16
    800047c8:	00008067          	ret

00000000800047cc <_ZN9Interrupt14userUnmaskSoftEv>:
 void Interrupt::userUnmaskSoft(){
    800047cc:	ff010113          	addi	sp,sp,-16
    800047d0:	00813423          	sd	s0,8(sp)
    800047d4:	01010413          	addi	s0,sp,16
    __asm__ volatile("csrs sie, %[mask]" : : [mask]"r"(mask));
    800047d8:	00200793          	li	a5,2
    800047dc:	1047a073          	csrs	sie,a5
}
    800047e0:	00813403          	ld	s0,8(sp)
    800047e4:	01010113          	addi	sp,sp,16
    800047e8:	00008067          	ret

00000000800047ec <_ZN9Interrupt14userUnmaskHardEv>:
void Interrupt::userUnmaskHard(){
    800047ec:	ff010113          	addi	sp,sp,-16
    800047f0:	00813423          	sd	s0,8(sp)
    800047f4:	01010413          	addi	s0,sp,16
    __asm__ volatile("csrs sie, %[mask]" : : [mask]"r"(mask));
    800047f8:	20000793          	li	a5,512
    800047fc:	1047a073          	csrs	sie,a5
}
    80004800:	00813403          	ld	s0,8(sp)
    80004804:	01010113          	addi	sp,sp,16
    80004808:	00008067          	ret

000000008000480c <_ZN9Interrupt19switchToSystemStackEv>:
    if(PCB::running != nullptr && enableSystemStack)
    8000480c:	00006797          	auipc	a5,0x6
    80004810:	8dc7b783          	ld	a5,-1828(a5) # 8000a0e8 <_GLOBAL_OFFSET_TABLE_+0x60>
    80004814:	0007b503          	ld	a0,0(a5)
    80004818:	00050863          	beqz	a0,80004828 <_ZN9Interrupt19switchToSystemStackEv+0x1c>
    8000481c:	00006797          	auipc	a5,0x6
    80004820:	9947c783          	lbu	a5,-1644(a5) # 8000a1b0 <_ZN9Interrupt17enableSystemStackE>
    80004824:	00079463          	bnez	a5,8000482c <_ZN9Interrupt19switchToSystemStackEv+0x20>
    80004828:	00008067          	ret
void Interrupt::switchToSystemStack() {
    8000482c:	fe010113          	addi	sp,sp,-32
    80004830:	00113c23          	sd	ra,24(sp)
    80004834:	00813823          	sd	s0,16(sp)
    80004838:	00913423          	sd	s1,8(sp)
    8000483c:	02010413          	addi	s0,sp,32
        uint64 sp, ssp = PCB::running->getSSP();
    80004840:	ffffd097          	auipc	ra,0xffffd
    80004844:	2c4080e7          	jalr	708(ra) # 80001b04 <_ZN3PCB6getSSPEv>
    80004848:	00050493          	mv	s1,a0
        __asm__ volatile("mv %[sp],sp" :  [sp]"=r"(sp));
    8000484c:	00010593          	mv	a1,sp
        PCB::running->setSP(sp);
    80004850:	00006797          	auipc	a5,0x6
    80004854:	8987b783          	ld	a5,-1896(a5) # 8000a0e8 <_GLOBAL_OFFSET_TABLE_+0x60>
    80004858:	0007b503          	ld	a0,0(a5)
    8000485c:	ffffd097          	auipc	ra,0xffffd
    80004860:	2fc080e7          	jalr	764(ra) # 80001b58 <_ZN3PCB5setSPEm>
        __asm__ volatile("mv sp, %[ssp]" : : [ssp]"r"(ssp));
    80004864:	00048113          	mv	sp,s1
}
    80004868:	01813083          	ld	ra,24(sp)
    8000486c:	01013403          	ld	s0,16(sp)
    80004870:	00813483          	ld	s1,8(sp)
    80004874:	02010113          	addi	sp,sp,32
    80004878:	00008067          	ret

000000008000487c <_ZN9Interrupt17switchToUserStackEv>:
    if(PCB::running != nullptr && enableSystemStack)
    8000487c:	00006797          	auipc	a5,0x6
    80004880:	86c7b783          	ld	a5,-1940(a5) # 8000a0e8 <_GLOBAL_OFFSET_TABLE_+0x60>
    80004884:	0007b503          	ld	a0,0(a5)
    80004888:	00050863          	beqz	a0,80004898 <_ZN9Interrupt17switchToUserStackEv+0x1c>
    8000488c:	00006797          	auipc	a5,0x6
    80004890:	9247c783          	lbu	a5,-1756(a5) # 8000a1b0 <_ZN9Interrupt17enableSystemStackE>
    80004894:	00079463          	bnez	a5,8000489c <_ZN9Interrupt17switchToUserStackEv+0x20>
    80004898:	00008067          	ret
void Interrupt::switchToUserStack() {
    8000489c:	fe010113          	addi	sp,sp,-32
    800048a0:	00113c23          	sd	ra,24(sp)
    800048a4:	00813823          	sd	s0,16(sp)
    800048a8:	00913423          	sd	s1,8(sp)
    800048ac:	02010413          	addi	s0,sp,32
        uint64 sp = PCB::running->getSP();
    800048b0:	ffffd097          	auipc	ra,0xffffd
    800048b4:	270080e7          	jalr	624(ra) # 80001b20 <_ZN3PCB5getSPEv>
    800048b8:	00050493          	mv	s1,a0
        __asm__ volatile("mv %[ssp] , sp" : [ssp]"=r"(ssp));
    800048bc:	00010593          	mv	a1,sp
        PCB::running->setSSP(ssp);
    800048c0:	00006797          	auipc	a5,0x6
    800048c4:	8287b783          	ld	a5,-2008(a5) # 8000a0e8 <_GLOBAL_OFFSET_TABLE_+0x60>
    800048c8:	0007b503          	ld	a0,0(a5)
    800048cc:	ffffd097          	auipc	ra,0xffffd
    800048d0:	270080e7          	jalr	624(ra) # 80001b3c <_ZN3PCB6setSSPEm>
        __asm__ volatile("mv sp, %[sp]" : : [sp]"r"(sp));
    800048d4:	00048113          	mv	sp,s1
}
    800048d8:	01813083          	ld	ra,24(sp)
    800048dc:	01013403          	ld	s0,16(sp)
    800048e0:	00813483          	ld	s1,8(sp)
    800048e4:	02010113          	addi	sp,sp,32
    800048e8:	00008067          	ret

00000000800048ec <_Z11printStringPKc>:

#define LOCK() while(copy_and_swap(lockPrint, 0, 1))
#define UNLOCK() while(copy_and_swap(lockPrint, 1, 0))

void printString(char const *string)
{
    800048ec:	fe010113          	addi	sp,sp,-32
    800048f0:	00113c23          	sd	ra,24(sp)
    800048f4:	00813823          	sd	s0,16(sp)
    800048f8:	00913423          	sd	s1,8(sp)
    800048fc:	02010413          	addi	s0,sp,32
    80004900:	00050493          	mv	s1,a0
    LOCK();
    80004904:	00100613          	li	a2,1
    80004908:	00000593          	li	a1,0
    8000490c:	00006517          	auipc	a0,0x6
    80004910:	8ac50513          	addi	a0,a0,-1876 # 8000a1b8 <lockPrint>
    80004914:	ffffd097          	auipc	ra,0xffffd
    80004918:	830080e7          	jalr	-2000(ra) # 80001144 <copy_and_swap>
    8000491c:	fe0514e3          	bnez	a0,80004904 <_Z11printStringPKc+0x18>
    while (*string != '\0')
    80004920:	0004c503          	lbu	a0,0(s1)
    80004924:	00050a63          	beqz	a0,80004938 <_Z11printStringPKc+0x4c>
    {
        putc(*string);
    80004928:	ffffd097          	auipc	ra,0xffffd
    8000492c:	d18080e7          	jalr	-744(ra) # 80001640 <putc>
        string++;
    80004930:	00148493          	addi	s1,s1,1
    while (*string != '\0')
    80004934:	fedff06f          	j	80004920 <_Z11printStringPKc+0x34>
    }
    UNLOCK();
    80004938:	00000613          	li	a2,0
    8000493c:	00100593          	li	a1,1
    80004940:	00006517          	auipc	a0,0x6
    80004944:	87850513          	addi	a0,a0,-1928 # 8000a1b8 <lockPrint>
    80004948:	ffffc097          	auipc	ra,0xffffc
    8000494c:	7fc080e7          	jalr	2044(ra) # 80001144 <copy_and_swap>
    80004950:	fe0514e3          	bnez	a0,80004938 <_Z11printStringPKc+0x4c>
}
    80004954:	01813083          	ld	ra,24(sp)
    80004958:	01013403          	ld	s0,16(sp)
    8000495c:	00813483          	ld	s1,8(sp)
    80004960:	02010113          	addi	sp,sp,32
    80004964:	00008067          	ret

0000000080004968 <_Z9getStringPci>:

char* getString(char *buf, int max) {
    80004968:	fd010113          	addi	sp,sp,-48
    8000496c:	02113423          	sd	ra,40(sp)
    80004970:	02813023          	sd	s0,32(sp)
    80004974:	00913c23          	sd	s1,24(sp)
    80004978:	01213823          	sd	s2,16(sp)
    8000497c:	01313423          	sd	s3,8(sp)
    80004980:	01413023          	sd	s4,0(sp)
    80004984:	03010413          	addi	s0,sp,48
    80004988:	00050993          	mv	s3,a0
    8000498c:	00058a13          	mv	s4,a1
    LOCK();
    80004990:	00100613          	li	a2,1
    80004994:	00000593          	li	a1,0
    80004998:	00006517          	auipc	a0,0x6
    8000499c:	82050513          	addi	a0,a0,-2016 # 8000a1b8 <lockPrint>
    800049a0:	ffffc097          	auipc	ra,0xffffc
    800049a4:	7a4080e7          	jalr	1956(ra) # 80001144 <copy_and_swap>
    800049a8:	fe0514e3          	bnez	a0,80004990 <_Z9getStringPci+0x28>
    int i, cc;
    char c;

    for(i=0; i+1 < max; ){
    800049ac:	00000913          	li	s2,0
    800049b0:	00090493          	mv	s1,s2
    800049b4:	0019091b          	addiw	s2,s2,1
    800049b8:	03495a63          	bge	s2,s4,800049ec <_Z9getStringPci+0x84>
        cc = getc();
    800049bc:	ffffd097          	auipc	ra,0xffffd
    800049c0:	c4c080e7          	jalr	-948(ra) # 80001608 <getc>
        if(cc < 1)
    800049c4:	02050463          	beqz	a0,800049ec <_Z9getStringPci+0x84>
            break;
        c = cc;
        buf[i++] = c;
    800049c8:	009984b3          	add	s1,s3,s1
    800049cc:	00a48023          	sb	a0,0(s1)
        if(c == '\n' || c == '\r')
    800049d0:	00a00793          	li	a5,10
    800049d4:	00f50a63          	beq	a0,a5,800049e8 <_Z9getStringPci+0x80>
    800049d8:	00d00793          	li	a5,13
    800049dc:	fcf51ae3          	bne	a0,a5,800049b0 <_Z9getStringPci+0x48>
        buf[i++] = c;
    800049e0:	00090493          	mv	s1,s2
    800049e4:	0080006f          	j	800049ec <_Z9getStringPci+0x84>
    800049e8:	00090493          	mv	s1,s2
            break;
    }
    buf[i] = '\0';
    800049ec:	009984b3          	add	s1,s3,s1
    800049f0:	00048023          	sb	zero,0(s1)

    UNLOCK();
    800049f4:	00000613          	li	a2,0
    800049f8:	00100593          	li	a1,1
    800049fc:	00005517          	auipc	a0,0x5
    80004a00:	7bc50513          	addi	a0,a0,1980 # 8000a1b8 <lockPrint>
    80004a04:	ffffc097          	auipc	ra,0xffffc
    80004a08:	740080e7          	jalr	1856(ra) # 80001144 <copy_and_swap>
    80004a0c:	fe0514e3          	bnez	a0,800049f4 <_Z9getStringPci+0x8c>
    return buf;
}
    80004a10:	00098513          	mv	a0,s3
    80004a14:	02813083          	ld	ra,40(sp)
    80004a18:	02013403          	ld	s0,32(sp)
    80004a1c:	01813483          	ld	s1,24(sp)
    80004a20:	01013903          	ld	s2,16(sp)
    80004a24:	00813983          	ld	s3,8(sp)
    80004a28:	00013a03          	ld	s4,0(sp)
    80004a2c:	03010113          	addi	sp,sp,48
    80004a30:	00008067          	ret

0000000080004a34 <_Z11stringToIntPKc>:

int stringToInt(const char *s) {
    80004a34:	ff010113          	addi	sp,sp,-16
    80004a38:	00813423          	sd	s0,8(sp)
    80004a3c:	01010413          	addi	s0,sp,16
    80004a40:	00050693          	mv	a3,a0
    int n;

    n = 0;
    80004a44:	00000513          	li	a0,0
    while ('0' <= *s && *s <= '9')
    80004a48:	0006c603          	lbu	a2,0(a3)
    80004a4c:	fd06071b          	addiw	a4,a2,-48
    80004a50:	0ff77713          	andi	a4,a4,255
    80004a54:	00900793          	li	a5,9
    80004a58:	02e7e063          	bltu	a5,a4,80004a78 <_Z11stringToIntPKc+0x44>
        n = n * 10 + *s++ - '0';
    80004a5c:	0025179b          	slliw	a5,a0,0x2
    80004a60:	00a787bb          	addw	a5,a5,a0
    80004a64:	0017979b          	slliw	a5,a5,0x1
    80004a68:	00168693          	addi	a3,a3,1
    80004a6c:	00c787bb          	addw	a5,a5,a2
    80004a70:	fd07851b          	addiw	a0,a5,-48
    while ('0' <= *s && *s <= '9')
    80004a74:	fd5ff06f          	j	80004a48 <_Z11stringToIntPKc+0x14>
    return n;
}
    80004a78:	00813403          	ld	s0,8(sp)
    80004a7c:	01010113          	addi	sp,sp,16
    80004a80:	00008067          	ret

0000000080004a84 <_Z8printIntiii>:

char digits[] = "0123456789ABCDEF";

void printInt(int xx, int base, int sgn)
{
    80004a84:	fc010113          	addi	sp,sp,-64
    80004a88:	02113c23          	sd	ra,56(sp)
    80004a8c:	02813823          	sd	s0,48(sp)
    80004a90:	02913423          	sd	s1,40(sp)
    80004a94:	03213023          	sd	s2,32(sp)
    80004a98:	01313c23          	sd	s3,24(sp)
    80004a9c:	04010413          	addi	s0,sp,64
    80004aa0:	00050493          	mv	s1,a0
    80004aa4:	00058913          	mv	s2,a1
    80004aa8:	00060993          	mv	s3,a2
    LOCK();
    80004aac:	00100613          	li	a2,1
    80004ab0:	00000593          	li	a1,0
    80004ab4:	00005517          	auipc	a0,0x5
    80004ab8:	70450513          	addi	a0,a0,1796 # 8000a1b8 <lockPrint>
    80004abc:	ffffc097          	auipc	ra,0xffffc
    80004ac0:	688080e7          	jalr	1672(ra) # 80001144 <copy_and_swap>
    80004ac4:	fe0514e3          	bnez	a0,80004aac <_Z8printIntiii+0x28>
    char buf[16];
    int i, neg;
    uint x;

    neg = 0;
    if(sgn && xx < 0){
    80004ac8:	00098463          	beqz	s3,80004ad0 <_Z8printIntiii+0x4c>
    80004acc:	0804c463          	bltz	s1,80004b54 <_Z8printIntiii+0xd0>
        neg = 1;
        x = -xx;
    } else {
        x = xx;
    80004ad0:	0004851b          	sext.w	a0,s1
    neg = 0;
    80004ad4:	00000593          	li	a1,0
    }

    i = 0;
    80004ad8:	00000493          	li	s1,0
    do{
        buf[i++] = digits[x % base];
    80004adc:	0009079b          	sext.w	a5,s2
    80004ae0:	0325773b          	remuw	a4,a0,s2
    80004ae4:	00048613          	mv	a2,s1
    80004ae8:	0014849b          	addiw	s1,s1,1
    80004aec:	02071693          	slli	a3,a4,0x20
    80004af0:	0206d693          	srli	a3,a3,0x20
    80004af4:	00005717          	auipc	a4,0x5
    80004af8:	57c70713          	addi	a4,a4,1404 # 8000a070 <digits>
    80004afc:	00d70733          	add	a4,a4,a3
    80004b00:	00074683          	lbu	a3,0(a4)
    80004b04:	fd040713          	addi	a4,s0,-48
    80004b08:	00c70733          	add	a4,a4,a2
    80004b0c:	fed70823          	sb	a3,-16(a4)
    }while((x /= base) != 0);
    80004b10:	0005071b          	sext.w	a4,a0
    80004b14:	0325553b          	divuw	a0,a0,s2
    80004b18:	fcf772e3          	bgeu	a4,a5,80004adc <_Z8printIntiii+0x58>
    if(neg)
    80004b1c:	00058c63          	beqz	a1,80004b34 <_Z8printIntiii+0xb0>
        buf[i++] = '-';
    80004b20:	fd040793          	addi	a5,s0,-48
    80004b24:	009784b3          	add	s1,a5,s1
    80004b28:	02d00793          	li	a5,45
    80004b2c:	fef48823          	sb	a5,-16(s1)
    80004b30:	0026049b          	addiw	s1,a2,2

    while(--i >= 0)
    80004b34:	fff4849b          	addiw	s1,s1,-1
    80004b38:	0204c463          	bltz	s1,80004b60 <_Z8printIntiii+0xdc>
        putc(buf[i]);
    80004b3c:	fd040793          	addi	a5,s0,-48
    80004b40:	009787b3          	add	a5,a5,s1
    80004b44:	ff07c503          	lbu	a0,-16(a5)
    80004b48:	ffffd097          	auipc	ra,0xffffd
    80004b4c:	af8080e7          	jalr	-1288(ra) # 80001640 <putc>
    80004b50:	fe5ff06f          	j	80004b34 <_Z8printIntiii+0xb0>
        x = -xx;
    80004b54:	4090053b          	negw	a0,s1
        neg = 1;
    80004b58:	00100593          	li	a1,1
        x = -xx;
    80004b5c:	f7dff06f          	j	80004ad8 <_Z8printIntiii+0x54>

    UNLOCK();
    80004b60:	00000613          	li	a2,0
    80004b64:	00100593          	li	a1,1
    80004b68:	00005517          	auipc	a0,0x5
    80004b6c:	65050513          	addi	a0,a0,1616 # 8000a1b8 <lockPrint>
    80004b70:	ffffc097          	auipc	ra,0xffffc
    80004b74:	5d4080e7          	jalr	1492(ra) # 80001144 <copy_and_swap>
    80004b78:	fe0514e3          	bnez	a0,80004b60 <_Z8printIntiii+0xdc>
    80004b7c:	03813083          	ld	ra,56(sp)
    80004b80:	03013403          	ld	s0,48(sp)
    80004b84:	02813483          	ld	s1,40(sp)
    80004b88:	02013903          	ld	s2,32(sp)
    80004b8c:	01813983          	ld	s3,24(sp)
    80004b90:	04010113          	addi	sp,sp,64
    80004b94:	00008067          	ret

0000000080004b98 <_ZN9BufferCPPC1Ei>:
#include "buffer_CPP_API.hpp"

BufferCPP::BufferCPP(int _cap) : cap(_cap + 1), head(0), tail(0) {
    80004b98:	fd010113          	addi	sp,sp,-48
    80004b9c:	02113423          	sd	ra,40(sp)
    80004ba0:	02813023          	sd	s0,32(sp)
    80004ba4:	00913c23          	sd	s1,24(sp)
    80004ba8:	01213823          	sd	s2,16(sp)
    80004bac:	01313423          	sd	s3,8(sp)
    80004bb0:	03010413          	addi	s0,sp,48
    80004bb4:	00050493          	mv	s1,a0
    80004bb8:	00058913          	mv	s2,a1
    80004bbc:	0015879b          	addiw	a5,a1,1
    80004bc0:	0007851b          	sext.w	a0,a5
    80004bc4:	00f4a023          	sw	a5,0(s1)
    80004bc8:	0004a823          	sw	zero,16(s1)
    80004bcc:	0004aa23          	sw	zero,20(s1)
    buffer = (int *)mem_alloc(sizeof(int) * cap);
    80004bd0:	00251513          	slli	a0,a0,0x2
    80004bd4:	ffffc097          	auipc	ra,0xffffc
    80004bd8:	630080e7          	jalr	1584(ra) # 80001204 <mem_alloc>
    80004bdc:	00a4b423          	sd	a0,8(s1)
    itemAvailable = new Semaphore(0);
    80004be0:	01000513          	li	a0,16
    80004be4:	ffffe097          	auipc	ra,0xffffe
    80004be8:	8b8080e7          	jalr	-1864(ra) # 8000249c <_Znwm>
    80004bec:	00050993          	mv	s3,a0
    80004bf0:	00000593          	li	a1,0
    80004bf4:	ffffd097          	auipc	ra,0xffffd
    80004bf8:	700080e7          	jalr	1792(ra) # 800022f4 <_ZN9SemaphoreC1Ej>
    80004bfc:	0334b023          	sd	s3,32(s1)
    spaceAvailable = new Semaphore(_cap);
    80004c00:	01000513          	li	a0,16
    80004c04:	ffffe097          	auipc	ra,0xffffe
    80004c08:	898080e7          	jalr	-1896(ra) # 8000249c <_Znwm>
    80004c0c:	00050993          	mv	s3,a0
    80004c10:	00090593          	mv	a1,s2
    80004c14:	ffffd097          	auipc	ra,0xffffd
    80004c18:	6e0080e7          	jalr	1760(ra) # 800022f4 <_ZN9SemaphoreC1Ej>
    80004c1c:	0134bc23          	sd	s3,24(s1)
    mutexHead = new Semaphore(1);
    80004c20:	01000513          	li	a0,16
    80004c24:	ffffe097          	auipc	ra,0xffffe
    80004c28:	878080e7          	jalr	-1928(ra) # 8000249c <_Znwm>
    80004c2c:	00050913          	mv	s2,a0
    80004c30:	00100593          	li	a1,1
    80004c34:	ffffd097          	auipc	ra,0xffffd
    80004c38:	6c0080e7          	jalr	1728(ra) # 800022f4 <_ZN9SemaphoreC1Ej>
    80004c3c:	0324b423          	sd	s2,40(s1)
    mutexTail = new Semaphore(1);
    80004c40:	01000513          	li	a0,16
    80004c44:	ffffe097          	auipc	ra,0xffffe
    80004c48:	858080e7          	jalr	-1960(ra) # 8000249c <_Znwm>
    80004c4c:	00050913          	mv	s2,a0
    80004c50:	00100593          	li	a1,1
    80004c54:	ffffd097          	auipc	ra,0xffffd
    80004c58:	6a0080e7          	jalr	1696(ra) # 800022f4 <_ZN9SemaphoreC1Ej>
    80004c5c:	0324b823          	sd	s2,48(s1)
}
    80004c60:	02813083          	ld	ra,40(sp)
    80004c64:	02013403          	ld	s0,32(sp)
    80004c68:	01813483          	ld	s1,24(sp)
    80004c6c:	01013903          	ld	s2,16(sp)
    80004c70:	00813983          	ld	s3,8(sp)
    80004c74:	03010113          	addi	sp,sp,48
    80004c78:	00008067          	ret
    80004c7c:	00050493          	mv	s1,a0
    itemAvailable = new Semaphore(0);
    80004c80:	00098513          	mv	a0,s3
    80004c84:	ffffe097          	auipc	ra,0xffffe
    80004c88:	868080e7          	jalr	-1944(ra) # 800024ec <_ZdlPv>
    80004c8c:	00048513          	mv	a0,s1
    80004c90:	00006097          	auipc	ra,0x6
    80004c94:	5f8080e7          	jalr	1528(ra) # 8000b288 <_Unwind_Resume>
    80004c98:	00050493          	mv	s1,a0
    spaceAvailable = new Semaphore(_cap);
    80004c9c:	00098513          	mv	a0,s3
    80004ca0:	ffffe097          	auipc	ra,0xffffe
    80004ca4:	84c080e7          	jalr	-1972(ra) # 800024ec <_ZdlPv>
    80004ca8:	00048513          	mv	a0,s1
    80004cac:	00006097          	auipc	ra,0x6
    80004cb0:	5dc080e7          	jalr	1500(ra) # 8000b288 <_Unwind_Resume>
    80004cb4:	00050493          	mv	s1,a0
    mutexHead = new Semaphore(1);
    80004cb8:	00090513          	mv	a0,s2
    80004cbc:	ffffe097          	auipc	ra,0xffffe
    80004cc0:	830080e7          	jalr	-2000(ra) # 800024ec <_ZdlPv>
    80004cc4:	00048513          	mv	a0,s1
    80004cc8:	00006097          	auipc	ra,0x6
    80004ccc:	5c0080e7          	jalr	1472(ra) # 8000b288 <_Unwind_Resume>
    80004cd0:	00050493          	mv	s1,a0
    mutexTail = new Semaphore(1);
    80004cd4:	00090513          	mv	a0,s2
    80004cd8:	ffffe097          	auipc	ra,0xffffe
    80004cdc:	814080e7          	jalr	-2028(ra) # 800024ec <_ZdlPv>
    80004ce0:	00048513          	mv	a0,s1
    80004ce4:	00006097          	auipc	ra,0x6
    80004ce8:	5a4080e7          	jalr	1444(ra) # 8000b288 <_Unwind_Resume>

0000000080004cec <_ZN9BufferCPP3putEi>:
    delete mutexTail;
    delete mutexHead;

}

void BufferCPP::put(int val) {
    80004cec:	fe010113          	addi	sp,sp,-32
    80004cf0:	00113c23          	sd	ra,24(sp)
    80004cf4:	00813823          	sd	s0,16(sp)
    80004cf8:	00913423          	sd	s1,8(sp)
    80004cfc:	01213023          	sd	s2,0(sp)
    80004d00:	02010413          	addi	s0,sp,32
    80004d04:	00050493          	mv	s1,a0
    80004d08:	00058913          	mv	s2,a1
    spaceAvailable->wait();
    80004d0c:	01853503          	ld	a0,24(a0)
    80004d10:	ffffe097          	auipc	ra,0xffffe
    80004d14:	9dc080e7          	jalr	-1572(ra) # 800026ec <_ZN9Semaphore4waitEv>

    mutexTail->wait();
    80004d18:	0304b503          	ld	a0,48(s1)
    80004d1c:	ffffe097          	auipc	ra,0xffffe
    80004d20:	9d0080e7          	jalr	-1584(ra) # 800026ec <_ZN9Semaphore4waitEv>
    buffer[tail] = val;
    80004d24:	0084b783          	ld	a5,8(s1)
    80004d28:	0144a703          	lw	a4,20(s1)
    80004d2c:	00271713          	slli	a4,a4,0x2
    80004d30:	00e787b3          	add	a5,a5,a4
    80004d34:	0127a023          	sw	s2,0(a5)
    tail = (tail + 1) % cap;
    80004d38:	0144a783          	lw	a5,20(s1)
    80004d3c:	0017879b          	addiw	a5,a5,1
    80004d40:	0004a703          	lw	a4,0(s1)
    80004d44:	02e7e7bb          	remw	a5,a5,a4
    80004d48:	00f4aa23          	sw	a5,20(s1)
    mutexTail->signal();
    80004d4c:	0304b503          	ld	a0,48(s1)
    80004d50:	ffffe097          	auipc	ra,0xffffe
    80004d54:	9c8080e7          	jalr	-1592(ra) # 80002718 <_ZN9Semaphore6signalEv>

    itemAvailable->signal();
    80004d58:	0204b503          	ld	a0,32(s1)
    80004d5c:	ffffe097          	auipc	ra,0xffffe
    80004d60:	9bc080e7          	jalr	-1604(ra) # 80002718 <_ZN9Semaphore6signalEv>

}
    80004d64:	01813083          	ld	ra,24(sp)
    80004d68:	01013403          	ld	s0,16(sp)
    80004d6c:	00813483          	ld	s1,8(sp)
    80004d70:	00013903          	ld	s2,0(sp)
    80004d74:	02010113          	addi	sp,sp,32
    80004d78:	00008067          	ret

0000000080004d7c <_ZN9BufferCPP3getEv>:

int BufferCPP::get() {
    80004d7c:	fe010113          	addi	sp,sp,-32
    80004d80:	00113c23          	sd	ra,24(sp)
    80004d84:	00813823          	sd	s0,16(sp)
    80004d88:	00913423          	sd	s1,8(sp)
    80004d8c:	01213023          	sd	s2,0(sp)
    80004d90:	02010413          	addi	s0,sp,32
    80004d94:	00050493          	mv	s1,a0
    itemAvailable->wait();
    80004d98:	02053503          	ld	a0,32(a0)
    80004d9c:	ffffe097          	auipc	ra,0xffffe
    80004da0:	950080e7          	jalr	-1712(ra) # 800026ec <_ZN9Semaphore4waitEv>

    mutexHead->wait();
    80004da4:	0284b503          	ld	a0,40(s1)
    80004da8:	ffffe097          	auipc	ra,0xffffe
    80004dac:	944080e7          	jalr	-1724(ra) # 800026ec <_ZN9Semaphore4waitEv>

    int ret = buffer[head];
    80004db0:	0084b703          	ld	a4,8(s1)
    80004db4:	0104a783          	lw	a5,16(s1)
    80004db8:	00279693          	slli	a3,a5,0x2
    80004dbc:	00d70733          	add	a4,a4,a3
    80004dc0:	00072903          	lw	s2,0(a4)
    head = (head + 1) % cap;
    80004dc4:	0017879b          	addiw	a5,a5,1
    80004dc8:	0004a703          	lw	a4,0(s1)
    80004dcc:	02e7e7bb          	remw	a5,a5,a4
    80004dd0:	00f4a823          	sw	a5,16(s1)
    mutexHead->signal();
    80004dd4:	0284b503          	ld	a0,40(s1)
    80004dd8:	ffffe097          	auipc	ra,0xffffe
    80004ddc:	940080e7          	jalr	-1728(ra) # 80002718 <_ZN9Semaphore6signalEv>

    spaceAvailable->signal();
    80004de0:	0184b503          	ld	a0,24(s1)
    80004de4:	ffffe097          	auipc	ra,0xffffe
    80004de8:	934080e7          	jalr	-1740(ra) # 80002718 <_ZN9Semaphore6signalEv>

    return ret;
}
    80004dec:	00090513          	mv	a0,s2
    80004df0:	01813083          	ld	ra,24(sp)
    80004df4:	01013403          	ld	s0,16(sp)
    80004df8:	00813483          	ld	s1,8(sp)
    80004dfc:	00013903          	ld	s2,0(sp)
    80004e00:	02010113          	addi	sp,sp,32
    80004e04:	00008067          	ret

0000000080004e08 <_ZN9BufferCPP6getCntEv>:

int BufferCPP::getCnt() {
    80004e08:	fe010113          	addi	sp,sp,-32
    80004e0c:	00113c23          	sd	ra,24(sp)
    80004e10:	00813823          	sd	s0,16(sp)
    80004e14:	00913423          	sd	s1,8(sp)
    80004e18:	01213023          	sd	s2,0(sp)
    80004e1c:	02010413          	addi	s0,sp,32
    80004e20:	00050493          	mv	s1,a0
    int ret;

    mutexHead->wait();
    80004e24:	02853503          	ld	a0,40(a0)
    80004e28:	ffffe097          	auipc	ra,0xffffe
    80004e2c:	8c4080e7          	jalr	-1852(ra) # 800026ec <_ZN9Semaphore4waitEv>
    mutexTail->wait();
    80004e30:	0304b503          	ld	a0,48(s1)
    80004e34:	ffffe097          	auipc	ra,0xffffe
    80004e38:	8b8080e7          	jalr	-1864(ra) # 800026ec <_ZN9Semaphore4waitEv>

    if (tail >= head) {
    80004e3c:	0144a783          	lw	a5,20(s1)
    80004e40:	0104a903          	lw	s2,16(s1)
    80004e44:	0327ce63          	blt	a5,s2,80004e80 <_ZN9BufferCPP6getCntEv+0x78>
        ret = tail - head;
    80004e48:	4127893b          	subw	s2,a5,s2
    } else {
        ret = cap - head + tail;
    }

    mutexTail->signal();
    80004e4c:	0304b503          	ld	a0,48(s1)
    80004e50:	ffffe097          	auipc	ra,0xffffe
    80004e54:	8c8080e7          	jalr	-1848(ra) # 80002718 <_ZN9Semaphore6signalEv>
    mutexHead->signal();
    80004e58:	0284b503          	ld	a0,40(s1)
    80004e5c:	ffffe097          	auipc	ra,0xffffe
    80004e60:	8bc080e7          	jalr	-1860(ra) # 80002718 <_ZN9Semaphore6signalEv>

    return ret;
}
    80004e64:	00090513          	mv	a0,s2
    80004e68:	01813083          	ld	ra,24(sp)
    80004e6c:	01013403          	ld	s0,16(sp)
    80004e70:	00813483          	ld	s1,8(sp)
    80004e74:	00013903          	ld	s2,0(sp)
    80004e78:	02010113          	addi	sp,sp,32
    80004e7c:	00008067          	ret
        ret = cap - head + tail;
    80004e80:	0004a703          	lw	a4,0(s1)
    80004e84:	4127093b          	subw	s2,a4,s2
    80004e88:	00f9093b          	addw	s2,s2,a5
    80004e8c:	fc1ff06f          	j	80004e4c <_ZN9BufferCPP6getCntEv+0x44>

0000000080004e90 <_ZN9BufferCPPD1Ev>:
BufferCPP::~BufferCPP() {
    80004e90:	fe010113          	addi	sp,sp,-32
    80004e94:	00113c23          	sd	ra,24(sp)
    80004e98:	00813823          	sd	s0,16(sp)
    80004e9c:	00913423          	sd	s1,8(sp)
    80004ea0:	02010413          	addi	s0,sp,32
    80004ea4:	00050493          	mv	s1,a0
    Console::putc('\n');
    80004ea8:	00a00513          	li	a0,10
    80004eac:	ffffe097          	auipc	ra,0xffffe
    80004eb0:	8c0080e7          	jalr	-1856(ra) # 8000276c <_ZN7Console4putcEc>
    printString("Buffer deleted!\n");
    80004eb4:	00003517          	auipc	a0,0x3
    80004eb8:	25450513          	addi	a0,a0,596 # 80008108 <CONSOLE_STATUS+0xf0>
    80004ebc:	00000097          	auipc	ra,0x0
    80004ec0:	a30080e7          	jalr	-1488(ra) # 800048ec <_Z11printStringPKc>
    while (getCnt()) {
    80004ec4:	00048513          	mv	a0,s1
    80004ec8:	00000097          	auipc	ra,0x0
    80004ecc:	f40080e7          	jalr	-192(ra) # 80004e08 <_ZN9BufferCPP6getCntEv>
    80004ed0:	02050c63          	beqz	a0,80004f08 <_ZN9BufferCPPD1Ev+0x78>
        char ch = buffer[head];
    80004ed4:	0084b783          	ld	a5,8(s1)
    80004ed8:	0104a703          	lw	a4,16(s1)
    80004edc:	00271713          	slli	a4,a4,0x2
    80004ee0:	00e787b3          	add	a5,a5,a4
        Console::putc(ch);
    80004ee4:	0007c503          	lbu	a0,0(a5)
    80004ee8:	ffffe097          	auipc	ra,0xffffe
    80004eec:	884080e7          	jalr	-1916(ra) # 8000276c <_ZN7Console4putcEc>
        head = (head + 1) % cap;
    80004ef0:	0104a783          	lw	a5,16(s1)
    80004ef4:	0017879b          	addiw	a5,a5,1
    80004ef8:	0004a703          	lw	a4,0(s1)
    80004efc:	02e7e7bb          	remw	a5,a5,a4
    80004f00:	00f4a823          	sw	a5,16(s1)
    while (getCnt()) {
    80004f04:	fc1ff06f          	j	80004ec4 <_ZN9BufferCPPD1Ev+0x34>
    Console::putc('!');
    80004f08:	02100513          	li	a0,33
    80004f0c:	ffffe097          	auipc	ra,0xffffe
    80004f10:	860080e7          	jalr	-1952(ra) # 8000276c <_ZN7Console4putcEc>
    Console::putc('\n');
    80004f14:	00a00513          	li	a0,10
    80004f18:	ffffe097          	auipc	ra,0xffffe
    80004f1c:	854080e7          	jalr	-1964(ra) # 8000276c <_ZN7Console4putcEc>
    mem_free(buffer);
    80004f20:	0084b503          	ld	a0,8(s1)
    80004f24:	ffffc097          	auipc	ra,0xffffc
    80004f28:	32c080e7          	jalr	812(ra) # 80001250 <mem_free>
    delete itemAvailable;
    80004f2c:	0204b503          	ld	a0,32(s1)
    80004f30:	00050863          	beqz	a0,80004f40 <_ZN9BufferCPPD1Ev+0xb0>
    80004f34:	00053783          	ld	a5,0(a0)
    80004f38:	0087b783          	ld	a5,8(a5)
    80004f3c:	000780e7          	jalr	a5
    delete spaceAvailable;
    80004f40:	0184b503          	ld	a0,24(s1)
    80004f44:	00050863          	beqz	a0,80004f54 <_ZN9BufferCPPD1Ev+0xc4>
    80004f48:	00053783          	ld	a5,0(a0)
    80004f4c:	0087b783          	ld	a5,8(a5)
    80004f50:	000780e7          	jalr	a5
    delete mutexTail;
    80004f54:	0304b503          	ld	a0,48(s1)
    80004f58:	00050863          	beqz	a0,80004f68 <_ZN9BufferCPPD1Ev+0xd8>
    80004f5c:	00053783          	ld	a5,0(a0)
    80004f60:	0087b783          	ld	a5,8(a5)
    80004f64:	000780e7          	jalr	a5
    delete mutexHead;
    80004f68:	0284b503          	ld	a0,40(s1)
    80004f6c:	00050863          	beqz	a0,80004f7c <_ZN9BufferCPPD1Ev+0xec>
    80004f70:	00053783          	ld	a5,0(a0)
    80004f74:	0087b783          	ld	a5,8(a5)
    80004f78:	000780e7          	jalr	a5
}
    80004f7c:	01813083          	ld	ra,24(sp)
    80004f80:	01013403          	ld	s0,16(sp)
    80004f84:	00813483          	ld	s1,8(sp)
    80004f88:	02010113          	addi	sp,sp,32
    80004f8c:	00008067          	ret

0000000080004f90 <_ZN6BufferC1Ei>:
#include "buffer.hpp"

Buffer::Buffer(int _cap) : cap(_cap + 1), head(0), tail(0) {
    80004f90:	fe010113          	addi	sp,sp,-32
    80004f94:	00113c23          	sd	ra,24(sp)
    80004f98:	00813823          	sd	s0,16(sp)
    80004f9c:	00913423          	sd	s1,8(sp)
    80004fa0:	01213023          	sd	s2,0(sp)
    80004fa4:	02010413          	addi	s0,sp,32
    80004fa8:	00050493          	mv	s1,a0
    80004fac:	00058913          	mv	s2,a1
    80004fb0:	0015879b          	addiw	a5,a1,1
    80004fb4:	0007851b          	sext.w	a0,a5
    80004fb8:	00f4a023          	sw	a5,0(s1)
    80004fbc:	0004a823          	sw	zero,16(s1)
    80004fc0:	0004aa23          	sw	zero,20(s1)
    buffer = (int *)mem_alloc(sizeof(int) * cap);
    80004fc4:	00251513          	slli	a0,a0,0x2
    80004fc8:	ffffc097          	auipc	ra,0xffffc
    80004fcc:	23c080e7          	jalr	572(ra) # 80001204 <mem_alloc>
    80004fd0:	00a4b423          	sd	a0,8(s1)
    sem_open(&itemAvailable, 0);
    80004fd4:	00000593          	li	a1,0
    80004fd8:	02048513          	addi	a0,s1,32
    80004fdc:	ffffc097          	auipc	ra,0xffffc
    80004fe0:	460080e7          	jalr	1120(ra) # 8000143c <sem_open>
    sem_open(&spaceAvailable, _cap);
    80004fe4:	00090593          	mv	a1,s2
    80004fe8:	01848513          	addi	a0,s1,24
    80004fec:	ffffc097          	auipc	ra,0xffffc
    80004ff0:	450080e7          	jalr	1104(ra) # 8000143c <sem_open>
    sem_open(&mutexHead, 1);
    80004ff4:	00100593          	li	a1,1
    80004ff8:	02848513          	addi	a0,s1,40
    80004ffc:	ffffc097          	auipc	ra,0xffffc
    80005000:	440080e7          	jalr	1088(ra) # 8000143c <sem_open>
    sem_open(&mutexTail, 1);
    80005004:	00100593          	li	a1,1
    80005008:	03048513          	addi	a0,s1,48
    8000500c:	ffffc097          	auipc	ra,0xffffc
    80005010:	430080e7          	jalr	1072(ra) # 8000143c <sem_open>
}
    80005014:	01813083          	ld	ra,24(sp)
    80005018:	01013403          	ld	s0,16(sp)
    8000501c:	00813483          	ld	s1,8(sp)
    80005020:	00013903          	ld	s2,0(sp)
    80005024:	02010113          	addi	sp,sp,32
    80005028:	00008067          	ret

000000008000502c <_ZN6Buffer3putEi>:
    sem_close(spaceAvailable);
    sem_close(mutexTail);
    sem_close(mutexHead);
}

void Buffer::put(int val) {
    8000502c:	fe010113          	addi	sp,sp,-32
    80005030:	00113c23          	sd	ra,24(sp)
    80005034:	00813823          	sd	s0,16(sp)
    80005038:	00913423          	sd	s1,8(sp)
    8000503c:	01213023          	sd	s2,0(sp)
    80005040:	02010413          	addi	s0,sp,32
    80005044:	00050493          	mv	s1,a0
    80005048:	00058913          	mv	s2,a1
    sem_wait(spaceAvailable);
    8000504c:	01853503          	ld	a0,24(a0)
    80005050:	ffffc097          	auipc	ra,0xffffc
    80005054:	498080e7          	jalr	1176(ra) # 800014e8 <sem_wait>

    sem_wait(mutexTail);
    80005058:	0304b503          	ld	a0,48(s1)
    8000505c:	ffffc097          	auipc	ra,0xffffc
    80005060:	48c080e7          	jalr	1164(ra) # 800014e8 <sem_wait>
    buffer[tail] = val;
    80005064:	0084b783          	ld	a5,8(s1)
    80005068:	0144a703          	lw	a4,20(s1)
    8000506c:	00271713          	slli	a4,a4,0x2
    80005070:	00e787b3          	add	a5,a5,a4
    80005074:	0127a023          	sw	s2,0(a5)
    tail = (tail + 1) % cap;
    80005078:	0144a783          	lw	a5,20(s1)
    8000507c:	0017879b          	addiw	a5,a5,1
    80005080:	0004a703          	lw	a4,0(s1)
    80005084:	02e7e7bb          	remw	a5,a5,a4
    80005088:	00f4aa23          	sw	a5,20(s1)
    sem_signal(mutexTail);
    8000508c:	0304b503          	ld	a0,48(s1)
    80005090:	ffffc097          	auipc	ra,0xffffc
    80005094:	494080e7          	jalr	1172(ra) # 80001524 <sem_signal>

    sem_signal(itemAvailable);
    80005098:	0204b503          	ld	a0,32(s1)
    8000509c:	ffffc097          	auipc	ra,0xffffc
    800050a0:	488080e7          	jalr	1160(ra) # 80001524 <sem_signal>

}
    800050a4:	01813083          	ld	ra,24(sp)
    800050a8:	01013403          	ld	s0,16(sp)
    800050ac:	00813483          	ld	s1,8(sp)
    800050b0:	00013903          	ld	s2,0(sp)
    800050b4:	02010113          	addi	sp,sp,32
    800050b8:	00008067          	ret

00000000800050bc <_ZN6Buffer3getEv>:

int Buffer::get() {
    800050bc:	fe010113          	addi	sp,sp,-32
    800050c0:	00113c23          	sd	ra,24(sp)
    800050c4:	00813823          	sd	s0,16(sp)
    800050c8:	00913423          	sd	s1,8(sp)
    800050cc:	01213023          	sd	s2,0(sp)
    800050d0:	02010413          	addi	s0,sp,32
    800050d4:	00050493          	mv	s1,a0
    sem_wait(itemAvailable);
    800050d8:	02053503          	ld	a0,32(a0)
    800050dc:	ffffc097          	auipc	ra,0xffffc
    800050e0:	40c080e7          	jalr	1036(ra) # 800014e8 <sem_wait>

    sem_wait(mutexHead);
    800050e4:	0284b503          	ld	a0,40(s1)
    800050e8:	ffffc097          	auipc	ra,0xffffc
    800050ec:	400080e7          	jalr	1024(ra) # 800014e8 <sem_wait>

    int ret = buffer[head];
    800050f0:	0084b703          	ld	a4,8(s1)
    800050f4:	0104a783          	lw	a5,16(s1)
    800050f8:	00279693          	slli	a3,a5,0x2
    800050fc:	00d70733          	add	a4,a4,a3
    80005100:	00072903          	lw	s2,0(a4)
    head = (head + 1) % cap;
    80005104:	0017879b          	addiw	a5,a5,1
    80005108:	0004a703          	lw	a4,0(s1)
    8000510c:	02e7e7bb          	remw	a5,a5,a4
    80005110:	00f4a823          	sw	a5,16(s1)
    sem_signal(mutexHead);
    80005114:	0284b503          	ld	a0,40(s1)
    80005118:	ffffc097          	auipc	ra,0xffffc
    8000511c:	40c080e7          	jalr	1036(ra) # 80001524 <sem_signal>

    sem_signal(spaceAvailable);
    80005120:	0184b503          	ld	a0,24(s1)
    80005124:	ffffc097          	auipc	ra,0xffffc
    80005128:	400080e7          	jalr	1024(ra) # 80001524 <sem_signal>

    return ret;
}
    8000512c:	00090513          	mv	a0,s2
    80005130:	01813083          	ld	ra,24(sp)
    80005134:	01013403          	ld	s0,16(sp)
    80005138:	00813483          	ld	s1,8(sp)
    8000513c:	00013903          	ld	s2,0(sp)
    80005140:	02010113          	addi	sp,sp,32
    80005144:	00008067          	ret

0000000080005148 <_ZN6Buffer6getCntEv>:

int Buffer::getCnt() {
    80005148:	fe010113          	addi	sp,sp,-32
    8000514c:	00113c23          	sd	ra,24(sp)
    80005150:	00813823          	sd	s0,16(sp)
    80005154:	00913423          	sd	s1,8(sp)
    80005158:	01213023          	sd	s2,0(sp)
    8000515c:	02010413          	addi	s0,sp,32
    80005160:	00050493          	mv	s1,a0
    int ret;

    sem_wait(mutexHead);
    80005164:	02853503          	ld	a0,40(a0)
    80005168:	ffffc097          	auipc	ra,0xffffc
    8000516c:	380080e7          	jalr	896(ra) # 800014e8 <sem_wait>
    sem_wait(mutexTail);
    80005170:	0304b503          	ld	a0,48(s1)
    80005174:	ffffc097          	auipc	ra,0xffffc
    80005178:	374080e7          	jalr	884(ra) # 800014e8 <sem_wait>

    if (tail >= head) {
    8000517c:	0144a783          	lw	a5,20(s1)
    80005180:	0104a903          	lw	s2,16(s1)
    80005184:	0327ce63          	blt	a5,s2,800051c0 <_ZN6Buffer6getCntEv+0x78>
        ret = tail - head;
    80005188:	4127893b          	subw	s2,a5,s2
    } else {
        ret = cap - head + tail;
    }

    sem_signal(mutexTail);
    8000518c:	0304b503          	ld	a0,48(s1)
    80005190:	ffffc097          	auipc	ra,0xffffc
    80005194:	394080e7          	jalr	916(ra) # 80001524 <sem_signal>
    sem_signal(mutexHead);
    80005198:	0284b503          	ld	a0,40(s1)
    8000519c:	ffffc097          	auipc	ra,0xffffc
    800051a0:	388080e7          	jalr	904(ra) # 80001524 <sem_signal>

    return ret;
}
    800051a4:	00090513          	mv	a0,s2
    800051a8:	01813083          	ld	ra,24(sp)
    800051ac:	01013403          	ld	s0,16(sp)
    800051b0:	00813483          	ld	s1,8(sp)
    800051b4:	00013903          	ld	s2,0(sp)
    800051b8:	02010113          	addi	sp,sp,32
    800051bc:	00008067          	ret
        ret = cap - head + tail;
    800051c0:	0004a703          	lw	a4,0(s1)
    800051c4:	4127093b          	subw	s2,a4,s2
    800051c8:	00f9093b          	addw	s2,s2,a5
    800051cc:	fc1ff06f          	j	8000518c <_ZN6Buffer6getCntEv+0x44>

00000000800051d0 <_ZN6BufferD1Ev>:
Buffer::~Buffer() {
    800051d0:	fe010113          	addi	sp,sp,-32
    800051d4:	00113c23          	sd	ra,24(sp)
    800051d8:	00813823          	sd	s0,16(sp)
    800051dc:	00913423          	sd	s1,8(sp)
    800051e0:	02010413          	addi	s0,sp,32
    800051e4:	00050493          	mv	s1,a0
    putc('\n');
    800051e8:	00a00513          	li	a0,10
    800051ec:	ffffc097          	auipc	ra,0xffffc
    800051f0:	454080e7          	jalr	1108(ra) # 80001640 <putc>
    printString("Buffer deleted!\n");
    800051f4:	00003517          	auipc	a0,0x3
    800051f8:	f1450513          	addi	a0,a0,-236 # 80008108 <CONSOLE_STATUS+0xf0>
    800051fc:	fffff097          	auipc	ra,0xfffff
    80005200:	6f0080e7          	jalr	1776(ra) # 800048ec <_Z11printStringPKc>
    while (getCnt() > 0) {
    80005204:	00048513          	mv	a0,s1
    80005208:	00000097          	auipc	ra,0x0
    8000520c:	f40080e7          	jalr	-192(ra) # 80005148 <_ZN6Buffer6getCntEv>
    80005210:	02a05c63          	blez	a0,80005248 <_ZN6BufferD1Ev+0x78>
        char ch = buffer[head];
    80005214:	0084b783          	ld	a5,8(s1)
    80005218:	0104a703          	lw	a4,16(s1)
    8000521c:	00271713          	slli	a4,a4,0x2
    80005220:	00e787b3          	add	a5,a5,a4
        putc(ch);
    80005224:	0007c503          	lbu	a0,0(a5)
    80005228:	ffffc097          	auipc	ra,0xffffc
    8000522c:	418080e7          	jalr	1048(ra) # 80001640 <putc>
        head = (head + 1) % cap;
    80005230:	0104a783          	lw	a5,16(s1)
    80005234:	0017879b          	addiw	a5,a5,1
    80005238:	0004a703          	lw	a4,0(s1)
    8000523c:	02e7e7bb          	remw	a5,a5,a4
    80005240:	00f4a823          	sw	a5,16(s1)
    while (getCnt() > 0) {
    80005244:	fc1ff06f          	j	80005204 <_ZN6BufferD1Ev+0x34>
    putc('!');
    80005248:	02100513          	li	a0,33
    8000524c:	ffffc097          	auipc	ra,0xffffc
    80005250:	3f4080e7          	jalr	1012(ra) # 80001640 <putc>
    putc('\n');
    80005254:	00a00513          	li	a0,10
    80005258:	ffffc097          	auipc	ra,0xffffc
    8000525c:	3e8080e7          	jalr	1000(ra) # 80001640 <putc>
    mem_free(buffer);
    80005260:	0084b503          	ld	a0,8(s1)
    80005264:	ffffc097          	auipc	ra,0xffffc
    80005268:	fec080e7          	jalr	-20(ra) # 80001250 <mem_free>
    sem_close(itemAvailable);
    8000526c:	0204b503          	ld	a0,32(s1)
    80005270:	ffffc097          	auipc	ra,0xffffc
    80005274:	23c080e7          	jalr	572(ra) # 800014ac <sem_close>
    sem_close(spaceAvailable);
    80005278:	0184b503          	ld	a0,24(s1)
    8000527c:	ffffc097          	auipc	ra,0xffffc
    80005280:	230080e7          	jalr	560(ra) # 800014ac <sem_close>
    sem_close(mutexTail);
    80005284:	0304b503          	ld	a0,48(s1)
    80005288:	ffffc097          	auipc	ra,0xffffc
    8000528c:	224080e7          	jalr	548(ra) # 800014ac <sem_close>
    sem_close(mutexHead);
    80005290:	0284b503          	ld	a0,40(s1)
    80005294:	ffffc097          	auipc	ra,0xffffc
    80005298:	218080e7          	jalr	536(ra) # 800014ac <sem_close>
}
    8000529c:	01813083          	ld	ra,24(sp)
    800052a0:	01013403          	ld	s0,16(sp)
    800052a4:	00813483          	ld	s1,8(sp)
    800052a8:	02010113          	addi	sp,sp,32
    800052ac:	00008067          	ret

00000000800052b0 <start>:
    800052b0:	ff010113          	addi	sp,sp,-16
    800052b4:	00813423          	sd	s0,8(sp)
    800052b8:	01010413          	addi	s0,sp,16
    800052bc:	300027f3          	csrr	a5,mstatus
    800052c0:	ffffe737          	lui	a4,0xffffe
    800052c4:	7ff70713          	addi	a4,a4,2047 # ffffffffffffe7ff <end+0xffffffff7fff33df>
    800052c8:	00e7f7b3          	and	a5,a5,a4
    800052cc:	00001737          	lui	a4,0x1
    800052d0:	80070713          	addi	a4,a4,-2048 # 800 <_entry-0x7ffff800>
    800052d4:	00e7e7b3          	or	a5,a5,a4
    800052d8:	30079073          	csrw	mstatus,a5
    800052dc:	00000797          	auipc	a5,0x0
    800052e0:	16078793          	addi	a5,a5,352 # 8000543c <system_main>
    800052e4:	34179073          	csrw	mepc,a5
    800052e8:	00000793          	li	a5,0
    800052ec:	18079073          	csrw	satp,a5
    800052f0:	000107b7          	lui	a5,0x10
    800052f4:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    800052f8:	30279073          	csrw	medeleg,a5
    800052fc:	30379073          	csrw	mideleg,a5
    80005300:	104027f3          	csrr	a5,sie
    80005304:	2227e793          	ori	a5,a5,546
    80005308:	10479073          	csrw	sie,a5
    8000530c:	fff00793          	li	a5,-1
    80005310:	00a7d793          	srli	a5,a5,0xa
    80005314:	3b079073          	csrw	pmpaddr0,a5
    80005318:	00f00793          	li	a5,15
    8000531c:	3a079073          	csrw	pmpcfg0,a5
    80005320:	f14027f3          	csrr	a5,mhartid
    80005324:	0200c737          	lui	a4,0x200c
    80005328:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    8000532c:	0007869b          	sext.w	a3,a5
    80005330:	00269713          	slli	a4,a3,0x2
    80005334:	000f4637          	lui	a2,0xf4
    80005338:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    8000533c:	00d70733          	add	a4,a4,a3
    80005340:	0037979b          	slliw	a5,a5,0x3
    80005344:	020046b7          	lui	a3,0x2004
    80005348:	00d787b3          	add	a5,a5,a3
    8000534c:	00c585b3          	add	a1,a1,a2
    80005350:	00371693          	slli	a3,a4,0x3
    80005354:	00005717          	auipc	a4,0x5
    80005358:	e6c70713          	addi	a4,a4,-404 # 8000a1c0 <timer_scratch>
    8000535c:	00b7b023          	sd	a1,0(a5)
    80005360:	00d70733          	add	a4,a4,a3
    80005364:	00f73c23          	sd	a5,24(a4)
    80005368:	02c73023          	sd	a2,32(a4)
    8000536c:	34071073          	csrw	mscratch,a4
    80005370:	00000797          	auipc	a5,0x0
    80005374:	6e078793          	addi	a5,a5,1760 # 80005a50 <timervec>
    80005378:	30579073          	csrw	mtvec,a5
    8000537c:	300027f3          	csrr	a5,mstatus
    80005380:	0087e793          	ori	a5,a5,8
    80005384:	30079073          	csrw	mstatus,a5
    80005388:	304027f3          	csrr	a5,mie
    8000538c:	0807e793          	ori	a5,a5,128
    80005390:	30479073          	csrw	mie,a5
    80005394:	f14027f3          	csrr	a5,mhartid
    80005398:	0007879b          	sext.w	a5,a5
    8000539c:	00078213          	mv	tp,a5
    800053a0:	30200073          	mret
    800053a4:	00813403          	ld	s0,8(sp)
    800053a8:	01010113          	addi	sp,sp,16
    800053ac:	00008067          	ret

00000000800053b0 <timerinit>:
    800053b0:	ff010113          	addi	sp,sp,-16
    800053b4:	00813423          	sd	s0,8(sp)
    800053b8:	01010413          	addi	s0,sp,16
    800053bc:	f14027f3          	csrr	a5,mhartid
    800053c0:	0200c737          	lui	a4,0x200c
    800053c4:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    800053c8:	0007869b          	sext.w	a3,a5
    800053cc:	00269713          	slli	a4,a3,0x2
    800053d0:	000f4637          	lui	a2,0xf4
    800053d4:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    800053d8:	00d70733          	add	a4,a4,a3
    800053dc:	0037979b          	slliw	a5,a5,0x3
    800053e0:	020046b7          	lui	a3,0x2004
    800053e4:	00d787b3          	add	a5,a5,a3
    800053e8:	00c585b3          	add	a1,a1,a2
    800053ec:	00371693          	slli	a3,a4,0x3
    800053f0:	00005717          	auipc	a4,0x5
    800053f4:	dd070713          	addi	a4,a4,-560 # 8000a1c0 <timer_scratch>
    800053f8:	00b7b023          	sd	a1,0(a5)
    800053fc:	00d70733          	add	a4,a4,a3
    80005400:	00f73c23          	sd	a5,24(a4)
    80005404:	02c73023          	sd	a2,32(a4)
    80005408:	34071073          	csrw	mscratch,a4
    8000540c:	00000797          	auipc	a5,0x0
    80005410:	64478793          	addi	a5,a5,1604 # 80005a50 <timervec>
    80005414:	30579073          	csrw	mtvec,a5
    80005418:	300027f3          	csrr	a5,mstatus
    8000541c:	0087e793          	ori	a5,a5,8
    80005420:	30079073          	csrw	mstatus,a5
    80005424:	304027f3          	csrr	a5,mie
    80005428:	0807e793          	ori	a5,a5,128
    8000542c:	30479073          	csrw	mie,a5
    80005430:	00813403          	ld	s0,8(sp)
    80005434:	01010113          	addi	sp,sp,16
    80005438:	00008067          	ret

000000008000543c <system_main>:
    8000543c:	fe010113          	addi	sp,sp,-32
    80005440:	00813823          	sd	s0,16(sp)
    80005444:	00913423          	sd	s1,8(sp)
    80005448:	00113c23          	sd	ra,24(sp)
    8000544c:	02010413          	addi	s0,sp,32
    80005450:	00000097          	auipc	ra,0x0
    80005454:	0c4080e7          	jalr	196(ra) # 80005514 <cpuid>
    80005458:	00005497          	auipc	s1,0x5
    8000545c:	cb848493          	addi	s1,s1,-840 # 8000a110 <started>
    80005460:	02050263          	beqz	a0,80005484 <system_main+0x48>
    80005464:	0004a783          	lw	a5,0(s1)
    80005468:	0007879b          	sext.w	a5,a5
    8000546c:	fe078ce3          	beqz	a5,80005464 <system_main+0x28>
    80005470:	0ff0000f          	fence
    80005474:	00003517          	auipc	a0,0x3
    80005478:	cdc50513          	addi	a0,a0,-804 # 80008150 <CONSOLE_STATUS+0x138>
    8000547c:	00001097          	auipc	ra,0x1
    80005480:	a70080e7          	jalr	-1424(ra) # 80005eec <panic>
    80005484:	00001097          	auipc	ra,0x1
    80005488:	9c4080e7          	jalr	-1596(ra) # 80005e48 <consoleinit>
    8000548c:	00001097          	auipc	ra,0x1
    80005490:	150080e7          	jalr	336(ra) # 800065dc <printfinit>
    80005494:	00003517          	auipc	a0,0x3
    80005498:	bc450513          	addi	a0,a0,-1084 # 80008058 <CONSOLE_STATUS+0x40>
    8000549c:	00001097          	auipc	ra,0x1
    800054a0:	aac080e7          	jalr	-1364(ra) # 80005f48 <__printf>
    800054a4:	00003517          	auipc	a0,0x3
    800054a8:	c7c50513          	addi	a0,a0,-900 # 80008120 <CONSOLE_STATUS+0x108>
    800054ac:	00001097          	auipc	ra,0x1
    800054b0:	a9c080e7          	jalr	-1380(ra) # 80005f48 <__printf>
    800054b4:	00003517          	auipc	a0,0x3
    800054b8:	ba450513          	addi	a0,a0,-1116 # 80008058 <CONSOLE_STATUS+0x40>
    800054bc:	00001097          	auipc	ra,0x1
    800054c0:	a8c080e7          	jalr	-1396(ra) # 80005f48 <__printf>
    800054c4:	00001097          	auipc	ra,0x1
    800054c8:	4a4080e7          	jalr	1188(ra) # 80006968 <kinit>
    800054cc:	00000097          	auipc	ra,0x0
    800054d0:	148080e7          	jalr	328(ra) # 80005614 <trapinit>
    800054d4:	00000097          	auipc	ra,0x0
    800054d8:	16c080e7          	jalr	364(ra) # 80005640 <trapinithart>
    800054dc:	00000097          	auipc	ra,0x0
    800054e0:	5b4080e7          	jalr	1460(ra) # 80005a90 <plicinit>
    800054e4:	00000097          	auipc	ra,0x0
    800054e8:	5d4080e7          	jalr	1492(ra) # 80005ab8 <plicinithart>
    800054ec:	00000097          	auipc	ra,0x0
    800054f0:	078080e7          	jalr	120(ra) # 80005564 <userinit>
    800054f4:	0ff0000f          	fence
    800054f8:	00100793          	li	a5,1
    800054fc:	00003517          	auipc	a0,0x3
    80005500:	c3c50513          	addi	a0,a0,-964 # 80008138 <CONSOLE_STATUS+0x120>
    80005504:	00f4a023          	sw	a5,0(s1)
    80005508:	00001097          	auipc	ra,0x1
    8000550c:	a40080e7          	jalr	-1472(ra) # 80005f48 <__printf>
    80005510:	0000006f          	j	80005510 <system_main+0xd4>

0000000080005514 <cpuid>:
    80005514:	ff010113          	addi	sp,sp,-16
    80005518:	00813423          	sd	s0,8(sp)
    8000551c:	01010413          	addi	s0,sp,16
    80005520:	00020513          	mv	a0,tp
    80005524:	00813403          	ld	s0,8(sp)
    80005528:	0005051b          	sext.w	a0,a0
    8000552c:	01010113          	addi	sp,sp,16
    80005530:	00008067          	ret

0000000080005534 <mycpu>:
    80005534:	ff010113          	addi	sp,sp,-16
    80005538:	00813423          	sd	s0,8(sp)
    8000553c:	01010413          	addi	s0,sp,16
    80005540:	00020793          	mv	a5,tp
    80005544:	00813403          	ld	s0,8(sp)
    80005548:	0007879b          	sext.w	a5,a5
    8000554c:	00779793          	slli	a5,a5,0x7
    80005550:	00006517          	auipc	a0,0x6
    80005554:	ca050513          	addi	a0,a0,-864 # 8000b1f0 <cpus>
    80005558:	00f50533          	add	a0,a0,a5
    8000555c:	01010113          	addi	sp,sp,16
    80005560:	00008067          	ret

0000000080005564 <userinit>:
    80005564:	ff010113          	addi	sp,sp,-16
    80005568:	00813423          	sd	s0,8(sp)
    8000556c:	01010413          	addi	s0,sp,16
    80005570:	00813403          	ld	s0,8(sp)
    80005574:	01010113          	addi	sp,sp,16
    80005578:	ffffe317          	auipc	t1,0xffffe
    8000557c:	f8830067          	jr	-120(t1) # 80003500 <main>

0000000080005580 <either_copyout>:
    80005580:	ff010113          	addi	sp,sp,-16
    80005584:	00813023          	sd	s0,0(sp)
    80005588:	00113423          	sd	ra,8(sp)
    8000558c:	01010413          	addi	s0,sp,16
    80005590:	02051663          	bnez	a0,800055bc <either_copyout+0x3c>
    80005594:	00058513          	mv	a0,a1
    80005598:	00060593          	mv	a1,a2
    8000559c:	0006861b          	sext.w	a2,a3
    800055a0:	00002097          	auipc	ra,0x2
    800055a4:	c54080e7          	jalr	-940(ra) # 800071f4 <__memmove>
    800055a8:	00813083          	ld	ra,8(sp)
    800055ac:	00013403          	ld	s0,0(sp)
    800055b0:	00000513          	li	a0,0
    800055b4:	01010113          	addi	sp,sp,16
    800055b8:	00008067          	ret
    800055bc:	00003517          	auipc	a0,0x3
    800055c0:	bbc50513          	addi	a0,a0,-1092 # 80008178 <CONSOLE_STATUS+0x160>
    800055c4:	00001097          	auipc	ra,0x1
    800055c8:	928080e7          	jalr	-1752(ra) # 80005eec <panic>

00000000800055cc <either_copyin>:
    800055cc:	ff010113          	addi	sp,sp,-16
    800055d0:	00813023          	sd	s0,0(sp)
    800055d4:	00113423          	sd	ra,8(sp)
    800055d8:	01010413          	addi	s0,sp,16
    800055dc:	02059463          	bnez	a1,80005604 <either_copyin+0x38>
    800055e0:	00060593          	mv	a1,a2
    800055e4:	0006861b          	sext.w	a2,a3
    800055e8:	00002097          	auipc	ra,0x2
    800055ec:	c0c080e7          	jalr	-1012(ra) # 800071f4 <__memmove>
    800055f0:	00813083          	ld	ra,8(sp)
    800055f4:	00013403          	ld	s0,0(sp)
    800055f8:	00000513          	li	a0,0
    800055fc:	01010113          	addi	sp,sp,16
    80005600:	00008067          	ret
    80005604:	00003517          	auipc	a0,0x3
    80005608:	b9c50513          	addi	a0,a0,-1124 # 800081a0 <CONSOLE_STATUS+0x188>
    8000560c:	00001097          	auipc	ra,0x1
    80005610:	8e0080e7          	jalr	-1824(ra) # 80005eec <panic>

0000000080005614 <trapinit>:
    80005614:	ff010113          	addi	sp,sp,-16
    80005618:	00813423          	sd	s0,8(sp)
    8000561c:	01010413          	addi	s0,sp,16
    80005620:	00813403          	ld	s0,8(sp)
    80005624:	00003597          	auipc	a1,0x3
    80005628:	ba458593          	addi	a1,a1,-1116 # 800081c8 <CONSOLE_STATUS+0x1b0>
    8000562c:	00006517          	auipc	a0,0x6
    80005630:	c4450513          	addi	a0,a0,-956 # 8000b270 <tickslock>
    80005634:	01010113          	addi	sp,sp,16
    80005638:	00001317          	auipc	t1,0x1
    8000563c:	5c030067          	jr	1472(t1) # 80006bf8 <initlock>

0000000080005640 <trapinithart>:
    80005640:	ff010113          	addi	sp,sp,-16
    80005644:	00813423          	sd	s0,8(sp)
    80005648:	01010413          	addi	s0,sp,16
    8000564c:	00000797          	auipc	a5,0x0
    80005650:	2f478793          	addi	a5,a5,756 # 80005940 <kernelvec>
    80005654:	10579073          	csrw	stvec,a5
    80005658:	00813403          	ld	s0,8(sp)
    8000565c:	01010113          	addi	sp,sp,16
    80005660:	00008067          	ret

0000000080005664 <usertrap>:
    80005664:	ff010113          	addi	sp,sp,-16
    80005668:	00813423          	sd	s0,8(sp)
    8000566c:	01010413          	addi	s0,sp,16
    80005670:	00813403          	ld	s0,8(sp)
    80005674:	01010113          	addi	sp,sp,16
    80005678:	00008067          	ret

000000008000567c <usertrapret>:
    8000567c:	ff010113          	addi	sp,sp,-16
    80005680:	00813423          	sd	s0,8(sp)
    80005684:	01010413          	addi	s0,sp,16
    80005688:	00813403          	ld	s0,8(sp)
    8000568c:	01010113          	addi	sp,sp,16
    80005690:	00008067          	ret

0000000080005694 <kerneltrap>:
    80005694:	fe010113          	addi	sp,sp,-32
    80005698:	00813823          	sd	s0,16(sp)
    8000569c:	00113c23          	sd	ra,24(sp)
    800056a0:	00913423          	sd	s1,8(sp)
    800056a4:	02010413          	addi	s0,sp,32
    800056a8:	142025f3          	csrr	a1,scause
    800056ac:	100027f3          	csrr	a5,sstatus
    800056b0:	0027f793          	andi	a5,a5,2
    800056b4:	10079c63          	bnez	a5,800057cc <kerneltrap+0x138>
    800056b8:	142027f3          	csrr	a5,scause
    800056bc:	0207ce63          	bltz	a5,800056f8 <kerneltrap+0x64>
    800056c0:	00003517          	auipc	a0,0x3
    800056c4:	b5050513          	addi	a0,a0,-1200 # 80008210 <CONSOLE_STATUS+0x1f8>
    800056c8:	00001097          	auipc	ra,0x1
    800056cc:	880080e7          	jalr	-1920(ra) # 80005f48 <__printf>
    800056d0:	141025f3          	csrr	a1,sepc
    800056d4:	14302673          	csrr	a2,stval
    800056d8:	00003517          	auipc	a0,0x3
    800056dc:	b4850513          	addi	a0,a0,-1208 # 80008220 <CONSOLE_STATUS+0x208>
    800056e0:	00001097          	auipc	ra,0x1
    800056e4:	868080e7          	jalr	-1944(ra) # 80005f48 <__printf>
    800056e8:	00003517          	auipc	a0,0x3
    800056ec:	b5050513          	addi	a0,a0,-1200 # 80008238 <CONSOLE_STATUS+0x220>
    800056f0:	00000097          	auipc	ra,0x0
    800056f4:	7fc080e7          	jalr	2044(ra) # 80005eec <panic>
    800056f8:	0ff7f713          	andi	a4,a5,255
    800056fc:	00900693          	li	a3,9
    80005700:	04d70063          	beq	a4,a3,80005740 <kerneltrap+0xac>
    80005704:	fff00713          	li	a4,-1
    80005708:	03f71713          	slli	a4,a4,0x3f
    8000570c:	00170713          	addi	a4,a4,1
    80005710:	fae798e3          	bne	a5,a4,800056c0 <kerneltrap+0x2c>
    80005714:	00000097          	auipc	ra,0x0
    80005718:	e00080e7          	jalr	-512(ra) # 80005514 <cpuid>
    8000571c:	06050663          	beqz	a0,80005788 <kerneltrap+0xf4>
    80005720:	144027f3          	csrr	a5,sip
    80005724:	ffd7f793          	andi	a5,a5,-3
    80005728:	14479073          	csrw	sip,a5
    8000572c:	01813083          	ld	ra,24(sp)
    80005730:	01013403          	ld	s0,16(sp)
    80005734:	00813483          	ld	s1,8(sp)
    80005738:	02010113          	addi	sp,sp,32
    8000573c:	00008067          	ret
    80005740:	00000097          	auipc	ra,0x0
    80005744:	3c4080e7          	jalr	964(ra) # 80005b04 <plic_claim>
    80005748:	00a00793          	li	a5,10
    8000574c:	00050493          	mv	s1,a0
    80005750:	06f50863          	beq	a0,a5,800057c0 <kerneltrap+0x12c>
    80005754:	fc050ce3          	beqz	a0,8000572c <kerneltrap+0x98>
    80005758:	00050593          	mv	a1,a0
    8000575c:	00003517          	auipc	a0,0x3
    80005760:	a9450513          	addi	a0,a0,-1388 # 800081f0 <CONSOLE_STATUS+0x1d8>
    80005764:	00000097          	auipc	ra,0x0
    80005768:	7e4080e7          	jalr	2020(ra) # 80005f48 <__printf>
    8000576c:	01013403          	ld	s0,16(sp)
    80005770:	01813083          	ld	ra,24(sp)
    80005774:	00048513          	mv	a0,s1
    80005778:	00813483          	ld	s1,8(sp)
    8000577c:	02010113          	addi	sp,sp,32
    80005780:	00000317          	auipc	t1,0x0
    80005784:	3bc30067          	jr	956(t1) # 80005b3c <plic_complete>
    80005788:	00006517          	auipc	a0,0x6
    8000578c:	ae850513          	addi	a0,a0,-1304 # 8000b270 <tickslock>
    80005790:	00001097          	auipc	ra,0x1
    80005794:	48c080e7          	jalr	1164(ra) # 80006c1c <acquire>
    80005798:	00005717          	auipc	a4,0x5
    8000579c:	97c70713          	addi	a4,a4,-1668 # 8000a114 <ticks>
    800057a0:	00072783          	lw	a5,0(a4)
    800057a4:	00006517          	auipc	a0,0x6
    800057a8:	acc50513          	addi	a0,a0,-1332 # 8000b270 <tickslock>
    800057ac:	0017879b          	addiw	a5,a5,1
    800057b0:	00f72023          	sw	a5,0(a4)
    800057b4:	00001097          	auipc	ra,0x1
    800057b8:	534080e7          	jalr	1332(ra) # 80006ce8 <release>
    800057bc:	f65ff06f          	j	80005720 <kerneltrap+0x8c>
    800057c0:	00001097          	auipc	ra,0x1
    800057c4:	090080e7          	jalr	144(ra) # 80006850 <uartintr>
    800057c8:	fa5ff06f          	j	8000576c <kerneltrap+0xd8>
    800057cc:	00003517          	auipc	a0,0x3
    800057d0:	a0450513          	addi	a0,a0,-1532 # 800081d0 <CONSOLE_STATUS+0x1b8>
    800057d4:	00000097          	auipc	ra,0x0
    800057d8:	718080e7          	jalr	1816(ra) # 80005eec <panic>

00000000800057dc <clockintr>:
    800057dc:	fe010113          	addi	sp,sp,-32
    800057e0:	00813823          	sd	s0,16(sp)
    800057e4:	00913423          	sd	s1,8(sp)
    800057e8:	00113c23          	sd	ra,24(sp)
    800057ec:	02010413          	addi	s0,sp,32
    800057f0:	00006497          	auipc	s1,0x6
    800057f4:	a8048493          	addi	s1,s1,-1408 # 8000b270 <tickslock>
    800057f8:	00048513          	mv	a0,s1
    800057fc:	00001097          	auipc	ra,0x1
    80005800:	420080e7          	jalr	1056(ra) # 80006c1c <acquire>
    80005804:	00005717          	auipc	a4,0x5
    80005808:	91070713          	addi	a4,a4,-1776 # 8000a114 <ticks>
    8000580c:	00072783          	lw	a5,0(a4)
    80005810:	01013403          	ld	s0,16(sp)
    80005814:	01813083          	ld	ra,24(sp)
    80005818:	00048513          	mv	a0,s1
    8000581c:	0017879b          	addiw	a5,a5,1
    80005820:	00813483          	ld	s1,8(sp)
    80005824:	00f72023          	sw	a5,0(a4)
    80005828:	02010113          	addi	sp,sp,32
    8000582c:	00001317          	auipc	t1,0x1
    80005830:	4bc30067          	jr	1212(t1) # 80006ce8 <release>

0000000080005834 <devintr>:
    80005834:	142027f3          	csrr	a5,scause
    80005838:	00000513          	li	a0,0
    8000583c:	0007c463          	bltz	a5,80005844 <devintr+0x10>
    80005840:	00008067          	ret
    80005844:	fe010113          	addi	sp,sp,-32
    80005848:	00813823          	sd	s0,16(sp)
    8000584c:	00113c23          	sd	ra,24(sp)
    80005850:	00913423          	sd	s1,8(sp)
    80005854:	02010413          	addi	s0,sp,32
    80005858:	0ff7f713          	andi	a4,a5,255
    8000585c:	00900693          	li	a3,9
    80005860:	04d70c63          	beq	a4,a3,800058b8 <devintr+0x84>
    80005864:	fff00713          	li	a4,-1
    80005868:	03f71713          	slli	a4,a4,0x3f
    8000586c:	00170713          	addi	a4,a4,1
    80005870:	00e78c63          	beq	a5,a4,80005888 <devintr+0x54>
    80005874:	01813083          	ld	ra,24(sp)
    80005878:	01013403          	ld	s0,16(sp)
    8000587c:	00813483          	ld	s1,8(sp)
    80005880:	02010113          	addi	sp,sp,32
    80005884:	00008067          	ret
    80005888:	00000097          	auipc	ra,0x0
    8000588c:	c8c080e7          	jalr	-884(ra) # 80005514 <cpuid>
    80005890:	06050663          	beqz	a0,800058fc <devintr+0xc8>
    80005894:	144027f3          	csrr	a5,sip
    80005898:	ffd7f793          	andi	a5,a5,-3
    8000589c:	14479073          	csrw	sip,a5
    800058a0:	01813083          	ld	ra,24(sp)
    800058a4:	01013403          	ld	s0,16(sp)
    800058a8:	00813483          	ld	s1,8(sp)
    800058ac:	00200513          	li	a0,2
    800058b0:	02010113          	addi	sp,sp,32
    800058b4:	00008067          	ret
    800058b8:	00000097          	auipc	ra,0x0
    800058bc:	24c080e7          	jalr	588(ra) # 80005b04 <plic_claim>
    800058c0:	00a00793          	li	a5,10
    800058c4:	00050493          	mv	s1,a0
    800058c8:	06f50663          	beq	a0,a5,80005934 <devintr+0x100>
    800058cc:	00100513          	li	a0,1
    800058d0:	fa0482e3          	beqz	s1,80005874 <devintr+0x40>
    800058d4:	00048593          	mv	a1,s1
    800058d8:	00003517          	auipc	a0,0x3
    800058dc:	91850513          	addi	a0,a0,-1768 # 800081f0 <CONSOLE_STATUS+0x1d8>
    800058e0:	00000097          	auipc	ra,0x0
    800058e4:	668080e7          	jalr	1640(ra) # 80005f48 <__printf>
    800058e8:	00048513          	mv	a0,s1
    800058ec:	00000097          	auipc	ra,0x0
    800058f0:	250080e7          	jalr	592(ra) # 80005b3c <plic_complete>
    800058f4:	00100513          	li	a0,1
    800058f8:	f7dff06f          	j	80005874 <devintr+0x40>
    800058fc:	00006517          	auipc	a0,0x6
    80005900:	97450513          	addi	a0,a0,-1676 # 8000b270 <tickslock>
    80005904:	00001097          	auipc	ra,0x1
    80005908:	318080e7          	jalr	792(ra) # 80006c1c <acquire>
    8000590c:	00005717          	auipc	a4,0x5
    80005910:	80870713          	addi	a4,a4,-2040 # 8000a114 <ticks>
    80005914:	00072783          	lw	a5,0(a4)
    80005918:	00006517          	auipc	a0,0x6
    8000591c:	95850513          	addi	a0,a0,-1704 # 8000b270 <tickslock>
    80005920:	0017879b          	addiw	a5,a5,1
    80005924:	00f72023          	sw	a5,0(a4)
    80005928:	00001097          	auipc	ra,0x1
    8000592c:	3c0080e7          	jalr	960(ra) # 80006ce8 <release>
    80005930:	f65ff06f          	j	80005894 <devintr+0x60>
    80005934:	00001097          	auipc	ra,0x1
    80005938:	f1c080e7          	jalr	-228(ra) # 80006850 <uartintr>
    8000593c:	fadff06f          	j	800058e8 <devintr+0xb4>

0000000080005940 <kernelvec>:
    80005940:	f0010113          	addi	sp,sp,-256
    80005944:	00113023          	sd	ra,0(sp)
    80005948:	00213423          	sd	sp,8(sp)
    8000594c:	00313823          	sd	gp,16(sp)
    80005950:	00413c23          	sd	tp,24(sp)
    80005954:	02513023          	sd	t0,32(sp)
    80005958:	02613423          	sd	t1,40(sp)
    8000595c:	02713823          	sd	t2,48(sp)
    80005960:	02813c23          	sd	s0,56(sp)
    80005964:	04913023          	sd	s1,64(sp)
    80005968:	04a13423          	sd	a0,72(sp)
    8000596c:	04b13823          	sd	a1,80(sp)
    80005970:	04c13c23          	sd	a2,88(sp)
    80005974:	06d13023          	sd	a3,96(sp)
    80005978:	06e13423          	sd	a4,104(sp)
    8000597c:	06f13823          	sd	a5,112(sp)
    80005980:	07013c23          	sd	a6,120(sp)
    80005984:	09113023          	sd	a7,128(sp)
    80005988:	09213423          	sd	s2,136(sp)
    8000598c:	09313823          	sd	s3,144(sp)
    80005990:	09413c23          	sd	s4,152(sp)
    80005994:	0b513023          	sd	s5,160(sp)
    80005998:	0b613423          	sd	s6,168(sp)
    8000599c:	0b713823          	sd	s7,176(sp)
    800059a0:	0b813c23          	sd	s8,184(sp)
    800059a4:	0d913023          	sd	s9,192(sp)
    800059a8:	0da13423          	sd	s10,200(sp)
    800059ac:	0db13823          	sd	s11,208(sp)
    800059b0:	0dc13c23          	sd	t3,216(sp)
    800059b4:	0fd13023          	sd	t4,224(sp)
    800059b8:	0fe13423          	sd	t5,232(sp)
    800059bc:	0ff13823          	sd	t6,240(sp)
    800059c0:	cd5ff0ef          	jal	ra,80005694 <kerneltrap>
    800059c4:	00013083          	ld	ra,0(sp)
    800059c8:	00813103          	ld	sp,8(sp)
    800059cc:	01013183          	ld	gp,16(sp)
    800059d0:	02013283          	ld	t0,32(sp)
    800059d4:	02813303          	ld	t1,40(sp)
    800059d8:	03013383          	ld	t2,48(sp)
    800059dc:	03813403          	ld	s0,56(sp)
    800059e0:	04013483          	ld	s1,64(sp)
    800059e4:	04813503          	ld	a0,72(sp)
    800059e8:	05013583          	ld	a1,80(sp)
    800059ec:	05813603          	ld	a2,88(sp)
    800059f0:	06013683          	ld	a3,96(sp)
    800059f4:	06813703          	ld	a4,104(sp)
    800059f8:	07013783          	ld	a5,112(sp)
    800059fc:	07813803          	ld	a6,120(sp)
    80005a00:	08013883          	ld	a7,128(sp)
    80005a04:	08813903          	ld	s2,136(sp)
    80005a08:	09013983          	ld	s3,144(sp)
    80005a0c:	09813a03          	ld	s4,152(sp)
    80005a10:	0a013a83          	ld	s5,160(sp)
    80005a14:	0a813b03          	ld	s6,168(sp)
    80005a18:	0b013b83          	ld	s7,176(sp)
    80005a1c:	0b813c03          	ld	s8,184(sp)
    80005a20:	0c013c83          	ld	s9,192(sp)
    80005a24:	0c813d03          	ld	s10,200(sp)
    80005a28:	0d013d83          	ld	s11,208(sp)
    80005a2c:	0d813e03          	ld	t3,216(sp)
    80005a30:	0e013e83          	ld	t4,224(sp)
    80005a34:	0e813f03          	ld	t5,232(sp)
    80005a38:	0f013f83          	ld	t6,240(sp)
    80005a3c:	10010113          	addi	sp,sp,256
    80005a40:	10200073          	sret
    80005a44:	00000013          	nop
    80005a48:	00000013          	nop
    80005a4c:	00000013          	nop

0000000080005a50 <timervec>:
    80005a50:	34051573          	csrrw	a0,mscratch,a0
    80005a54:	00b53023          	sd	a1,0(a0)
    80005a58:	00c53423          	sd	a2,8(a0)
    80005a5c:	00d53823          	sd	a3,16(a0)
    80005a60:	01853583          	ld	a1,24(a0)
    80005a64:	02053603          	ld	a2,32(a0)
    80005a68:	0005b683          	ld	a3,0(a1)
    80005a6c:	00c686b3          	add	a3,a3,a2
    80005a70:	00d5b023          	sd	a3,0(a1)
    80005a74:	00200593          	li	a1,2
    80005a78:	14459073          	csrw	sip,a1
    80005a7c:	01053683          	ld	a3,16(a0)
    80005a80:	00853603          	ld	a2,8(a0)
    80005a84:	00053583          	ld	a1,0(a0)
    80005a88:	34051573          	csrrw	a0,mscratch,a0
    80005a8c:	30200073          	mret

0000000080005a90 <plicinit>:
    80005a90:	ff010113          	addi	sp,sp,-16
    80005a94:	00813423          	sd	s0,8(sp)
    80005a98:	01010413          	addi	s0,sp,16
    80005a9c:	00813403          	ld	s0,8(sp)
    80005aa0:	0c0007b7          	lui	a5,0xc000
    80005aa4:	00100713          	li	a4,1
    80005aa8:	02e7a423          	sw	a4,40(a5) # c000028 <_entry-0x73ffffd8>
    80005aac:	00e7a223          	sw	a4,4(a5)
    80005ab0:	01010113          	addi	sp,sp,16
    80005ab4:	00008067          	ret

0000000080005ab8 <plicinithart>:
    80005ab8:	ff010113          	addi	sp,sp,-16
    80005abc:	00813023          	sd	s0,0(sp)
    80005ac0:	00113423          	sd	ra,8(sp)
    80005ac4:	01010413          	addi	s0,sp,16
    80005ac8:	00000097          	auipc	ra,0x0
    80005acc:	a4c080e7          	jalr	-1460(ra) # 80005514 <cpuid>
    80005ad0:	0085171b          	slliw	a4,a0,0x8
    80005ad4:	0c0027b7          	lui	a5,0xc002
    80005ad8:	00e787b3          	add	a5,a5,a4
    80005adc:	40200713          	li	a4,1026
    80005ae0:	08e7a023          	sw	a4,128(a5) # c002080 <_entry-0x73ffdf80>
    80005ae4:	00813083          	ld	ra,8(sp)
    80005ae8:	00013403          	ld	s0,0(sp)
    80005aec:	00d5151b          	slliw	a0,a0,0xd
    80005af0:	0c2017b7          	lui	a5,0xc201
    80005af4:	00a78533          	add	a0,a5,a0
    80005af8:	00052023          	sw	zero,0(a0)
    80005afc:	01010113          	addi	sp,sp,16
    80005b00:	00008067          	ret

0000000080005b04 <plic_claim>:
    80005b04:	ff010113          	addi	sp,sp,-16
    80005b08:	00813023          	sd	s0,0(sp)
    80005b0c:	00113423          	sd	ra,8(sp)
    80005b10:	01010413          	addi	s0,sp,16
    80005b14:	00000097          	auipc	ra,0x0
    80005b18:	a00080e7          	jalr	-1536(ra) # 80005514 <cpuid>
    80005b1c:	00813083          	ld	ra,8(sp)
    80005b20:	00013403          	ld	s0,0(sp)
    80005b24:	00d5151b          	slliw	a0,a0,0xd
    80005b28:	0c2017b7          	lui	a5,0xc201
    80005b2c:	00a78533          	add	a0,a5,a0
    80005b30:	00452503          	lw	a0,4(a0)
    80005b34:	01010113          	addi	sp,sp,16
    80005b38:	00008067          	ret

0000000080005b3c <plic_complete>:
    80005b3c:	fe010113          	addi	sp,sp,-32
    80005b40:	00813823          	sd	s0,16(sp)
    80005b44:	00913423          	sd	s1,8(sp)
    80005b48:	00113c23          	sd	ra,24(sp)
    80005b4c:	02010413          	addi	s0,sp,32
    80005b50:	00050493          	mv	s1,a0
    80005b54:	00000097          	auipc	ra,0x0
    80005b58:	9c0080e7          	jalr	-1600(ra) # 80005514 <cpuid>
    80005b5c:	01813083          	ld	ra,24(sp)
    80005b60:	01013403          	ld	s0,16(sp)
    80005b64:	00d5179b          	slliw	a5,a0,0xd
    80005b68:	0c201737          	lui	a4,0xc201
    80005b6c:	00f707b3          	add	a5,a4,a5
    80005b70:	0097a223          	sw	s1,4(a5) # c201004 <_entry-0x73dfeffc>
    80005b74:	00813483          	ld	s1,8(sp)
    80005b78:	02010113          	addi	sp,sp,32
    80005b7c:	00008067          	ret

0000000080005b80 <consolewrite>:
    80005b80:	fb010113          	addi	sp,sp,-80
    80005b84:	04813023          	sd	s0,64(sp)
    80005b88:	04113423          	sd	ra,72(sp)
    80005b8c:	02913c23          	sd	s1,56(sp)
    80005b90:	03213823          	sd	s2,48(sp)
    80005b94:	03313423          	sd	s3,40(sp)
    80005b98:	03413023          	sd	s4,32(sp)
    80005b9c:	01513c23          	sd	s5,24(sp)
    80005ba0:	05010413          	addi	s0,sp,80
    80005ba4:	06c05c63          	blez	a2,80005c1c <consolewrite+0x9c>
    80005ba8:	00060993          	mv	s3,a2
    80005bac:	00050a13          	mv	s4,a0
    80005bb0:	00058493          	mv	s1,a1
    80005bb4:	00000913          	li	s2,0
    80005bb8:	fff00a93          	li	s5,-1
    80005bbc:	01c0006f          	j	80005bd8 <consolewrite+0x58>
    80005bc0:	fbf44503          	lbu	a0,-65(s0)
    80005bc4:	0019091b          	addiw	s2,s2,1
    80005bc8:	00148493          	addi	s1,s1,1
    80005bcc:	00001097          	auipc	ra,0x1
    80005bd0:	a9c080e7          	jalr	-1380(ra) # 80006668 <uartputc>
    80005bd4:	03298063          	beq	s3,s2,80005bf4 <consolewrite+0x74>
    80005bd8:	00048613          	mv	a2,s1
    80005bdc:	00100693          	li	a3,1
    80005be0:	000a0593          	mv	a1,s4
    80005be4:	fbf40513          	addi	a0,s0,-65
    80005be8:	00000097          	auipc	ra,0x0
    80005bec:	9e4080e7          	jalr	-1564(ra) # 800055cc <either_copyin>
    80005bf0:	fd5518e3          	bne	a0,s5,80005bc0 <consolewrite+0x40>
    80005bf4:	04813083          	ld	ra,72(sp)
    80005bf8:	04013403          	ld	s0,64(sp)
    80005bfc:	03813483          	ld	s1,56(sp)
    80005c00:	02813983          	ld	s3,40(sp)
    80005c04:	02013a03          	ld	s4,32(sp)
    80005c08:	01813a83          	ld	s5,24(sp)
    80005c0c:	00090513          	mv	a0,s2
    80005c10:	03013903          	ld	s2,48(sp)
    80005c14:	05010113          	addi	sp,sp,80
    80005c18:	00008067          	ret
    80005c1c:	00000913          	li	s2,0
    80005c20:	fd5ff06f          	j	80005bf4 <consolewrite+0x74>

0000000080005c24 <consoleread>:
    80005c24:	f9010113          	addi	sp,sp,-112
    80005c28:	06813023          	sd	s0,96(sp)
    80005c2c:	04913c23          	sd	s1,88(sp)
    80005c30:	05213823          	sd	s2,80(sp)
    80005c34:	05313423          	sd	s3,72(sp)
    80005c38:	05413023          	sd	s4,64(sp)
    80005c3c:	03513c23          	sd	s5,56(sp)
    80005c40:	03613823          	sd	s6,48(sp)
    80005c44:	03713423          	sd	s7,40(sp)
    80005c48:	03813023          	sd	s8,32(sp)
    80005c4c:	06113423          	sd	ra,104(sp)
    80005c50:	01913c23          	sd	s9,24(sp)
    80005c54:	07010413          	addi	s0,sp,112
    80005c58:	00060b93          	mv	s7,a2
    80005c5c:	00050913          	mv	s2,a0
    80005c60:	00058c13          	mv	s8,a1
    80005c64:	00060b1b          	sext.w	s6,a2
    80005c68:	00005497          	auipc	s1,0x5
    80005c6c:	63048493          	addi	s1,s1,1584 # 8000b298 <cons>
    80005c70:	00400993          	li	s3,4
    80005c74:	fff00a13          	li	s4,-1
    80005c78:	00a00a93          	li	s5,10
    80005c7c:	05705e63          	blez	s7,80005cd8 <consoleread+0xb4>
    80005c80:	09c4a703          	lw	a4,156(s1)
    80005c84:	0984a783          	lw	a5,152(s1)
    80005c88:	0007071b          	sext.w	a4,a4
    80005c8c:	08e78463          	beq	a5,a4,80005d14 <consoleread+0xf0>
    80005c90:	07f7f713          	andi	a4,a5,127
    80005c94:	00e48733          	add	a4,s1,a4
    80005c98:	01874703          	lbu	a4,24(a4) # c201018 <_entry-0x73dfefe8>
    80005c9c:	0017869b          	addiw	a3,a5,1
    80005ca0:	08d4ac23          	sw	a3,152(s1)
    80005ca4:	00070c9b          	sext.w	s9,a4
    80005ca8:	0b370663          	beq	a4,s3,80005d54 <consoleread+0x130>
    80005cac:	00100693          	li	a3,1
    80005cb0:	f9f40613          	addi	a2,s0,-97
    80005cb4:	000c0593          	mv	a1,s8
    80005cb8:	00090513          	mv	a0,s2
    80005cbc:	f8e40fa3          	sb	a4,-97(s0)
    80005cc0:	00000097          	auipc	ra,0x0
    80005cc4:	8c0080e7          	jalr	-1856(ra) # 80005580 <either_copyout>
    80005cc8:	01450863          	beq	a0,s4,80005cd8 <consoleread+0xb4>
    80005ccc:	001c0c13          	addi	s8,s8,1
    80005cd0:	fffb8b9b          	addiw	s7,s7,-1
    80005cd4:	fb5c94e3          	bne	s9,s5,80005c7c <consoleread+0x58>
    80005cd8:	000b851b          	sext.w	a0,s7
    80005cdc:	06813083          	ld	ra,104(sp)
    80005ce0:	06013403          	ld	s0,96(sp)
    80005ce4:	05813483          	ld	s1,88(sp)
    80005ce8:	05013903          	ld	s2,80(sp)
    80005cec:	04813983          	ld	s3,72(sp)
    80005cf0:	04013a03          	ld	s4,64(sp)
    80005cf4:	03813a83          	ld	s5,56(sp)
    80005cf8:	02813b83          	ld	s7,40(sp)
    80005cfc:	02013c03          	ld	s8,32(sp)
    80005d00:	01813c83          	ld	s9,24(sp)
    80005d04:	40ab053b          	subw	a0,s6,a0
    80005d08:	03013b03          	ld	s6,48(sp)
    80005d0c:	07010113          	addi	sp,sp,112
    80005d10:	00008067          	ret
    80005d14:	00001097          	auipc	ra,0x1
    80005d18:	1d8080e7          	jalr	472(ra) # 80006eec <push_on>
    80005d1c:	0984a703          	lw	a4,152(s1)
    80005d20:	09c4a783          	lw	a5,156(s1)
    80005d24:	0007879b          	sext.w	a5,a5
    80005d28:	fef70ce3          	beq	a4,a5,80005d20 <consoleread+0xfc>
    80005d2c:	00001097          	auipc	ra,0x1
    80005d30:	234080e7          	jalr	564(ra) # 80006f60 <pop_on>
    80005d34:	0984a783          	lw	a5,152(s1)
    80005d38:	07f7f713          	andi	a4,a5,127
    80005d3c:	00e48733          	add	a4,s1,a4
    80005d40:	01874703          	lbu	a4,24(a4)
    80005d44:	0017869b          	addiw	a3,a5,1
    80005d48:	08d4ac23          	sw	a3,152(s1)
    80005d4c:	00070c9b          	sext.w	s9,a4
    80005d50:	f5371ee3          	bne	a4,s3,80005cac <consoleread+0x88>
    80005d54:	000b851b          	sext.w	a0,s7
    80005d58:	f96bf2e3          	bgeu	s7,s6,80005cdc <consoleread+0xb8>
    80005d5c:	08f4ac23          	sw	a5,152(s1)
    80005d60:	f7dff06f          	j	80005cdc <consoleread+0xb8>

0000000080005d64 <consputc>:
    80005d64:	10000793          	li	a5,256
    80005d68:	00f50663          	beq	a0,a5,80005d74 <consputc+0x10>
    80005d6c:	00001317          	auipc	t1,0x1
    80005d70:	9f430067          	jr	-1548(t1) # 80006760 <uartputc_sync>
    80005d74:	ff010113          	addi	sp,sp,-16
    80005d78:	00113423          	sd	ra,8(sp)
    80005d7c:	00813023          	sd	s0,0(sp)
    80005d80:	01010413          	addi	s0,sp,16
    80005d84:	00800513          	li	a0,8
    80005d88:	00001097          	auipc	ra,0x1
    80005d8c:	9d8080e7          	jalr	-1576(ra) # 80006760 <uartputc_sync>
    80005d90:	02000513          	li	a0,32
    80005d94:	00001097          	auipc	ra,0x1
    80005d98:	9cc080e7          	jalr	-1588(ra) # 80006760 <uartputc_sync>
    80005d9c:	00013403          	ld	s0,0(sp)
    80005da0:	00813083          	ld	ra,8(sp)
    80005da4:	00800513          	li	a0,8
    80005da8:	01010113          	addi	sp,sp,16
    80005dac:	00001317          	auipc	t1,0x1
    80005db0:	9b430067          	jr	-1612(t1) # 80006760 <uartputc_sync>

0000000080005db4 <consoleintr>:
    80005db4:	fe010113          	addi	sp,sp,-32
    80005db8:	00813823          	sd	s0,16(sp)
    80005dbc:	00913423          	sd	s1,8(sp)
    80005dc0:	01213023          	sd	s2,0(sp)
    80005dc4:	00113c23          	sd	ra,24(sp)
    80005dc8:	02010413          	addi	s0,sp,32
    80005dcc:	00005917          	auipc	s2,0x5
    80005dd0:	4cc90913          	addi	s2,s2,1228 # 8000b298 <cons>
    80005dd4:	00050493          	mv	s1,a0
    80005dd8:	00090513          	mv	a0,s2
    80005ddc:	00001097          	auipc	ra,0x1
    80005de0:	e40080e7          	jalr	-448(ra) # 80006c1c <acquire>
    80005de4:	02048c63          	beqz	s1,80005e1c <consoleintr+0x68>
    80005de8:	0a092783          	lw	a5,160(s2)
    80005dec:	09892703          	lw	a4,152(s2)
    80005df0:	07f00693          	li	a3,127
    80005df4:	40e7873b          	subw	a4,a5,a4
    80005df8:	02e6e263          	bltu	a3,a4,80005e1c <consoleintr+0x68>
    80005dfc:	00d00713          	li	a4,13
    80005e00:	04e48063          	beq	s1,a4,80005e40 <consoleintr+0x8c>
    80005e04:	07f7f713          	andi	a4,a5,127
    80005e08:	00e90733          	add	a4,s2,a4
    80005e0c:	0017879b          	addiw	a5,a5,1
    80005e10:	0af92023          	sw	a5,160(s2)
    80005e14:	00970c23          	sb	s1,24(a4)
    80005e18:	08f92e23          	sw	a5,156(s2)
    80005e1c:	01013403          	ld	s0,16(sp)
    80005e20:	01813083          	ld	ra,24(sp)
    80005e24:	00813483          	ld	s1,8(sp)
    80005e28:	00013903          	ld	s2,0(sp)
    80005e2c:	00005517          	auipc	a0,0x5
    80005e30:	46c50513          	addi	a0,a0,1132 # 8000b298 <cons>
    80005e34:	02010113          	addi	sp,sp,32
    80005e38:	00001317          	auipc	t1,0x1
    80005e3c:	eb030067          	jr	-336(t1) # 80006ce8 <release>
    80005e40:	00a00493          	li	s1,10
    80005e44:	fc1ff06f          	j	80005e04 <consoleintr+0x50>

0000000080005e48 <consoleinit>:
    80005e48:	fe010113          	addi	sp,sp,-32
    80005e4c:	00113c23          	sd	ra,24(sp)
    80005e50:	00813823          	sd	s0,16(sp)
    80005e54:	00913423          	sd	s1,8(sp)
    80005e58:	02010413          	addi	s0,sp,32
    80005e5c:	00005497          	auipc	s1,0x5
    80005e60:	43c48493          	addi	s1,s1,1084 # 8000b298 <cons>
    80005e64:	00048513          	mv	a0,s1
    80005e68:	00002597          	auipc	a1,0x2
    80005e6c:	3e058593          	addi	a1,a1,992 # 80008248 <CONSOLE_STATUS+0x230>
    80005e70:	00001097          	auipc	ra,0x1
    80005e74:	d88080e7          	jalr	-632(ra) # 80006bf8 <initlock>
    80005e78:	00000097          	auipc	ra,0x0
    80005e7c:	7ac080e7          	jalr	1964(ra) # 80006624 <uartinit>
    80005e80:	01813083          	ld	ra,24(sp)
    80005e84:	01013403          	ld	s0,16(sp)
    80005e88:	00000797          	auipc	a5,0x0
    80005e8c:	d9c78793          	addi	a5,a5,-612 # 80005c24 <consoleread>
    80005e90:	0af4bc23          	sd	a5,184(s1)
    80005e94:	00000797          	auipc	a5,0x0
    80005e98:	cec78793          	addi	a5,a5,-788 # 80005b80 <consolewrite>
    80005e9c:	0cf4b023          	sd	a5,192(s1)
    80005ea0:	00813483          	ld	s1,8(sp)
    80005ea4:	02010113          	addi	sp,sp,32
    80005ea8:	00008067          	ret

0000000080005eac <console_read>:
    80005eac:	ff010113          	addi	sp,sp,-16
    80005eb0:	00813423          	sd	s0,8(sp)
    80005eb4:	01010413          	addi	s0,sp,16
    80005eb8:	00813403          	ld	s0,8(sp)
    80005ebc:	00005317          	auipc	t1,0x5
    80005ec0:	49433303          	ld	t1,1172(t1) # 8000b350 <devsw+0x10>
    80005ec4:	01010113          	addi	sp,sp,16
    80005ec8:	00030067          	jr	t1

0000000080005ecc <console_write>:
    80005ecc:	ff010113          	addi	sp,sp,-16
    80005ed0:	00813423          	sd	s0,8(sp)
    80005ed4:	01010413          	addi	s0,sp,16
    80005ed8:	00813403          	ld	s0,8(sp)
    80005edc:	00005317          	auipc	t1,0x5
    80005ee0:	47c33303          	ld	t1,1148(t1) # 8000b358 <devsw+0x18>
    80005ee4:	01010113          	addi	sp,sp,16
    80005ee8:	00030067          	jr	t1

0000000080005eec <panic>:
    80005eec:	fe010113          	addi	sp,sp,-32
    80005ef0:	00113c23          	sd	ra,24(sp)
    80005ef4:	00813823          	sd	s0,16(sp)
    80005ef8:	00913423          	sd	s1,8(sp)
    80005efc:	02010413          	addi	s0,sp,32
    80005f00:	00050493          	mv	s1,a0
    80005f04:	00002517          	auipc	a0,0x2
    80005f08:	34c50513          	addi	a0,a0,844 # 80008250 <CONSOLE_STATUS+0x238>
    80005f0c:	00005797          	auipc	a5,0x5
    80005f10:	4e07a623          	sw	zero,1260(a5) # 8000b3f8 <pr+0x18>
    80005f14:	00000097          	auipc	ra,0x0
    80005f18:	034080e7          	jalr	52(ra) # 80005f48 <__printf>
    80005f1c:	00048513          	mv	a0,s1
    80005f20:	00000097          	auipc	ra,0x0
    80005f24:	028080e7          	jalr	40(ra) # 80005f48 <__printf>
    80005f28:	00002517          	auipc	a0,0x2
    80005f2c:	13050513          	addi	a0,a0,304 # 80008058 <CONSOLE_STATUS+0x40>
    80005f30:	00000097          	auipc	ra,0x0
    80005f34:	018080e7          	jalr	24(ra) # 80005f48 <__printf>
    80005f38:	00100793          	li	a5,1
    80005f3c:	00004717          	auipc	a4,0x4
    80005f40:	1cf72e23          	sw	a5,476(a4) # 8000a118 <panicked>
    80005f44:	0000006f          	j	80005f44 <panic+0x58>

0000000080005f48 <__printf>:
    80005f48:	f3010113          	addi	sp,sp,-208
    80005f4c:	08813023          	sd	s0,128(sp)
    80005f50:	07313423          	sd	s3,104(sp)
    80005f54:	09010413          	addi	s0,sp,144
    80005f58:	05813023          	sd	s8,64(sp)
    80005f5c:	08113423          	sd	ra,136(sp)
    80005f60:	06913c23          	sd	s1,120(sp)
    80005f64:	07213823          	sd	s2,112(sp)
    80005f68:	07413023          	sd	s4,96(sp)
    80005f6c:	05513c23          	sd	s5,88(sp)
    80005f70:	05613823          	sd	s6,80(sp)
    80005f74:	05713423          	sd	s7,72(sp)
    80005f78:	03913c23          	sd	s9,56(sp)
    80005f7c:	03a13823          	sd	s10,48(sp)
    80005f80:	03b13423          	sd	s11,40(sp)
    80005f84:	00005317          	auipc	t1,0x5
    80005f88:	45c30313          	addi	t1,t1,1116 # 8000b3e0 <pr>
    80005f8c:	01832c03          	lw	s8,24(t1)
    80005f90:	00b43423          	sd	a1,8(s0)
    80005f94:	00c43823          	sd	a2,16(s0)
    80005f98:	00d43c23          	sd	a3,24(s0)
    80005f9c:	02e43023          	sd	a4,32(s0)
    80005fa0:	02f43423          	sd	a5,40(s0)
    80005fa4:	03043823          	sd	a6,48(s0)
    80005fa8:	03143c23          	sd	a7,56(s0)
    80005fac:	00050993          	mv	s3,a0
    80005fb0:	4a0c1663          	bnez	s8,8000645c <__printf+0x514>
    80005fb4:	60098c63          	beqz	s3,800065cc <__printf+0x684>
    80005fb8:	0009c503          	lbu	a0,0(s3)
    80005fbc:	00840793          	addi	a5,s0,8
    80005fc0:	f6f43c23          	sd	a5,-136(s0)
    80005fc4:	00000493          	li	s1,0
    80005fc8:	22050063          	beqz	a0,800061e8 <__printf+0x2a0>
    80005fcc:	00002a37          	lui	s4,0x2
    80005fd0:	00018ab7          	lui	s5,0x18
    80005fd4:	000f4b37          	lui	s6,0xf4
    80005fd8:	00989bb7          	lui	s7,0x989
    80005fdc:	70fa0a13          	addi	s4,s4,1807 # 270f <_entry-0x7fffd8f1>
    80005fe0:	69fa8a93          	addi	s5,s5,1695 # 1869f <_entry-0x7ffe7961>
    80005fe4:	23fb0b13          	addi	s6,s6,575 # f423f <_entry-0x7ff0bdc1>
    80005fe8:	67fb8b93          	addi	s7,s7,1663 # 98967f <_entry-0x7f676981>
    80005fec:	00148c9b          	addiw	s9,s1,1
    80005ff0:	02500793          	li	a5,37
    80005ff4:	01998933          	add	s2,s3,s9
    80005ff8:	38f51263          	bne	a0,a5,8000637c <__printf+0x434>
    80005ffc:	00094783          	lbu	a5,0(s2)
    80006000:	00078c9b          	sext.w	s9,a5
    80006004:	1e078263          	beqz	a5,800061e8 <__printf+0x2a0>
    80006008:	0024849b          	addiw	s1,s1,2
    8000600c:	07000713          	li	a4,112
    80006010:	00998933          	add	s2,s3,s1
    80006014:	38e78a63          	beq	a5,a4,800063a8 <__printf+0x460>
    80006018:	20f76863          	bltu	a4,a5,80006228 <__printf+0x2e0>
    8000601c:	42a78863          	beq	a5,a0,8000644c <__printf+0x504>
    80006020:	06400713          	li	a4,100
    80006024:	40e79663          	bne	a5,a4,80006430 <__printf+0x4e8>
    80006028:	f7843783          	ld	a5,-136(s0)
    8000602c:	0007a603          	lw	a2,0(a5)
    80006030:	00878793          	addi	a5,a5,8
    80006034:	f6f43c23          	sd	a5,-136(s0)
    80006038:	42064a63          	bltz	a2,8000646c <__printf+0x524>
    8000603c:	00a00713          	li	a4,10
    80006040:	02e677bb          	remuw	a5,a2,a4
    80006044:	00002d97          	auipc	s11,0x2
    80006048:	234d8d93          	addi	s11,s11,564 # 80008278 <digits>
    8000604c:	00900593          	li	a1,9
    80006050:	0006051b          	sext.w	a0,a2
    80006054:	00000c93          	li	s9,0
    80006058:	02079793          	slli	a5,a5,0x20
    8000605c:	0207d793          	srli	a5,a5,0x20
    80006060:	00fd87b3          	add	a5,s11,a5
    80006064:	0007c783          	lbu	a5,0(a5)
    80006068:	02e656bb          	divuw	a3,a2,a4
    8000606c:	f8f40023          	sb	a5,-128(s0)
    80006070:	14c5d863          	bge	a1,a2,800061c0 <__printf+0x278>
    80006074:	06300593          	li	a1,99
    80006078:	00100c93          	li	s9,1
    8000607c:	02e6f7bb          	remuw	a5,a3,a4
    80006080:	02079793          	slli	a5,a5,0x20
    80006084:	0207d793          	srli	a5,a5,0x20
    80006088:	00fd87b3          	add	a5,s11,a5
    8000608c:	0007c783          	lbu	a5,0(a5)
    80006090:	02e6d73b          	divuw	a4,a3,a4
    80006094:	f8f400a3          	sb	a5,-127(s0)
    80006098:	12a5f463          	bgeu	a1,a0,800061c0 <__printf+0x278>
    8000609c:	00a00693          	li	a3,10
    800060a0:	00900593          	li	a1,9
    800060a4:	02d777bb          	remuw	a5,a4,a3
    800060a8:	02079793          	slli	a5,a5,0x20
    800060ac:	0207d793          	srli	a5,a5,0x20
    800060b0:	00fd87b3          	add	a5,s11,a5
    800060b4:	0007c503          	lbu	a0,0(a5)
    800060b8:	02d757bb          	divuw	a5,a4,a3
    800060bc:	f8a40123          	sb	a0,-126(s0)
    800060c0:	48e5f263          	bgeu	a1,a4,80006544 <__printf+0x5fc>
    800060c4:	06300513          	li	a0,99
    800060c8:	02d7f5bb          	remuw	a1,a5,a3
    800060cc:	02059593          	slli	a1,a1,0x20
    800060d0:	0205d593          	srli	a1,a1,0x20
    800060d4:	00bd85b3          	add	a1,s11,a1
    800060d8:	0005c583          	lbu	a1,0(a1)
    800060dc:	02d7d7bb          	divuw	a5,a5,a3
    800060e0:	f8b401a3          	sb	a1,-125(s0)
    800060e4:	48e57263          	bgeu	a0,a4,80006568 <__printf+0x620>
    800060e8:	3e700513          	li	a0,999
    800060ec:	02d7f5bb          	remuw	a1,a5,a3
    800060f0:	02059593          	slli	a1,a1,0x20
    800060f4:	0205d593          	srli	a1,a1,0x20
    800060f8:	00bd85b3          	add	a1,s11,a1
    800060fc:	0005c583          	lbu	a1,0(a1)
    80006100:	02d7d7bb          	divuw	a5,a5,a3
    80006104:	f8b40223          	sb	a1,-124(s0)
    80006108:	46e57663          	bgeu	a0,a4,80006574 <__printf+0x62c>
    8000610c:	02d7f5bb          	remuw	a1,a5,a3
    80006110:	02059593          	slli	a1,a1,0x20
    80006114:	0205d593          	srli	a1,a1,0x20
    80006118:	00bd85b3          	add	a1,s11,a1
    8000611c:	0005c583          	lbu	a1,0(a1)
    80006120:	02d7d7bb          	divuw	a5,a5,a3
    80006124:	f8b402a3          	sb	a1,-123(s0)
    80006128:	46ea7863          	bgeu	s4,a4,80006598 <__printf+0x650>
    8000612c:	02d7f5bb          	remuw	a1,a5,a3
    80006130:	02059593          	slli	a1,a1,0x20
    80006134:	0205d593          	srli	a1,a1,0x20
    80006138:	00bd85b3          	add	a1,s11,a1
    8000613c:	0005c583          	lbu	a1,0(a1)
    80006140:	02d7d7bb          	divuw	a5,a5,a3
    80006144:	f8b40323          	sb	a1,-122(s0)
    80006148:	3eeaf863          	bgeu	s5,a4,80006538 <__printf+0x5f0>
    8000614c:	02d7f5bb          	remuw	a1,a5,a3
    80006150:	02059593          	slli	a1,a1,0x20
    80006154:	0205d593          	srli	a1,a1,0x20
    80006158:	00bd85b3          	add	a1,s11,a1
    8000615c:	0005c583          	lbu	a1,0(a1)
    80006160:	02d7d7bb          	divuw	a5,a5,a3
    80006164:	f8b403a3          	sb	a1,-121(s0)
    80006168:	42eb7e63          	bgeu	s6,a4,800065a4 <__printf+0x65c>
    8000616c:	02d7f5bb          	remuw	a1,a5,a3
    80006170:	02059593          	slli	a1,a1,0x20
    80006174:	0205d593          	srli	a1,a1,0x20
    80006178:	00bd85b3          	add	a1,s11,a1
    8000617c:	0005c583          	lbu	a1,0(a1)
    80006180:	02d7d7bb          	divuw	a5,a5,a3
    80006184:	f8b40423          	sb	a1,-120(s0)
    80006188:	42ebfc63          	bgeu	s7,a4,800065c0 <__printf+0x678>
    8000618c:	02079793          	slli	a5,a5,0x20
    80006190:	0207d793          	srli	a5,a5,0x20
    80006194:	00fd8db3          	add	s11,s11,a5
    80006198:	000dc703          	lbu	a4,0(s11)
    8000619c:	00a00793          	li	a5,10
    800061a0:	00900c93          	li	s9,9
    800061a4:	f8e404a3          	sb	a4,-119(s0)
    800061a8:	00065c63          	bgez	a2,800061c0 <__printf+0x278>
    800061ac:	f9040713          	addi	a4,s0,-112
    800061b0:	00f70733          	add	a4,a4,a5
    800061b4:	02d00693          	li	a3,45
    800061b8:	fed70823          	sb	a3,-16(a4)
    800061bc:	00078c93          	mv	s9,a5
    800061c0:	f8040793          	addi	a5,s0,-128
    800061c4:	01978cb3          	add	s9,a5,s9
    800061c8:	f7f40d13          	addi	s10,s0,-129
    800061cc:	000cc503          	lbu	a0,0(s9)
    800061d0:	fffc8c93          	addi	s9,s9,-1
    800061d4:	00000097          	auipc	ra,0x0
    800061d8:	b90080e7          	jalr	-1136(ra) # 80005d64 <consputc>
    800061dc:	ffac98e3          	bne	s9,s10,800061cc <__printf+0x284>
    800061e0:	00094503          	lbu	a0,0(s2)
    800061e4:	e00514e3          	bnez	a0,80005fec <__printf+0xa4>
    800061e8:	1a0c1663          	bnez	s8,80006394 <__printf+0x44c>
    800061ec:	08813083          	ld	ra,136(sp)
    800061f0:	08013403          	ld	s0,128(sp)
    800061f4:	07813483          	ld	s1,120(sp)
    800061f8:	07013903          	ld	s2,112(sp)
    800061fc:	06813983          	ld	s3,104(sp)
    80006200:	06013a03          	ld	s4,96(sp)
    80006204:	05813a83          	ld	s5,88(sp)
    80006208:	05013b03          	ld	s6,80(sp)
    8000620c:	04813b83          	ld	s7,72(sp)
    80006210:	04013c03          	ld	s8,64(sp)
    80006214:	03813c83          	ld	s9,56(sp)
    80006218:	03013d03          	ld	s10,48(sp)
    8000621c:	02813d83          	ld	s11,40(sp)
    80006220:	0d010113          	addi	sp,sp,208
    80006224:	00008067          	ret
    80006228:	07300713          	li	a4,115
    8000622c:	1ce78a63          	beq	a5,a4,80006400 <__printf+0x4b8>
    80006230:	07800713          	li	a4,120
    80006234:	1ee79e63          	bne	a5,a4,80006430 <__printf+0x4e8>
    80006238:	f7843783          	ld	a5,-136(s0)
    8000623c:	0007a703          	lw	a4,0(a5)
    80006240:	00878793          	addi	a5,a5,8
    80006244:	f6f43c23          	sd	a5,-136(s0)
    80006248:	28074263          	bltz	a4,800064cc <__printf+0x584>
    8000624c:	00002d97          	auipc	s11,0x2
    80006250:	02cd8d93          	addi	s11,s11,44 # 80008278 <digits>
    80006254:	00f77793          	andi	a5,a4,15
    80006258:	00fd87b3          	add	a5,s11,a5
    8000625c:	0007c683          	lbu	a3,0(a5)
    80006260:	00f00613          	li	a2,15
    80006264:	0007079b          	sext.w	a5,a4
    80006268:	f8d40023          	sb	a3,-128(s0)
    8000626c:	0047559b          	srliw	a1,a4,0x4
    80006270:	0047569b          	srliw	a3,a4,0x4
    80006274:	00000c93          	li	s9,0
    80006278:	0ee65063          	bge	a2,a4,80006358 <__printf+0x410>
    8000627c:	00f6f693          	andi	a3,a3,15
    80006280:	00dd86b3          	add	a3,s11,a3
    80006284:	0006c683          	lbu	a3,0(a3) # 2004000 <_entry-0x7dffc000>
    80006288:	0087d79b          	srliw	a5,a5,0x8
    8000628c:	00100c93          	li	s9,1
    80006290:	f8d400a3          	sb	a3,-127(s0)
    80006294:	0cb67263          	bgeu	a2,a1,80006358 <__printf+0x410>
    80006298:	00f7f693          	andi	a3,a5,15
    8000629c:	00dd86b3          	add	a3,s11,a3
    800062a0:	0006c583          	lbu	a1,0(a3)
    800062a4:	00f00613          	li	a2,15
    800062a8:	0047d69b          	srliw	a3,a5,0x4
    800062ac:	f8b40123          	sb	a1,-126(s0)
    800062b0:	0047d593          	srli	a1,a5,0x4
    800062b4:	28f67e63          	bgeu	a2,a5,80006550 <__printf+0x608>
    800062b8:	00f6f693          	andi	a3,a3,15
    800062bc:	00dd86b3          	add	a3,s11,a3
    800062c0:	0006c503          	lbu	a0,0(a3)
    800062c4:	0087d813          	srli	a6,a5,0x8
    800062c8:	0087d69b          	srliw	a3,a5,0x8
    800062cc:	f8a401a3          	sb	a0,-125(s0)
    800062d0:	28b67663          	bgeu	a2,a1,8000655c <__printf+0x614>
    800062d4:	00f6f693          	andi	a3,a3,15
    800062d8:	00dd86b3          	add	a3,s11,a3
    800062dc:	0006c583          	lbu	a1,0(a3)
    800062e0:	00c7d513          	srli	a0,a5,0xc
    800062e4:	00c7d69b          	srliw	a3,a5,0xc
    800062e8:	f8b40223          	sb	a1,-124(s0)
    800062ec:	29067a63          	bgeu	a2,a6,80006580 <__printf+0x638>
    800062f0:	00f6f693          	andi	a3,a3,15
    800062f4:	00dd86b3          	add	a3,s11,a3
    800062f8:	0006c583          	lbu	a1,0(a3)
    800062fc:	0107d813          	srli	a6,a5,0x10
    80006300:	0107d69b          	srliw	a3,a5,0x10
    80006304:	f8b402a3          	sb	a1,-123(s0)
    80006308:	28a67263          	bgeu	a2,a0,8000658c <__printf+0x644>
    8000630c:	00f6f693          	andi	a3,a3,15
    80006310:	00dd86b3          	add	a3,s11,a3
    80006314:	0006c683          	lbu	a3,0(a3)
    80006318:	0147d79b          	srliw	a5,a5,0x14
    8000631c:	f8d40323          	sb	a3,-122(s0)
    80006320:	21067663          	bgeu	a2,a6,8000652c <__printf+0x5e4>
    80006324:	02079793          	slli	a5,a5,0x20
    80006328:	0207d793          	srli	a5,a5,0x20
    8000632c:	00fd8db3          	add	s11,s11,a5
    80006330:	000dc683          	lbu	a3,0(s11)
    80006334:	00800793          	li	a5,8
    80006338:	00700c93          	li	s9,7
    8000633c:	f8d403a3          	sb	a3,-121(s0)
    80006340:	00075c63          	bgez	a4,80006358 <__printf+0x410>
    80006344:	f9040713          	addi	a4,s0,-112
    80006348:	00f70733          	add	a4,a4,a5
    8000634c:	02d00693          	li	a3,45
    80006350:	fed70823          	sb	a3,-16(a4)
    80006354:	00078c93          	mv	s9,a5
    80006358:	f8040793          	addi	a5,s0,-128
    8000635c:	01978cb3          	add	s9,a5,s9
    80006360:	f7f40d13          	addi	s10,s0,-129
    80006364:	000cc503          	lbu	a0,0(s9)
    80006368:	fffc8c93          	addi	s9,s9,-1
    8000636c:	00000097          	auipc	ra,0x0
    80006370:	9f8080e7          	jalr	-1544(ra) # 80005d64 <consputc>
    80006374:	ff9d18e3          	bne	s10,s9,80006364 <__printf+0x41c>
    80006378:	0100006f          	j	80006388 <__printf+0x440>
    8000637c:	00000097          	auipc	ra,0x0
    80006380:	9e8080e7          	jalr	-1560(ra) # 80005d64 <consputc>
    80006384:	000c8493          	mv	s1,s9
    80006388:	00094503          	lbu	a0,0(s2)
    8000638c:	c60510e3          	bnez	a0,80005fec <__printf+0xa4>
    80006390:	e40c0ee3          	beqz	s8,800061ec <__printf+0x2a4>
    80006394:	00005517          	auipc	a0,0x5
    80006398:	04c50513          	addi	a0,a0,76 # 8000b3e0 <pr>
    8000639c:	00001097          	auipc	ra,0x1
    800063a0:	94c080e7          	jalr	-1716(ra) # 80006ce8 <release>
    800063a4:	e49ff06f          	j	800061ec <__printf+0x2a4>
    800063a8:	f7843783          	ld	a5,-136(s0)
    800063ac:	03000513          	li	a0,48
    800063b0:	01000d13          	li	s10,16
    800063b4:	00878713          	addi	a4,a5,8
    800063b8:	0007bc83          	ld	s9,0(a5)
    800063bc:	f6e43c23          	sd	a4,-136(s0)
    800063c0:	00000097          	auipc	ra,0x0
    800063c4:	9a4080e7          	jalr	-1628(ra) # 80005d64 <consputc>
    800063c8:	07800513          	li	a0,120
    800063cc:	00000097          	auipc	ra,0x0
    800063d0:	998080e7          	jalr	-1640(ra) # 80005d64 <consputc>
    800063d4:	00002d97          	auipc	s11,0x2
    800063d8:	ea4d8d93          	addi	s11,s11,-348 # 80008278 <digits>
    800063dc:	03ccd793          	srli	a5,s9,0x3c
    800063e0:	00fd87b3          	add	a5,s11,a5
    800063e4:	0007c503          	lbu	a0,0(a5)
    800063e8:	fffd0d1b          	addiw	s10,s10,-1
    800063ec:	004c9c93          	slli	s9,s9,0x4
    800063f0:	00000097          	auipc	ra,0x0
    800063f4:	974080e7          	jalr	-1676(ra) # 80005d64 <consputc>
    800063f8:	fe0d12e3          	bnez	s10,800063dc <__printf+0x494>
    800063fc:	f8dff06f          	j	80006388 <__printf+0x440>
    80006400:	f7843783          	ld	a5,-136(s0)
    80006404:	0007bc83          	ld	s9,0(a5)
    80006408:	00878793          	addi	a5,a5,8
    8000640c:	f6f43c23          	sd	a5,-136(s0)
    80006410:	000c9a63          	bnez	s9,80006424 <__printf+0x4dc>
    80006414:	1080006f          	j	8000651c <__printf+0x5d4>
    80006418:	001c8c93          	addi	s9,s9,1
    8000641c:	00000097          	auipc	ra,0x0
    80006420:	948080e7          	jalr	-1720(ra) # 80005d64 <consputc>
    80006424:	000cc503          	lbu	a0,0(s9)
    80006428:	fe0518e3          	bnez	a0,80006418 <__printf+0x4d0>
    8000642c:	f5dff06f          	j	80006388 <__printf+0x440>
    80006430:	02500513          	li	a0,37
    80006434:	00000097          	auipc	ra,0x0
    80006438:	930080e7          	jalr	-1744(ra) # 80005d64 <consputc>
    8000643c:	000c8513          	mv	a0,s9
    80006440:	00000097          	auipc	ra,0x0
    80006444:	924080e7          	jalr	-1756(ra) # 80005d64 <consputc>
    80006448:	f41ff06f          	j	80006388 <__printf+0x440>
    8000644c:	02500513          	li	a0,37
    80006450:	00000097          	auipc	ra,0x0
    80006454:	914080e7          	jalr	-1772(ra) # 80005d64 <consputc>
    80006458:	f31ff06f          	j	80006388 <__printf+0x440>
    8000645c:	00030513          	mv	a0,t1
    80006460:	00000097          	auipc	ra,0x0
    80006464:	7bc080e7          	jalr	1980(ra) # 80006c1c <acquire>
    80006468:	b4dff06f          	j	80005fb4 <__printf+0x6c>
    8000646c:	40c0053b          	negw	a0,a2
    80006470:	00a00713          	li	a4,10
    80006474:	02e576bb          	remuw	a3,a0,a4
    80006478:	00002d97          	auipc	s11,0x2
    8000647c:	e00d8d93          	addi	s11,s11,-512 # 80008278 <digits>
    80006480:	ff700593          	li	a1,-9
    80006484:	02069693          	slli	a3,a3,0x20
    80006488:	0206d693          	srli	a3,a3,0x20
    8000648c:	00dd86b3          	add	a3,s11,a3
    80006490:	0006c683          	lbu	a3,0(a3)
    80006494:	02e557bb          	divuw	a5,a0,a4
    80006498:	f8d40023          	sb	a3,-128(s0)
    8000649c:	10b65e63          	bge	a2,a1,800065b8 <__printf+0x670>
    800064a0:	06300593          	li	a1,99
    800064a4:	02e7f6bb          	remuw	a3,a5,a4
    800064a8:	02069693          	slli	a3,a3,0x20
    800064ac:	0206d693          	srli	a3,a3,0x20
    800064b0:	00dd86b3          	add	a3,s11,a3
    800064b4:	0006c683          	lbu	a3,0(a3)
    800064b8:	02e7d73b          	divuw	a4,a5,a4
    800064bc:	00200793          	li	a5,2
    800064c0:	f8d400a3          	sb	a3,-127(s0)
    800064c4:	bca5ece3          	bltu	a1,a0,8000609c <__printf+0x154>
    800064c8:	ce5ff06f          	j	800061ac <__printf+0x264>
    800064cc:	40e007bb          	negw	a5,a4
    800064d0:	00002d97          	auipc	s11,0x2
    800064d4:	da8d8d93          	addi	s11,s11,-600 # 80008278 <digits>
    800064d8:	00f7f693          	andi	a3,a5,15
    800064dc:	00dd86b3          	add	a3,s11,a3
    800064e0:	0006c583          	lbu	a1,0(a3)
    800064e4:	ff100613          	li	a2,-15
    800064e8:	0047d69b          	srliw	a3,a5,0x4
    800064ec:	f8b40023          	sb	a1,-128(s0)
    800064f0:	0047d59b          	srliw	a1,a5,0x4
    800064f4:	0ac75e63          	bge	a4,a2,800065b0 <__printf+0x668>
    800064f8:	00f6f693          	andi	a3,a3,15
    800064fc:	00dd86b3          	add	a3,s11,a3
    80006500:	0006c603          	lbu	a2,0(a3)
    80006504:	00f00693          	li	a3,15
    80006508:	0087d79b          	srliw	a5,a5,0x8
    8000650c:	f8c400a3          	sb	a2,-127(s0)
    80006510:	d8b6e4e3          	bltu	a3,a1,80006298 <__printf+0x350>
    80006514:	00200793          	li	a5,2
    80006518:	e2dff06f          	j	80006344 <__printf+0x3fc>
    8000651c:	00002c97          	auipc	s9,0x2
    80006520:	d3cc8c93          	addi	s9,s9,-708 # 80008258 <CONSOLE_STATUS+0x240>
    80006524:	02800513          	li	a0,40
    80006528:	ef1ff06f          	j	80006418 <__printf+0x4d0>
    8000652c:	00700793          	li	a5,7
    80006530:	00600c93          	li	s9,6
    80006534:	e0dff06f          	j	80006340 <__printf+0x3f8>
    80006538:	00700793          	li	a5,7
    8000653c:	00600c93          	li	s9,6
    80006540:	c69ff06f          	j	800061a8 <__printf+0x260>
    80006544:	00300793          	li	a5,3
    80006548:	00200c93          	li	s9,2
    8000654c:	c5dff06f          	j	800061a8 <__printf+0x260>
    80006550:	00300793          	li	a5,3
    80006554:	00200c93          	li	s9,2
    80006558:	de9ff06f          	j	80006340 <__printf+0x3f8>
    8000655c:	00400793          	li	a5,4
    80006560:	00300c93          	li	s9,3
    80006564:	dddff06f          	j	80006340 <__printf+0x3f8>
    80006568:	00400793          	li	a5,4
    8000656c:	00300c93          	li	s9,3
    80006570:	c39ff06f          	j	800061a8 <__printf+0x260>
    80006574:	00500793          	li	a5,5
    80006578:	00400c93          	li	s9,4
    8000657c:	c2dff06f          	j	800061a8 <__printf+0x260>
    80006580:	00500793          	li	a5,5
    80006584:	00400c93          	li	s9,4
    80006588:	db9ff06f          	j	80006340 <__printf+0x3f8>
    8000658c:	00600793          	li	a5,6
    80006590:	00500c93          	li	s9,5
    80006594:	dadff06f          	j	80006340 <__printf+0x3f8>
    80006598:	00600793          	li	a5,6
    8000659c:	00500c93          	li	s9,5
    800065a0:	c09ff06f          	j	800061a8 <__printf+0x260>
    800065a4:	00800793          	li	a5,8
    800065a8:	00700c93          	li	s9,7
    800065ac:	bfdff06f          	j	800061a8 <__printf+0x260>
    800065b0:	00100793          	li	a5,1
    800065b4:	d91ff06f          	j	80006344 <__printf+0x3fc>
    800065b8:	00100793          	li	a5,1
    800065bc:	bf1ff06f          	j	800061ac <__printf+0x264>
    800065c0:	00900793          	li	a5,9
    800065c4:	00800c93          	li	s9,8
    800065c8:	be1ff06f          	j	800061a8 <__printf+0x260>
    800065cc:	00002517          	auipc	a0,0x2
    800065d0:	c9450513          	addi	a0,a0,-876 # 80008260 <CONSOLE_STATUS+0x248>
    800065d4:	00000097          	auipc	ra,0x0
    800065d8:	918080e7          	jalr	-1768(ra) # 80005eec <panic>

00000000800065dc <printfinit>:
    800065dc:	fe010113          	addi	sp,sp,-32
    800065e0:	00813823          	sd	s0,16(sp)
    800065e4:	00913423          	sd	s1,8(sp)
    800065e8:	00113c23          	sd	ra,24(sp)
    800065ec:	02010413          	addi	s0,sp,32
    800065f0:	00005497          	auipc	s1,0x5
    800065f4:	df048493          	addi	s1,s1,-528 # 8000b3e0 <pr>
    800065f8:	00048513          	mv	a0,s1
    800065fc:	00002597          	auipc	a1,0x2
    80006600:	c7458593          	addi	a1,a1,-908 # 80008270 <CONSOLE_STATUS+0x258>
    80006604:	00000097          	auipc	ra,0x0
    80006608:	5f4080e7          	jalr	1524(ra) # 80006bf8 <initlock>
    8000660c:	01813083          	ld	ra,24(sp)
    80006610:	01013403          	ld	s0,16(sp)
    80006614:	0004ac23          	sw	zero,24(s1)
    80006618:	00813483          	ld	s1,8(sp)
    8000661c:	02010113          	addi	sp,sp,32
    80006620:	00008067          	ret

0000000080006624 <uartinit>:
    80006624:	ff010113          	addi	sp,sp,-16
    80006628:	00813423          	sd	s0,8(sp)
    8000662c:	01010413          	addi	s0,sp,16
    80006630:	100007b7          	lui	a5,0x10000
    80006634:	000780a3          	sb	zero,1(a5) # 10000001 <_entry-0x6fffffff>
    80006638:	f8000713          	li	a4,-128
    8000663c:	00e781a3          	sb	a4,3(a5)
    80006640:	00300713          	li	a4,3
    80006644:	00e78023          	sb	a4,0(a5)
    80006648:	000780a3          	sb	zero,1(a5)
    8000664c:	00e781a3          	sb	a4,3(a5)
    80006650:	00700693          	li	a3,7
    80006654:	00d78123          	sb	a3,2(a5)
    80006658:	00e780a3          	sb	a4,1(a5)
    8000665c:	00813403          	ld	s0,8(sp)
    80006660:	01010113          	addi	sp,sp,16
    80006664:	00008067          	ret

0000000080006668 <uartputc>:
    80006668:	00004797          	auipc	a5,0x4
    8000666c:	ab07a783          	lw	a5,-1360(a5) # 8000a118 <panicked>
    80006670:	00078463          	beqz	a5,80006678 <uartputc+0x10>
    80006674:	0000006f          	j	80006674 <uartputc+0xc>
    80006678:	fd010113          	addi	sp,sp,-48
    8000667c:	02813023          	sd	s0,32(sp)
    80006680:	00913c23          	sd	s1,24(sp)
    80006684:	01213823          	sd	s2,16(sp)
    80006688:	01313423          	sd	s3,8(sp)
    8000668c:	02113423          	sd	ra,40(sp)
    80006690:	03010413          	addi	s0,sp,48
    80006694:	00004917          	auipc	s2,0x4
    80006698:	a8c90913          	addi	s2,s2,-1396 # 8000a120 <uart_tx_r>
    8000669c:	00093783          	ld	a5,0(s2)
    800066a0:	00004497          	auipc	s1,0x4
    800066a4:	a8848493          	addi	s1,s1,-1400 # 8000a128 <uart_tx_w>
    800066a8:	0004b703          	ld	a4,0(s1)
    800066ac:	02078693          	addi	a3,a5,32
    800066b0:	00050993          	mv	s3,a0
    800066b4:	02e69c63          	bne	a3,a4,800066ec <uartputc+0x84>
    800066b8:	00001097          	auipc	ra,0x1
    800066bc:	834080e7          	jalr	-1996(ra) # 80006eec <push_on>
    800066c0:	00093783          	ld	a5,0(s2)
    800066c4:	0004b703          	ld	a4,0(s1)
    800066c8:	02078793          	addi	a5,a5,32
    800066cc:	00e79463          	bne	a5,a4,800066d4 <uartputc+0x6c>
    800066d0:	0000006f          	j	800066d0 <uartputc+0x68>
    800066d4:	00001097          	auipc	ra,0x1
    800066d8:	88c080e7          	jalr	-1908(ra) # 80006f60 <pop_on>
    800066dc:	00093783          	ld	a5,0(s2)
    800066e0:	0004b703          	ld	a4,0(s1)
    800066e4:	02078693          	addi	a3,a5,32
    800066e8:	fce688e3          	beq	a3,a4,800066b8 <uartputc+0x50>
    800066ec:	01f77693          	andi	a3,a4,31
    800066f0:	00005597          	auipc	a1,0x5
    800066f4:	d1058593          	addi	a1,a1,-752 # 8000b400 <uart_tx_buf>
    800066f8:	00d586b3          	add	a3,a1,a3
    800066fc:	00170713          	addi	a4,a4,1
    80006700:	01368023          	sb	s3,0(a3)
    80006704:	00e4b023          	sd	a4,0(s1)
    80006708:	10000637          	lui	a2,0x10000
    8000670c:	02f71063          	bne	a4,a5,8000672c <uartputc+0xc4>
    80006710:	0340006f          	j	80006744 <uartputc+0xdc>
    80006714:	00074703          	lbu	a4,0(a4)
    80006718:	00f93023          	sd	a5,0(s2)
    8000671c:	00e60023          	sb	a4,0(a2) # 10000000 <_entry-0x70000000>
    80006720:	00093783          	ld	a5,0(s2)
    80006724:	0004b703          	ld	a4,0(s1)
    80006728:	00f70e63          	beq	a4,a5,80006744 <uartputc+0xdc>
    8000672c:	00564683          	lbu	a3,5(a2)
    80006730:	01f7f713          	andi	a4,a5,31
    80006734:	00e58733          	add	a4,a1,a4
    80006738:	0206f693          	andi	a3,a3,32
    8000673c:	00178793          	addi	a5,a5,1
    80006740:	fc069ae3          	bnez	a3,80006714 <uartputc+0xac>
    80006744:	02813083          	ld	ra,40(sp)
    80006748:	02013403          	ld	s0,32(sp)
    8000674c:	01813483          	ld	s1,24(sp)
    80006750:	01013903          	ld	s2,16(sp)
    80006754:	00813983          	ld	s3,8(sp)
    80006758:	03010113          	addi	sp,sp,48
    8000675c:	00008067          	ret

0000000080006760 <uartputc_sync>:
    80006760:	ff010113          	addi	sp,sp,-16
    80006764:	00813423          	sd	s0,8(sp)
    80006768:	01010413          	addi	s0,sp,16
    8000676c:	00004717          	auipc	a4,0x4
    80006770:	9ac72703          	lw	a4,-1620(a4) # 8000a118 <panicked>
    80006774:	02071663          	bnez	a4,800067a0 <uartputc_sync+0x40>
    80006778:	00050793          	mv	a5,a0
    8000677c:	100006b7          	lui	a3,0x10000
    80006780:	0056c703          	lbu	a4,5(a3) # 10000005 <_entry-0x6ffffffb>
    80006784:	02077713          	andi	a4,a4,32
    80006788:	fe070ce3          	beqz	a4,80006780 <uartputc_sync+0x20>
    8000678c:	0ff7f793          	andi	a5,a5,255
    80006790:	00f68023          	sb	a5,0(a3)
    80006794:	00813403          	ld	s0,8(sp)
    80006798:	01010113          	addi	sp,sp,16
    8000679c:	00008067          	ret
    800067a0:	0000006f          	j	800067a0 <uartputc_sync+0x40>

00000000800067a4 <uartstart>:
    800067a4:	ff010113          	addi	sp,sp,-16
    800067a8:	00813423          	sd	s0,8(sp)
    800067ac:	01010413          	addi	s0,sp,16
    800067b0:	00004617          	auipc	a2,0x4
    800067b4:	97060613          	addi	a2,a2,-1680 # 8000a120 <uart_tx_r>
    800067b8:	00004517          	auipc	a0,0x4
    800067bc:	97050513          	addi	a0,a0,-1680 # 8000a128 <uart_tx_w>
    800067c0:	00063783          	ld	a5,0(a2)
    800067c4:	00053703          	ld	a4,0(a0)
    800067c8:	04f70263          	beq	a4,a5,8000680c <uartstart+0x68>
    800067cc:	100005b7          	lui	a1,0x10000
    800067d0:	00005817          	auipc	a6,0x5
    800067d4:	c3080813          	addi	a6,a6,-976 # 8000b400 <uart_tx_buf>
    800067d8:	01c0006f          	j	800067f4 <uartstart+0x50>
    800067dc:	0006c703          	lbu	a4,0(a3)
    800067e0:	00f63023          	sd	a5,0(a2)
    800067e4:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    800067e8:	00063783          	ld	a5,0(a2)
    800067ec:	00053703          	ld	a4,0(a0)
    800067f0:	00f70e63          	beq	a4,a5,8000680c <uartstart+0x68>
    800067f4:	01f7f713          	andi	a4,a5,31
    800067f8:	00e806b3          	add	a3,a6,a4
    800067fc:	0055c703          	lbu	a4,5(a1)
    80006800:	00178793          	addi	a5,a5,1
    80006804:	02077713          	andi	a4,a4,32
    80006808:	fc071ae3          	bnez	a4,800067dc <uartstart+0x38>
    8000680c:	00813403          	ld	s0,8(sp)
    80006810:	01010113          	addi	sp,sp,16
    80006814:	00008067          	ret

0000000080006818 <uartgetc>:
    80006818:	ff010113          	addi	sp,sp,-16
    8000681c:	00813423          	sd	s0,8(sp)
    80006820:	01010413          	addi	s0,sp,16
    80006824:	10000737          	lui	a4,0x10000
    80006828:	00574783          	lbu	a5,5(a4) # 10000005 <_entry-0x6ffffffb>
    8000682c:	0017f793          	andi	a5,a5,1
    80006830:	00078c63          	beqz	a5,80006848 <uartgetc+0x30>
    80006834:	00074503          	lbu	a0,0(a4)
    80006838:	0ff57513          	andi	a0,a0,255
    8000683c:	00813403          	ld	s0,8(sp)
    80006840:	01010113          	addi	sp,sp,16
    80006844:	00008067          	ret
    80006848:	fff00513          	li	a0,-1
    8000684c:	ff1ff06f          	j	8000683c <uartgetc+0x24>

0000000080006850 <uartintr>:
    80006850:	100007b7          	lui	a5,0x10000
    80006854:	0057c783          	lbu	a5,5(a5) # 10000005 <_entry-0x6ffffffb>
    80006858:	0017f793          	andi	a5,a5,1
    8000685c:	0a078463          	beqz	a5,80006904 <uartintr+0xb4>
    80006860:	fe010113          	addi	sp,sp,-32
    80006864:	00813823          	sd	s0,16(sp)
    80006868:	00913423          	sd	s1,8(sp)
    8000686c:	00113c23          	sd	ra,24(sp)
    80006870:	02010413          	addi	s0,sp,32
    80006874:	100004b7          	lui	s1,0x10000
    80006878:	0004c503          	lbu	a0,0(s1) # 10000000 <_entry-0x70000000>
    8000687c:	0ff57513          	andi	a0,a0,255
    80006880:	fffff097          	auipc	ra,0xfffff
    80006884:	534080e7          	jalr	1332(ra) # 80005db4 <consoleintr>
    80006888:	0054c783          	lbu	a5,5(s1)
    8000688c:	0017f793          	andi	a5,a5,1
    80006890:	fe0794e3          	bnez	a5,80006878 <uartintr+0x28>
    80006894:	00004617          	auipc	a2,0x4
    80006898:	88c60613          	addi	a2,a2,-1908 # 8000a120 <uart_tx_r>
    8000689c:	00004517          	auipc	a0,0x4
    800068a0:	88c50513          	addi	a0,a0,-1908 # 8000a128 <uart_tx_w>
    800068a4:	00063783          	ld	a5,0(a2)
    800068a8:	00053703          	ld	a4,0(a0)
    800068ac:	04f70263          	beq	a4,a5,800068f0 <uartintr+0xa0>
    800068b0:	100005b7          	lui	a1,0x10000
    800068b4:	00005817          	auipc	a6,0x5
    800068b8:	b4c80813          	addi	a6,a6,-1204 # 8000b400 <uart_tx_buf>
    800068bc:	01c0006f          	j	800068d8 <uartintr+0x88>
    800068c0:	0006c703          	lbu	a4,0(a3)
    800068c4:	00f63023          	sd	a5,0(a2)
    800068c8:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    800068cc:	00063783          	ld	a5,0(a2)
    800068d0:	00053703          	ld	a4,0(a0)
    800068d4:	00f70e63          	beq	a4,a5,800068f0 <uartintr+0xa0>
    800068d8:	01f7f713          	andi	a4,a5,31
    800068dc:	00e806b3          	add	a3,a6,a4
    800068e0:	0055c703          	lbu	a4,5(a1)
    800068e4:	00178793          	addi	a5,a5,1
    800068e8:	02077713          	andi	a4,a4,32
    800068ec:	fc071ae3          	bnez	a4,800068c0 <uartintr+0x70>
    800068f0:	01813083          	ld	ra,24(sp)
    800068f4:	01013403          	ld	s0,16(sp)
    800068f8:	00813483          	ld	s1,8(sp)
    800068fc:	02010113          	addi	sp,sp,32
    80006900:	00008067          	ret
    80006904:	00004617          	auipc	a2,0x4
    80006908:	81c60613          	addi	a2,a2,-2020 # 8000a120 <uart_tx_r>
    8000690c:	00004517          	auipc	a0,0x4
    80006910:	81c50513          	addi	a0,a0,-2020 # 8000a128 <uart_tx_w>
    80006914:	00063783          	ld	a5,0(a2)
    80006918:	00053703          	ld	a4,0(a0)
    8000691c:	04f70263          	beq	a4,a5,80006960 <uartintr+0x110>
    80006920:	100005b7          	lui	a1,0x10000
    80006924:	00005817          	auipc	a6,0x5
    80006928:	adc80813          	addi	a6,a6,-1316 # 8000b400 <uart_tx_buf>
    8000692c:	01c0006f          	j	80006948 <uartintr+0xf8>
    80006930:	0006c703          	lbu	a4,0(a3)
    80006934:	00f63023          	sd	a5,0(a2)
    80006938:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    8000693c:	00063783          	ld	a5,0(a2)
    80006940:	00053703          	ld	a4,0(a0)
    80006944:	02f70063          	beq	a4,a5,80006964 <uartintr+0x114>
    80006948:	01f7f713          	andi	a4,a5,31
    8000694c:	00e806b3          	add	a3,a6,a4
    80006950:	0055c703          	lbu	a4,5(a1)
    80006954:	00178793          	addi	a5,a5,1
    80006958:	02077713          	andi	a4,a4,32
    8000695c:	fc071ae3          	bnez	a4,80006930 <uartintr+0xe0>
    80006960:	00008067          	ret
    80006964:	00008067          	ret

0000000080006968 <kinit>:
    80006968:	fc010113          	addi	sp,sp,-64
    8000696c:	02913423          	sd	s1,40(sp)
    80006970:	fffff7b7          	lui	a5,0xfffff
    80006974:	00006497          	auipc	s1,0x6
    80006978:	aab48493          	addi	s1,s1,-1365 # 8000c41f <end+0xfff>
    8000697c:	02813823          	sd	s0,48(sp)
    80006980:	01313c23          	sd	s3,24(sp)
    80006984:	00f4f4b3          	and	s1,s1,a5
    80006988:	02113c23          	sd	ra,56(sp)
    8000698c:	03213023          	sd	s2,32(sp)
    80006990:	01413823          	sd	s4,16(sp)
    80006994:	01513423          	sd	s5,8(sp)
    80006998:	04010413          	addi	s0,sp,64
    8000699c:	000017b7          	lui	a5,0x1
    800069a0:	01100993          	li	s3,17
    800069a4:	00f487b3          	add	a5,s1,a5
    800069a8:	01b99993          	slli	s3,s3,0x1b
    800069ac:	06f9e063          	bltu	s3,a5,80006a0c <kinit+0xa4>
    800069b0:	00005a97          	auipc	s5,0x5
    800069b4:	a70a8a93          	addi	s5,s5,-1424 # 8000b420 <end>
    800069b8:	0754ec63          	bltu	s1,s5,80006a30 <kinit+0xc8>
    800069bc:	0734fa63          	bgeu	s1,s3,80006a30 <kinit+0xc8>
    800069c0:	00088a37          	lui	s4,0x88
    800069c4:	fffa0a13          	addi	s4,s4,-1 # 87fff <_entry-0x7ff78001>
    800069c8:	00003917          	auipc	s2,0x3
    800069cc:	76890913          	addi	s2,s2,1896 # 8000a130 <kmem>
    800069d0:	00ca1a13          	slli	s4,s4,0xc
    800069d4:	0140006f          	j	800069e8 <kinit+0x80>
    800069d8:	000017b7          	lui	a5,0x1
    800069dc:	00f484b3          	add	s1,s1,a5
    800069e0:	0554e863          	bltu	s1,s5,80006a30 <kinit+0xc8>
    800069e4:	0534f663          	bgeu	s1,s3,80006a30 <kinit+0xc8>
    800069e8:	00001637          	lui	a2,0x1
    800069ec:	00100593          	li	a1,1
    800069f0:	00048513          	mv	a0,s1
    800069f4:	00000097          	auipc	ra,0x0
    800069f8:	5e4080e7          	jalr	1508(ra) # 80006fd8 <__memset>
    800069fc:	00093783          	ld	a5,0(s2)
    80006a00:	00f4b023          	sd	a5,0(s1)
    80006a04:	00993023          	sd	s1,0(s2)
    80006a08:	fd4498e3          	bne	s1,s4,800069d8 <kinit+0x70>
    80006a0c:	03813083          	ld	ra,56(sp)
    80006a10:	03013403          	ld	s0,48(sp)
    80006a14:	02813483          	ld	s1,40(sp)
    80006a18:	02013903          	ld	s2,32(sp)
    80006a1c:	01813983          	ld	s3,24(sp)
    80006a20:	01013a03          	ld	s4,16(sp)
    80006a24:	00813a83          	ld	s5,8(sp)
    80006a28:	04010113          	addi	sp,sp,64
    80006a2c:	00008067          	ret
    80006a30:	00002517          	auipc	a0,0x2
    80006a34:	86050513          	addi	a0,a0,-1952 # 80008290 <digits+0x18>
    80006a38:	fffff097          	auipc	ra,0xfffff
    80006a3c:	4b4080e7          	jalr	1204(ra) # 80005eec <panic>

0000000080006a40 <freerange>:
    80006a40:	fc010113          	addi	sp,sp,-64
    80006a44:	000017b7          	lui	a5,0x1
    80006a48:	02913423          	sd	s1,40(sp)
    80006a4c:	fff78493          	addi	s1,a5,-1 # fff <_entry-0x7ffff001>
    80006a50:	009504b3          	add	s1,a0,s1
    80006a54:	fffff537          	lui	a0,0xfffff
    80006a58:	02813823          	sd	s0,48(sp)
    80006a5c:	02113c23          	sd	ra,56(sp)
    80006a60:	03213023          	sd	s2,32(sp)
    80006a64:	01313c23          	sd	s3,24(sp)
    80006a68:	01413823          	sd	s4,16(sp)
    80006a6c:	01513423          	sd	s5,8(sp)
    80006a70:	01613023          	sd	s6,0(sp)
    80006a74:	04010413          	addi	s0,sp,64
    80006a78:	00a4f4b3          	and	s1,s1,a0
    80006a7c:	00f487b3          	add	a5,s1,a5
    80006a80:	06f5e463          	bltu	a1,a5,80006ae8 <freerange+0xa8>
    80006a84:	00005a97          	auipc	s5,0x5
    80006a88:	99ca8a93          	addi	s5,s5,-1636 # 8000b420 <end>
    80006a8c:	0954e263          	bltu	s1,s5,80006b10 <freerange+0xd0>
    80006a90:	01100993          	li	s3,17
    80006a94:	01b99993          	slli	s3,s3,0x1b
    80006a98:	0734fc63          	bgeu	s1,s3,80006b10 <freerange+0xd0>
    80006a9c:	00058a13          	mv	s4,a1
    80006aa0:	00003917          	auipc	s2,0x3
    80006aa4:	69090913          	addi	s2,s2,1680 # 8000a130 <kmem>
    80006aa8:	00002b37          	lui	s6,0x2
    80006aac:	0140006f          	j	80006ac0 <freerange+0x80>
    80006ab0:	000017b7          	lui	a5,0x1
    80006ab4:	00f484b3          	add	s1,s1,a5
    80006ab8:	0554ec63          	bltu	s1,s5,80006b10 <freerange+0xd0>
    80006abc:	0534fa63          	bgeu	s1,s3,80006b10 <freerange+0xd0>
    80006ac0:	00001637          	lui	a2,0x1
    80006ac4:	00100593          	li	a1,1
    80006ac8:	00048513          	mv	a0,s1
    80006acc:	00000097          	auipc	ra,0x0
    80006ad0:	50c080e7          	jalr	1292(ra) # 80006fd8 <__memset>
    80006ad4:	00093703          	ld	a4,0(s2)
    80006ad8:	016487b3          	add	a5,s1,s6
    80006adc:	00e4b023          	sd	a4,0(s1)
    80006ae0:	00993023          	sd	s1,0(s2)
    80006ae4:	fcfa76e3          	bgeu	s4,a5,80006ab0 <freerange+0x70>
    80006ae8:	03813083          	ld	ra,56(sp)
    80006aec:	03013403          	ld	s0,48(sp)
    80006af0:	02813483          	ld	s1,40(sp)
    80006af4:	02013903          	ld	s2,32(sp)
    80006af8:	01813983          	ld	s3,24(sp)
    80006afc:	01013a03          	ld	s4,16(sp)
    80006b00:	00813a83          	ld	s5,8(sp)
    80006b04:	00013b03          	ld	s6,0(sp)
    80006b08:	04010113          	addi	sp,sp,64
    80006b0c:	00008067          	ret
    80006b10:	00001517          	auipc	a0,0x1
    80006b14:	78050513          	addi	a0,a0,1920 # 80008290 <digits+0x18>
    80006b18:	fffff097          	auipc	ra,0xfffff
    80006b1c:	3d4080e7          	jalr	980(ra) # 80005eec <panic>

0000000080006b20 <kfree>:
    80006b20:	fe010113          	addi	sp,sp,-32
    80006b24:	00813823          	sd	s0,16(sp)
    80006b28:	00113c23          	sd	ra,24(sp)
    80006b2c:	00913423          	sd	s1,8(sp)
    80006b30:	02010413          	addi	s0,sp,32
    80006b34:	03451793          	slli	a5,a0,0x34
    80006b38:	04079c63          	bnez	a5,80006b90 <kfree+0x70>
    80006b3c:	00005797          	auipc	a5,0x5
    80006b40:	8e478793          	addi	a5,a5,-1820 # 8000b420 <end>
    80006b44:	00050493          	mv	s1,a0
    80006b48:	04f56463          	bltu	a0,a5,80006b90 <kfree+0x70>
    80006b4c:	01100793          	li	a5,17
    80006b50:	01b79793          	slli	a5,a5,0x1b
    80006b54:	02f57e63          	bgeu	a0,a5,80006b90 <kfree+0x70>
    80006b58:	00001637          	lui	a2,0x1
    80006b5c:	00100593          	li	a1,1
    80006b60:	00000097          	auipc	ra,0x0
    80006b64:	478080e7          	jalr	1144(ra) # 80006fd8 <__memset>
    80006b68:	00003797          	auipc	a5,0x3
    80006b6c:	5c878793          	addi	a5,a5,1480 # 8000a130 <kmem>
    80006b70:	0007b703          	ld	a4,0(a5)
    80006b74:	01813083          	ld	ra,24(sp)
    80006b78:	01013403          	ld	s0,16(sp)
    80006b7c:	00e4b023          	sd	a4,0(s1)
    80006b80:	0097b023          	sd	s1,0(a5)
    80006b84:	00813483          	ld	s1,8(sp)
    80006b88:	02010113          	addi	sp,sp,32
    80006b8c:	00008067          	ret
    80006b90:	00001517          	auipc	a0,0x1
    80006b94:	70050513          	addi	a0,a0,1792 # 80008290 <digits+0x18>
    80006b98:	fffff097          	auipc	ra,0xfffff
    80006b9c:	354080e7          	jalr	852(ra) # 80005eec <panic>

0000000080006ba0 <kalloc>:
    80006ba0:	fe010113          	addi	sp,sp,-32
    80006ba4:	00813823          	sd	s0,16(sp)
    80006ba8:	00913423          	sd	s1,8(sp)
    80006bac:	00113c23          	sd	ra,24(sp)
    80006bb0:	02010413          	addi	s0,sp,32
    80006bb4:	00003797          	auipc	a5,0x3
    80006bb8:	57c78793          	addi	a5,a5,1404 # 8000a130 <kmem>
    80006bbc:	0007b483          	ld	s1,0(a5)
    80006bc0:	02048063          	beqz	s1,80006be0 <kalloc+0x40>
    80006bc4:	0004b703          	ld	a4,0(s1)
    80006bc8:	00001637          	lui	a2,0x1
    80006bcc:	00500593          	li	a1,5
    80006bd0:	00048513          	mv	a0,s1
    80006bd4:	00e7b023          	sd	a4,0(a5)
    80006bd8:	00000097          	auipc	ra,0x0
    80006bdc:	400080e7          	jalr	1024(ra) # 80006fd8 <__memset>
    80006be0:	01813083          	ld	ra,24(sp)
    80006be4:	01013403          	ld	s0,16(sp)
    80006be8:	00048513          	mv	a0,s1
    80006bec:	00813483          	ld	s1,8(sp)
    80006bf0:	02010113          	addi	sp,sp,32
    80006bf4:	00008067          	ret

0000000080006bf8 <initlock>:
    80006bf8:	ff010113          	addi	sp,sp,-16
    80006bfc:	00813423          	sd	s0,8(sp)
    80006c00:	01010413          	addi	s0,sp,16
    80006c04:	00813403          	ld	s0,8(sp)
    80006c08:	00b53423          	sd	a1,8(a0)
    80006c0c:	00052023          	sw	zero,0(a0)
    80006c10:	00053823          	sd	zero,16(a0)
    80006c14:	01010113          	addi	sp,sp,16
    80006c18:	00008067          	ret

0000000080006c1c <acquire>:
    80006c1c:	fe010113          	addi	sp,sp,-32
    80006c20:	00813823          	sd	s0,16(sp)
    80006c24:	00913423          	sd	s1,8(sp)
    80006c28:	00113c23          	sd	ra,24(sp)
    80006c2c:	01213023          	sd	s2,0(sp)
    80006c30:	02010413          	addi	s0,sp,32
    80006c34:	00050493          	mv	s1,a0
    80006c38:	10002973          	csrr	s2,sstatus
    80006c3c:	100027f3          	csrr	a5,sstatus
    80006c40:	ffd7f793          	andi	a5,a5,-3
    80006c44:	10079073          	csrw	sstatus,a5
    80006c48:	fffff097          	auipc	ra,0xfffff
    80006c4c:	8ec080e7          	jalr	-1812(ra) # 80005534 <mycpu>
    80006c50:	07852783          	lw	a5,120(a0)
    80006c54:	06078e63          	beqz	a5,80006cd0 <acquire+0xb4>
    80006c58:	fffff097          	auipc	ra,0xfffff
    80006c5c:	8dc080e7          	jalr	-1828(ra) # 80005534 <mycpu>
    80006c60:	07852783          	lw	a5,120(a0)
    80006c64:	0004a703          	lw	a4,0(s1)
    80006c68:	0017879b          	addiw	a5,a5,1
    80006c6c:	06f52c23          	sw	a5,120(a0)
    80006c70:	04071063          	bnez	a4,80006cb0 <acquire+0x94>
    80006c74:	00100713          	li	a4,1
    80006c78:	00070793          	mv	a5,a4
    80006c7c:	0cf4a7af          	amoswap.w.aq	a5,a5,(s1)
    80006c80:	0007879b          	sext.w	a5,a5
    80006c84:	fe079ae3          	bnez	a5,80006c78 <acquire+0x5c>
    80006c88:	0ff0000f          	fence
    80006c8c:	fffff097          	auipc	ra,0xfffff
    80006c90:	8a8080e7          	jalr	-1880(ra) # 80005534 <mycpu>
    80006c94:	01813083          	ld	ra,24(sp)
    80006c98:	01013403          	ld	s0,16(sp)
    80006c9c:	00a4b823          	sd	a0,16(s1)
    80006ca0:	00013903          	ld	s2,0(sp)
    80006ca4:	00813483          	ld	s1,8(sp)
    80006ca8:	02010113          	addi	sp,sp,32
    80006cac:	00008067          	ret
    80006cb0:	0104b903          	ld	s2,16(s1)
    80006cb4:	fffff097          	auipc	ra,0xfffff
    80006cb8:	880080e7          	jalr	-1920(ra) # 80005534 <mycpu>
    80006cbc:	faa91ce3          	bne	s2,a0,80006c74 <acquire+0x58>
    80006cc0:	00001517          	auipc	a0,0x1
    80006cc4:	5d850513          	addi	a0,a0,1496 # 80008298 <digits+0x20>
    80006cc8:	fffff097          	auipc	ra,0xfffff
    80006ccc:	224080e7          	jalr	548(ra) # 80005eec <panic>
    80006cd0:	00195913          	srli	s2,s2,0x1
    80006cd4:	fffff097          	auipc	ra,0xfffff
    80006cd8:	860080e7          	jalr	-1952(ra) # 80005534 <mycpu>
    80006cdc:	00197913          	andi	s2,s2,1
    80006ce0:	07252e23          	sw	s2,124(a0)
    80006ce4:	f75ff06f          	j	80006c58 <acquire+0x3c>

0000000080006ce8 <release>:
    80006ce8:	fe010113          	addi	sp,sp,-32
    80006cec:	00813823          	sd	s0,16(sp)
    80006cf0:	00113c23          	sd	ra,24(sp)
    80006cf4:	00913423          	sd	s1,8(sp)
    80006cf8:	01213023          	sd	s2,0(sp)
    80006cfc:	02010413          	addi	s0,sp,32
    80006d00:	00052783          	lw	a5,0(a0)
    80006d04:	00079a63          	bnez	a5,80006d18 <release+0x30>
    80006d08:	00001517          	auipc	a0,0x1
    80006d0c:	59850513          	addi	a0,a0,1432 # 800082a0 <digits+0x28>
    80006d10:	fffff097          	auipc	ra,0xfffff
    80006d14:	1dc080e7          	jalr	476(ra) # 80005eec <panic>
    80006d18:	01053903          	ld	s2,16(a0)
    80006d1c:	00050493          	mv	s1,a0
    80006d20:	fffff097          	auipc	ra,0xfffff
    80006d24:	814080e7          	jalr	-2028(ra) # 80005534 <mycpu>
    80006d28:	fea910e3          	bne	s2,a0,80006d08 <release+0x20>
    80006d2c:	0004b823          	sd	zero,16(s1)
    80006d30:	0ff0000f          	fence
    80006d34:	0f50000f          	fence	iorw,ow
    80006d38:	0804a02f          	amoswap.w	zero,zero,(s1)
    80006d3c:	ffffe097          	auipc	ra,0xffffe
    80006d40:	7f8080e7          	jalr	2040(ra) # 80005534 <mycpu>
    80006d44:	100027f3          	csrr	a5,sstatus
    80006d48:	0027f793          	andi	a5,a5,2
    80006d4c:	04079a63          	bnez	a5,80006da0 <release+0xb8>
    80006d50:	07852783          	lw	a5,120(a0)
    80006d54:	02f05e63          	blez	a5,80006d90 <release+0xa8>
    80006d58:	fff7871b          	addiw	a4,a5,-1
    80006d5c:	06e52c23          	sw	a4,120(a0)
    80006d60:	00071c63          	bnez	a4,80006d78 <release+0x90>
    80006d64:	07c52783          	lw	a5,124(a0)
    80006d68:	00078863          	beqz	a5,80006d78 <release+0x90>
    80006d6c:	100027f3          	csrr	a5,sstatus
    80006d70:	0027e793          	ori	a5,a5,2
    80006d74:	10079073          	csrw	sstatus,a5
    80006d78:	01813083          	ld	ra,24(sp)
    80006d7c:	01013403          	ld	s0,16(sp)
    80006d80:	00813483          	ld	s1,8(sp)
    80006d84:	00013903          	ld	s2,0(sp)
    80006d88:	02010113          	addi	sp,sp,32
    80006d8c:	00008067          	ret
    80006d90:	00001517          	auipc	a0,0x1
    80006d94:	53050513          	addi	a0,a0,1328 # 800082c0 <digits+0x48>
    80006d98:	fffff097          	auipc	ra,0xfffff
    80006d9c:	154080e7          	jalr	340(ra) # 80005eec <panic>
    80006da0:	00001517          	auipc	a0,0x1
    80006da4:	50850513          	addi	a0,a0,1288 # 800082a8 <digits+0x30>
    80006da8:	fffff097          	auipc	ra,0xfffff
    80006dac:	144080e7          	jalr	324(ra) # 80005eec <panic>

0000000080006db0 <holding>:
    80006db0:	00052783          	lw	a5,0(a0)
    80006db4:	00079663          	bnez	a5,80006dc0 <holding+0x10>
    80006db8:	00000513          	li	a0,0
    80006dbc:	00008067          	ret
    80006dc0:	fe010113          	addi	sp,sp,-32
    80006dc4:	00813823          	sd	s0,16(sp)
    80006dc8:	00913423          	sd	s1,8(sp)
    80006dcc:	00113c23          	sd	ra,24(sp)
    80006dd0:	02010413          	addi	s0,sp,32
    80006dd4:	01053483          	ld	s1,16(a0)
    80006dd8:	ffffe097          	auipc	ra,0xffffe
    80006ddc:	75c080e7          	jalr	1884(ra) # 80005534 <mycpu>
    80006de0:	01813083          	ld	ra,24(sp)
    80006de4:	01013403          	ld	s0,16(sp)
    80006de8:	40a48533          	sub	a0,s1,a0
    80006dec:	00153513          	seqz	a0,a0
    80006df0:	00813483          	ld	s1,8(sp)
    80006df4:	02010113          	addi	sp,sp,32
    80006df8:	00008067          	ret

0000000080006dfc <push_off>:
    80006dfc:	fe010113          	addi	sp,sp,-32
    80006e00:	00813823          	sd	s0,16(sp)
    80006e04:	00113c23          	sd	ra,24(sp)
    80006e08:	00913423          	sd	s1,8(sp)
    80006e0c:	02010413          	addi	s0,sp,32
    80006e10:	100024f3          	csrr	s1,sstatus
    80006e14:	100027f3          	csrr	a5,sstatus
    80006e18:	ffd7f793          	andi	a5,a5,-3
    80006e1c:	10079073          	csrw	sstatus,a5
    80006e20:	ffffe097          	auipc	ra,0xffffe
    80006e24:	714080e7          	jalr	1812(ra) # 80005534 <mycpu>
    80006e28:	07852783          	lw	a5,120(a0)
    80006e2c:	02078663          	beqz	a5,80006e58 <push_off+0x5c>
    80006e30:	ffffe097          	auipc	ra,0xffffe
    80006e34:	704080e7          	jalr	1796(ra) # 80005534 <mycpu>
    80006e38:	07852783          	lw	a5,120(a0)
    80006e3c:	01813083          	ld	ra,24(sp)
    80006e40:	01013403          	ld	s0,16(sp)
    80006e44:	0017879b          	addiw	a5,a5,1
    80006e48:	06f52c23          	sw	a5,120(a0)
    80006e4c:	00813483          	ld	s1,8(sp)
    80006e50:	02010113          	addi	sp,sp,32
    80006e54:	00008067          	ret
    80006e58:	0014d493          	srli	s1,s1,0x1
    80006e5c:	ffffe097          	auipc	ra,0xffffe
    80006e60:	6d8080e7          	jalr	1752(ra) # 80005534 <mycpu>
    80006e64:	0014f493          	andi	s1,s1,1
    80006e68:	06952e23          	sw	s1,124(a0)
    80006e6c:	fc5ff06f          	j	80006e30 <push_off+0x34>

0000000080006e70 <pop_off>:
    80006e70:	ff010113          	addi	sp,sp,-16
    80006e74:	00813023          	sd	s0,0(sp)
    80006e78:	00113423          	sd	ra,8(sp)
    80006e7c:	01010413          	addi	s0,sp,16
    80006e80:	ffffe097          	auipc	ra,0xffffe
    80006e84:	6b4080e7          	jalr	1716(ra) # 80005534 <mycpu>
    80006e88:	100027f3          	csrr	a5,sstatus
    80006e8c:	0027f793          	andi	a5,a5,2
    80006e90:	04079663          	bnez	a5,80006edc <pop_off+0x6c>
    80006e94:	07852783          	lw	a5,120(a0)
    80006e98:	02f05a63          	blez	a5,80006ecc <pop_off+0x5c>
    80006e9c:	fff7871b          	addiw	a4,a5,-1
    80006ea0:	06e52c23          	sw	a4,120(a0)
    80006ea4:	00071c63          	bnez	a4,80006ebc <pop_off+0x4c>
    80006ea8:	07c52783          	lw	a5,124(a0)
    80006eac:	00078863          	beqz	a5,80006ebc <pop_off+0x4c>
    80006eb0:	100027f3          	csrr	a5,sstatus
    80006eb4:	0027e793          	ori	a5,a5,2
    80006eb8:	10079073          	csrw	sstatus,a5
    80006ebc:	00813083          	ld	ra,8(sp)
    80006ec0:	00013403          	ld	s0,0(sp)
    80006ec4:	01010113          	addi	sp,sp,16
    80006ec8:	00008067          	ret
    80006ecc:	00001517          	auipc	a0,0x1
    80006ed0:	3f450513          	addi	a0,a0,1012 # 800082c0 <digits+0x48>
    80006ed4:	fffff097          	auipc	ra,0xfffff
    80006ed8:	018080e7          	jalr	24(ra) # 80005eec <panic>
    80006edc:	00001517          	auipc	a0,0x1
    80006ee0:	3cc50513          	addi	a0,a0,972 # 800082a8 <digits+0x30>
    80006ee4:	fffff097          	auipc	ra,0xfffff
    80006ee8:	008080e7          	jalr	8(ra) # 80005eec <panic>

0000000080006eec <push_on>:
    80006eec:	fe010113          	addi	sp,sp,-32
    80006ef0:	00813823          	sd	s0,16(sp)
    80006ef4:	00113c23          	sd	ra,24(sp)
    80006ef8:	00913423          	sd	s1,8(sp)
    80006efc:	02010413          	addi	s0,sp,32
    80006f00:	100024f3          	csrr	s1,sstatus
    80006f04:	100027f3          	csrr	a5,sstatus
    80006f08:	0027e793          	ori	a5,a5,2
    80006f0c:	10079073          	csrw	sstatus,a5
    80006f10:	ffffe097          	auipc	ra,0xffffe
    80006f14:	624080e7          	jalr	1572(ra) # 80005534 <mycpu>
    80006f18:	07852783          	lw	a5,120(a0)
    80006f1c:	02078663          	beqz	a5,80006f48 <push_on+0x5c>
    80006f20:	ffffe097          	auipc	ra,0xffffe
    80006f24:	614080e7          	jalr	1556(ra) # 80005534 <mycpu>
    80006f28:	07852783          	lw	a5,120(a0)
    80006f2c:	01813083          	ld	ra,24(sp)
    80006f30:	01013403          	ld	s0,16(sp)
    80006f34:	0017879b          	addiw	a5,a5,1
    80006f38:	06f52c23          	sw	a5,120(a0)
    80006f3c:	00813483          	ld	s1,8(sp)
    80006f40:	02010113          	addi	sp,sp,32
    80006f44:	00008067          	ret
    80006f48:	0014d493          	srli	s1,s1,0x1
    80006f4c:	ffffe097          	auipc	ra,0xffffe
    80006f50:	5e8080e7          	jalr	1512(ra) # 80005534 <mycpu>
    80006f54:	0014f493          	andi	s1,s1,1
    80006f58:	06952e23          	sw	s1,124(a0)
    80006f5c:	fc5ff06f          	j	80006f20 <push_on+0x34>

0000000080006f60 <pop_on>:
    80006f60:	ff010113          	addi	sp,sp,-16
    80006f64:	00813023          	sd	s0,0(sp)
    80006f68:	00113423          	sd	ra,8(sp)
    80006f6c:	01010413          	addi	s0,sp,16
    80006f70:	ffffe097          	auipc	ra,0xffffe
    80006f74:	5c4080e7          	jalr	1476(ra) # 80005534 <mycpu>
    80006f78:	100027f3          	csrr	a5,sstatus
    80006f7c:	0027f793          	andi	a5,a5,2
    80006f80:	04078463          	beqz	a5,80006fc8 <pop_on+0x68>
    80006f84:	07852783          	lw	a5,120(a0)
    80006f88:	02f05863          	blez	a5,80006fb8 <pop_on+0x58>
    80006f8c:	fff7879b          	addiw	a5,a5,-1
    80006f90:	06f52c23          	sw	a5,120(a0)
    80006f94:	07853783          	ld	a5,120(a0)
    80006f98:	00079863          	bnez	a5,80006fa8 <pop_on+0x48>
    80006f9c:	100027f3          	csrr	a5,sstatus
    80006fa0:	ffd7f793          	andi	a5,a5,-3
    80006fa4:	10079073          	csrw	sstatus,a5
    80006fa8:	00813083          	ld	ra,8(sp)
    80006fac:	00013403          	ld	s0,0(sp)
    80006fb0:	01010113          	addi	sp,sp,16
    80006fb4:	00008067          	ret
    80006fb8:	00001517          	auipc	a0,0x1
    80006fbc:	33050513          	addi	a0,a0,816 # 800082e8 <digits+0x70>
    80006fc0:	fffff097          	auipc	ra,0xfffff
    80006fc4:	f2c080e7          	jalr	-212(ra) # 80005eec <panic>
    80006fc8:	00001517          	auipc	a0,0x1
    80006fcc:	30050513          	addi	a0,a0,768 # 800082c8 <digits+0x50>
    80006fd0:	fffff097          	auipc	ra,0xfffff
    80006fd4:	f1c080e7          	jalr	-228(ra) # 80005eec <panic>

0000000080006fd8 <__memset>:
    80006fd8:	ff010113          	addi	sp,sp,-16
    80006fdc:	00813423          	sd	s0,8(sp)
    80006fe0:	01010413          	addi	s0,sp,16
    80006fe4:	1a060e63          	beqz	a2,800071a0 <__memset+0x1c8>
    80006fe8:	40a007b3          	neg	a5,a0
    80006fec:	0077f793          	andi	a5,a5,7
    80006ff0:	00778693          	addi	a3,a5,7
    80006ff4:	00b00813          	li	a6,11
    80006ff8:	0ff5f593          	andi	a1,a1,255
    80006ffc:	fff6071b          	addiw	a4,a2,-1
    80007000:	1b06e663          	bltu	a3,a6,800071ac <__memset+0x1d4>
    80007004:	1cd76463          	bltu	a4,a3,800071cc <__memset+0x1f4>
    80007008:	1a078e63          	beqz	a5,800071c4 <__memset+0x1ec>
    8000700c:	00b50023          	sb	a1,0(a0)
    80007010:	00100713          	li	a4,1
    80007014:	1ae78463          	beq	a5,a4,800071bc <__memset+0x1e4>
    80007018:	00b500a3          	sb	a1,1(a0)
    8000701c:	00200713          	li	a4,2
    80007020:	1ae78a63          	beq	a5,a4,800071d4 <__memset+0x1fc>
    80007024:	00b50123          	sb	a1,2(a0)
    80007028:	00300713          	li	a4,3
    8000702c:	18e78463          	beq	a5,a4,800071b4 <__memset+0x1dc>
    80007030:	00b501a3          	sb	a1,3(a0)
    80007034:	00400713          	li	a4,4
    80007038:	1ae78263          	beq	a5,a4,800071dc <__memset+0x204>
    8000703c:	00b50223          	sb	a1,4(a0)
    80007040:	00500713          	li	a4,5
    80007044:	1ae78063          	beq	a5,a4,800071e4 <__memset+0x20c>
    80007048:	00b502a3          	sb	a1,5(a0)
    8000704c:	00700713          	li	a4,7
    80007050:	18e79e63          	bne	a5,a4,800071ec <__memset+0x214>
    80007054:	00b50323          	sb	a1,6(a0)
    80007058:	00700e93          	li	t4,7
    8000705c:	00859713          	slli	a4,a1,0x8
    80007060:	00e5e733          	or	a4,a1,a4
    80007064:	01059e13          	slli	t3,a1,0x10
    80007068:	01c76e33          	or	t3,a4,t3
    8000706c:	01859313          	slli	t1,a1,0x18
    80007070:	006e6333          	or	t1,t3,t1
    80007074:	02059893          	slli	a7,a1,0x20
    80007078:	40f60e3b          	subw	t3,a2,a5
    8000707c:	011368b3          	or	a7,t1,a7
    80007080:	02859813          	slli	a6,a1,0x28
    80007084:	0108e833          	or	a6,a7,a6
    80007088:	03059693          	slli	a3,a1,0x30
    8000708c:	003e589b          	srliw	a7,t3,0x3
    80007090:	00d866b3          	or	a3,a6,a3
    80007094:	03859713          	slli	a4,a1,0x38
    80007098:	00389813          	slli	a6,a7,0x3
    8000709c:	00f507b3          	add	a5,a0,a5
    800070a0:	00e6e733          	or	a4,a3,a4
    800070a4:	000e089b          	sext.w	a7,t3
    800070a8:	00f806b3          	add	a3,a6,a5
    800070ac:	00e7b023          	sd	a4,0(a5)
    800070b0:	00878793          	addi	a5,a5,8
    800070b4:	fed79ce3          	bne	a5,a3,800070ac <__memset+0xd4>
    800070b8:	ff8e7793          	andi	a5,t3,-8
    800070bc:	0007871b          	sext.w	a4,a5
    800070c0:	01d787bb          	addw	a5,a5,t4
    800070c4:	0ce88e63          	beq	a7,a4,800071a0 <__memset+0x1c8>
    800070c8:	00f50733          	add	a4,a0,a5
    800070cc:	00b70023          	sb	a1,0(a4)
    800070d0:	0017871b          	addiw	a4,a5,1
    800070d4:	0cc77663          	bgeu	a4,a2,800071a0 <__memset+0x1c8>
    800070d8:	00e50733          	add	a4,a0,a4
    800070dc:	00b70023          	sb	a1,0(a4)
    800070e0:	0027871b          	addiw	a4,a5,2
    800070e4:	0ac77e63          	bgeu	a4,a2,800071a0 <__memset+0x1c8>
    800070e8:	00e50733          	add	a4,a0,a4
    800070ec:	00b70023          	sb	a1,0(a4)
    800070f0:	0037871b          	addiw	a4,a5,3
    800070f4:	0ac77663          	bgeu	a4,a2,800071a0 <__memset+0x1c8>
    800070f8:	00e50733          	add	a4,a0,a4
    800070fc:	00b70023          	sb	a1,0(a4)
    80007100:	0047871b          	addiw	a4,a5,4
    80007104:	08c77e63          	bgeu	a4,a2,800071a0 <__memset+0x1c8>
    80007108:	00e50733          	add	a4,a0,a4
    8000710c:	00b70023          	sb	a1,0(a4)
    80007110:	0057871b          	addiw	a4,a5,5
    80007114:	08c77663          	bgeu	a4,a2,800071a0 <__memset+0x1c8>
    80007118:	00e50733          	add	a4,a0,a4
    8000711c:	00b70023          	sb	a1,0(a4)
    80007120:	0067871b          	addiw	a4,a5,6
    80007124:	06c77e63          	bgeu	a4,a2,800071a0 <__memset+0x1c8>
    80007128:	00e50733          	add	a4,a0,a4
    8000712c:	00b70023          	sb	a1,0(a4)
    80007130:	0077871b          	addiw	a4,a5,7
    80007134:	06c77663          	bgeu	a4,a2,800071a0 <__memset+0x1c8>
    80007138:	00e50733          	add	a4,a0,a4
    8000713c:	00b70023          	sb	a1,0(a4)
    80007140:	0087871b          	addiw	a4,a5,8
    80007144:	04c77e63          	bgeu	a4,a2,800071a0 <__memset+0x1c8>
    80007148:	00e50733          	add	a4,a0,a4
    8000714c:	00b70023          	sb	a1,0(a4)
    80007150:	0097871b          	addiw	a4,a5,9
    80007154:	04c77663          	bgeu	a4,a2,800071a0 <__memset+0x1c8>
    80007158:	00e50733          	add	a4,a0,a4
    8000715c:	00b70023          	sb	a1,0(a4)
    80007160:	00a7871b          	addiw	a4,a5,10
    80007164:	02c77e63          	bgeu	a4,a2,800071a0 <__memset+0x1c8>
    80007168:	00e50733          	add	a4,a0,a4
    8000716c:	00b70023          	sb	a1,0(a4)
    80007170:	00b7871b          	addiw	a4,a5,11
    80007174:	02c77663          	bgeu	a4,a2,800071a0 <__memset+0x1c8>
    80007178:	00e50733          	add	a4,a0,a4
    8000717c:	00b70023          	sb	a1,0(a4)
    80007180:	00c7871b          	addiw	a4,a5,12
    80007184:	00c77e63          	bgeu	a4,a2,800071a0 <__memset+0x1c8>
    80007188:	00e50733          	add	a4,a0,a4
    8000718c:	00b70023          	sb	a1,0(a4)
    80007190:	00d7879b          	addiw	a5,a5,13
    80007194:	00c7f663          	bgeu	a5,a2,800071a0 <__memset+0x1c8>
    80007198:	00f507b3          	add	a5,a0,a5
    8000719c:	00b78023          	sb	a1,0(a5)
    800071a0:	00813403          	ld	s0,8(sp)
    800071a4:	01010113          	addi	sp,sp,16
    800071a8:	00008067          	ret
    800071ac:	00b00693          	li	a3,11
    800071b0:	e55ff06f          	j	80007004 <__memset+0x2c>
    800071b4:	00300e93          	li	t4,3
    800071b8:	ea5ff06f          	j	8000705c <__memset+0x84>
    800071bc:	00100e93          	li	t4,1
    800071c0:	e9dff06f          	j	8000705c <__memset+0x84>
    800071c4:	00000e93          	li	t4,0
    800071c8:	e95ff06f          	j	8000705c <__memset+0x84>
    800071cc:	00000793          	li	a5,0
    800071d0:	ef9ff06f          	j	800070c8 <__memset+0xf0>
    800071d4:	00200e93          	li	t4,2
    800071d8:	e85ff06f          	j	8000705c <__memset+0x84>
    800071dc:	00400e93          	li	t4,4
    800071e0:	e7dff06f          	j	8000705c <__memset+0x84>
    800071e4:	00500e93          	li	t4,5
    800071e8:	e75ff06f          	j	8000705c <__memset+0x84>
    800071ec:	00600e93          	li	t4,6
    800071f0:	e6dff06f          	j	8000705c <__memset+0x84>

00000000800071f4 <__memmove>:
    800071f4:	ff010113          	addi	sp,sp,-16
    800071f8:	00813423          	sd	s0,8(sp)
    800071fc:	01010413          	addi	s0,sp,16
    80007200:	0e060863          	beqz	a2,800072f0 <__memmove+0xfc>
    80007204:	fff6069b          	addiw	a3,a2,-1
    80007208:	0006881b          	sext.w	a6,a3
    8000720c:	0ea5e863          	bltu	a1,a0,800072fc <__memmove+0x108>
    80007210:	00758713          	addi	a4,a1,7
    80007214:	00a5e7b3          	or	a5,a1,a0
    80007218:	40a70733          	sub	a4,a4,a0
    8000721c:	0077f793          	andi	a5,a5,7
    80007220:	00f73713          	sltiu	a4,a4,15
    80007224:	00174713          	xori	a4,a4,1
    80007228:	0017b793          	seqz	a5,a5
    8000722c:	00e7f7b3          	and	a5,a5,a4
    80007230:	10078863          	beqz	a5,80007340 <__memmove+0x14c>
    80007234:	00900793          	li	a5,9
    80007238:	1107f463          	bgeu	a5,a6,80007340 <__memmove+0x14c>
    8000723c:	0036581b          	srliw	a6,a2,0x3
    80007240:	fff8081b          	addiw	a6,a6,-1
    80007244:	02081813          	slli	a6,a6,0x20
    80007248:	01d85893          	srli	a7,a6,0x1d
    8000724c:	00858813          	addi	a6,a1,8
    80007250:	00058793          	mv	a5,a1
    80007254:	00050713          	mv	a4,a0
    80007258:	01088833          	add	a6,a7,a6
    8000725c:	0007b883          	ld	a7,0(a5)
    80007260:	00878793          	addi	a5,a5,8
    80007264:	00870713          	addi	a4,a4,8
    80007268:	ff173c23          	sd	a7,-8(a4)
    8000726c:	ff0798e3          	bne	a5,a6,8000725c <__memmove+0x68>
    80007270:	ff867713          	andi	a4,a2,-8
    80007274:	02071793          	slli	a5,a4,0x20
    80007278:	0207d793          	srli	a5,a5,0x20
    8000727c:	00f585b3          	add	a1,a1,a5
    80007280:	40e686bb          	subw	a3,a3,a4
    80007284:	00f507b3          	add	a5,a0,a5
    80007288:	06e60463          	beq	a2,a4,800072f0 <__memmove+0xfc>
    8000728c:	0005c703          	lbu	a4,0(a1)
    80007290:	00e78023          	sb	a4,0(a5)
    80007294:	04068e63          	beqz	a3,800072f0 <__memmove+0xfc>
    80007298:	0015c603          	lbu	a2,1(a1)
    8000729c:	00100713          	li	a4,1
    800072a0:	00c780a3          	sb	a2,1(a5)
    800072a4:	04e68663          	beq	a3,a4,800072f0 <__memmove+0xfc>
    800072a8:	0025c603          	lbu	a2,2(a1)
    800072ac:	00200713          	li	a4,2
    800072b0:	00c78123          	sb	a2,2(a5)
    800072b4:	02e68e63          	beq	a3,a4,800072f0 <__memmove+0xfc>
    800072b8:	0035c603          	lbu	a2,3(a1)
    800072bc:	00300713          	li	a4,3
    800072c0:	00c781a3          	sb	a2,3(a5)
    800072c4:	02e68663          	beq	a3,a4,800072f0 <__memmove+0xfc>
    800072c8:	0045c603          	lbu	a2,4(a1)
    800072cc:	00400713          	li	a4,4
    800072d0:	00c78223          	sb	a2,4(a5)
    800072d4:	00e68e63          	beq	a3,a4,800072f0 <__memmove+0xfc>
    800072d8:	0055c603          	lbu	a2,5(a1)
    800072dc:	00500713          	li	a4,5
    800072e0:	00c782a3          	sb	a2,5(a5)
    800072e4:	00e68663          	beq	a3,a4,800072f0 <__memmove+0xfc>
    800072e8:	0065c703          	lbu	a4,6(a1)
    800072ec:	00e78323          	sb	a4,6(a5)
    800072f0:	00813403          	ld	s0,8(sp)
    800072f4:	01010113          	addi	sp,sp,16
    800072f8:	00008067          	ret
    800072fc:	02061713          	slli	a4,a2,0x20
    80007300:	02075713          	srli	a4,a4,0x20
    80007304:	00e587b3          	add	a5,a1,a4
    80007308:	f0f574e3          	bgeu	a0,a5,80007210 <__memmove+0x1c>
    8000730c:	02069613          	slli	a2,a3,0x20
    80007310:	02065613          	srli	a2,a2,0x20
    80007314:	fff64613          	not	a2,a2
    80007318:	00e50733          	add	a4,a0,a4
    8000731c:	00c78633          	add	a2,a5,a2
    80007320:	fff7c683          	lbu	a3,-1(a5)
    80007324:	fff78793          	addi	a5,a5,-1
    80007328:	fff70713          	addi	a4,a4,-1
    8000732c:	00d70023          	sb	a3,0(a4)
    80007330:	fec798e3          	bne	a5,a2,80007320 <__memmove+0x12c>
    80007334:	00813403          	ld	s0,8(sp)
    80007338:	01010113          	addi	sp,sp,16
    8000733c:	00008067          	ret
    80007340:	02069713          	slli	a4,a3,0x20
    80007344:	02075713          	srli	a4,a4,0x20
    80007348:	00170713          	addi	a4,a4,1
    8000734c:	00e50733          	add	a4,a0,a4
    80007350:	00050793          	mv	a5,a0
    80007354:	0005c683          	lbu	a3,0(a1)
    80007358:	00178793          	addi	a5,a5,1
    8000735c:	00158593          	addi	a1,a1,1
    80007360:	fed78fa3          	sb	a3,-1(a5)
    80007364:	fee798e3          	bne	a5,a4,80007354 <__memmove+0x160>
    80007368:	f89ff06f          	j	800072f0 <__memmove+0xfc>
	...
