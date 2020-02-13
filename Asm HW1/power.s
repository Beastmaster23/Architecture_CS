	.file	"power.c"
	.intel_syntax noprefix
	.text
	.globl	power
	.type	power, @function
power:
.LFB0:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	mov	DWORD PTR -20[rbp], edi
	mov	DWORD PTR -24[rbp], esi
	mov	DWORD PTR -8[rbp], 0
	mov	eax, DWORD PTR -20[rbp]
	mov	DWORD PTR -4[rbp], eax
	jmp	.L2
.L3:
	mov	eax, DWORD PTR -20[rbp]
	imul	eax, DWORD PTR -4[rbp]
	mov	DWORD PTR -20[rbp], eax
	add	DWORD PTR -8[rbp], 1
.L2:
	mov	eax, DWORD PTR -8[rbp]
	cmp	eax, DWORD PTR -24[rbp]
	jl	.L3
	mov	eax, DWORD PTR -20[rbp]
	pop	rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	power, .-power
	.globl	fillarray
	.type	fillarray, @function
fillarray:
.LFB1:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	push	rbx
	sub	rsp, 32
	.cfi_offset 3, -24
	mov	DWORD PTR -28[rbp], edi
	mov	QWORD PTR -40[rbp], rsi
	mov	DWORD PTR -32[rbp], edx
	mov	DWORD PTR -12[rbp], 0
	jmp	.L6
.L7:
	mov	eax, DWORD PTR -12[rbp]
	cdqe
	lea	rdx, 0[0+rax*4]
	mov	rax, QWORD PTR -40[rbp]
	lea	rbx, [rdx+rax]
	mov	edx, DWORD PTR -12[rbp]
	mov	eax, DWORD PTR -28[rbp]
	mov	esi, edx
	mov	edi, eax
	call	power
	mov	DWORD PTR [rbx], eax
	add	DWORD PTR -12[rbp], 1
.L6:
	mov	eax, DWORD PTR -12[rbp]
	cmp	eax, DWORD PTR -32[rbp]
	jl	.L7
	nop
	add	rsp, 32
	pop	rbx
	pop	rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	fillarray, .-fillarray
	.globl	fillarray2
	.type	fillarray2, @function
fillarray2:
.LFB2:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	mov	DWORD PTR -20[rbp], edi
	mov	QWORD PTR -32[rbp], rsi
	mov	DWORD PTR -24[rbp], edx
	mov	DWORD PTR -4[rbp], 1
	mov	rax, QWORD PTR -32[rbp]
	mov	edx, DWORD PTR -20[rbp]
	mov	DWORD PTR [rax], edx
	jmp	.L9
.L10:
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	sal	rax, 2
	lea	rdx, -4[rax]
	mov	rax, QWORD PTR -32[rbp]
	add	rax, rdx
	mov	eax, DWORD PTR [rax]
	mov	edx, DWORD PTR -4[rbp]
	movsx	rdx, edx
	lea	rcx, 0[0+rdx*4]
	mov	rdx, QWORD PTR -32[rbp]
	add	rdx, rcx
	imul	eax, DWORD PTR -20[rbp]
	mov	DWORD PTR [rdx], eax
	add	DWORD PTR -4[rbp], 1
.L9:
	mov	eax, DWORD PTR -4[rbp]
	cmp	eax, DWORD PTR -24[rbp]
	jl	.L10
	nop
	pop	rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	fillarray2, .-fillarray2
	.globl	compare
	.type	compare, @function
compare:
.LFB3:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	mov	QWORD PTR -24[rbp], rdi
	mov	QWORD PTR -32[rbp], rsi
	mov	DWORD PTR -36[rbp], edx
	mov	DWORD PTR -4[rbp], 0
	jmp	.L12
.L15:
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	lea	rdx, 0[0+rax*4]
	mov	rax, QWORD PTR -24[rbp]
	add	rax, rdx
	mov	edx, DWORD PTR [rax]
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	lea	rcx, 0[0+rax*4]
	mov	rax, QWORD PTR -32[rbp]
	add	rax, rcx
	mov	eax, DWORD PTR [rax]
	cmp	edx, eax
	je	.L13
	mov	eax, 0
	jmp	.L14
.L13:
	add	DWORD PTR -4[rbp], 1
.L12:
	mov	eax, DWORD PTR -4[rbp]
	cmp	eax, DWORD PTR -36[rbp]
	jl	.L15
	mov	eax, 1
.L14:
	pop	rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	compare, .-compare
	.section	.rodata
.LC0:
	.string	"%d "
.LC1:
	.string	"%d\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB4:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	add	rsp, -128
	mov	DWORD PTR -116[rbp], edi
	mov	QWORD PTR -128[rbp], rsi
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR -8[rbp], rax
	xor	eax, eax
	mov	DWORD PTR -96[rbp], 5
	mov	DWORD PTR -92[rbp], 4
	mov	DWORD PTR -88[rbp], 3
	mov	DWORD PTR -84[rbp], 2
	mov	DWORD PTR -80[rbp], 1
	mov	DWORD PTR -76[rbp], 7
	mov	DWORD PTR -72[rbp], 8
	mov	DWORD PTR -68[rbp], 9
	mov	DWORD PTR -64[rbp], 6
	mov	DWORD PTR -60[rbp], 10
	mov	DWORD PTR -48[rbp], 5
	mov	DWORD PTR -44[rbp], 4
	mov	DWORD PTR -40[rbp], 3
	mov	DWORD PTR -36[rbp], 2
	mov	DWORD PTR -32[rbp], 1
	mov	DWORD PTR -28[rbp], 7
	mov	DWORD PTR -24[rbp], 8
	mov	DWORD PTR -20[rbp], 9
	mov	DWORD PTR -16[rbp], 6
	mov	DWORD PTR -12[rbp], 10
	lea	rax, -96[rbp]
	mov	edx, 10
	mov	rsi, rax
	mov	edi, 3
	call	fillarray
	lea	rax, -48[rbp]
	mov	edx, 10
	mov	rsi, rax
	mov	edi, 1
	call	fillarray2
	mov	DWORD PTR -100[rbp], 0
	jmp	.L17
.L18:
	mov	eax, DWORD PTR -100[rbp]
	cdqe
	mov	eax, DWORD PTR -96[rbp+rax*4]
	mov	esi, eax
	lea	rdi, .LC0[rip]
	mov	eax, 0
	call	printf@PLT
	add	DWORD PTR -100[rbp], 1
.L17:
	cmp	DWORD PTR -100[rbp], 9
	jle	.L18
	mov	edi, 10
	call	putchar@PLT
	mov	DWORD PTR -100[rbp], 0
	jmp	.L19
.L20:
	mov	eax, DWORD PTR -100[rbp]
	cdqe
	mov	eax, DWORD PTR -48[rbp+rax*4]
	mov	esi, eax
	lea	rdi, .LC0[rip]
	mov	eax, 0
	call	printf@PLT
	add	DWORD PTR -100[rbp], 1
.L19:
	cmp	DWORD PTR -100[rbp], 9
	jle	.L20
	mov	edi, 10
	call	putchar@PLT
	lea	rcx, -48[rbp]
	lea	rax, -96[rbp]
	mov	edx, 10
	mov	rsi, rcx
	mov	rdi, rax
	call	compare
	mov	esi, eax
	lea	rdi, .LC1[rip]
	mov	eax, 0
	call	printf@PLT
	mov	eax, 0
	mov	rcx, QWORD PTR -8[rbp]
	xor	rcx, QWORD PTR fs:40
	je	.L22
	call	__stack_chk_fail@PLT
.L22:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 7.4.0-1ubuntu1~18.04.1) 7.4.0"
	.section	.note.GNU-stack,"",@progbits
