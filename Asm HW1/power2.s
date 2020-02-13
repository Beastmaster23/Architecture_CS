	.file	"power.c"
	.text
.globl power
	.type	power, @function
power:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%ebx
	movl	8(%ebp), %eax
	movl	12(%ebp), %ebx
	testl	%ebx, %ebx
	jle	.L2
	movl	%eax, %ecx
	movl	$0, %edx
.L3:
	imull	%eax, %ecx
	addl	$1, %edx
	cmpl	%edx, %ebx
	jg	.L3
	movl	%ecx, %eax
.L2:
	popl	%ebx
	popl	%ebp
	ret
	.size	power, .-power
.globl fillarray
	.type	fillarray, @function
fillarray:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%ebx
    pushl	%edi
	subl	$8, %esp
    movl	12(%ebp), %edi
	movl	16(%ebp), %eax
	testl	%eax, %eax
	jle	.L9
    movl	$0, %ebx
.L8:
	movl	%ebx, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	power
	movl	%eax, (%edi,%ebx,4)
	addl	$1, %ebx
	cmpl	%ebx, 16(%ebp)
	jg	.L8
.L9:
	addl	$8, %esp
	popl	%ebx
    popl	%edi
	popl	%ebp
	ret
	.size	fillarray, .-fillarray
.globl fillarray2
	.type	fillarray2, @function
fillarray2:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%ebx
	movl	8(%ebp), %eax
	movl	12(%ebp), %ecx
	movl	16(%ebp), %ebx
	movl	%eax, (%ecx)
	cmpl	$1, %ebx
	jle	.L14
	movl	$1, %edx
.L13:
	movl	8(%ebp), %eax
	imull	-4(%ecx,%edx,4), %eax
	movl	%eax, (%ecx,%edx,4)
	addl	$1, %edx
	cmpl	%edx, %ebx
	jg	.L13
.L14:
	popl	%ebx
	popl	%ebp
	ret
	.size	fillarray2, .-fillarray2
.globl compare
	.type	compare, @function
compare:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%esi
	pushl	%ebx
	movl	8(%ebp), %esi
	movl	12(%ebp), %ebx
	movl	16(%ebp), %ecx
	testl	%ecx, %ecx
	jle	.L17
	movl	(%esi), %eax
	movl	$0, %edx
	cmpl	(%ebx), %eax
	je	.L19
	jmp	.L18
.L20:
	movl	(%esi,%edx,4), %eax
	cmpl	(%ebx,%edx,4), %eax
	jne	.L18
.L19:
	addl	$1, %edx
	cmpl	%edx, %ecx
	.p2align 4,,3
	.p2align 3
	jg	.L20
	.p2align 4,,3
	.p2align 3
	jmp	.L17
.L18:
	movl	$0, %eax
	.p2align 4,,5
	.p2align 3
	jmp	.L21
.L17:
	movl	$1, %eax
.L21:
	popl	%ebx
	popl	%esi
	popl	%ebp
	.p2align 4,,4
	.p2align 3
	ret
	.size	compare, .-compare
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%d "
.LC1:
	.string	"%d\n"
	.text
.globl main
	.type	main, @function
main:
	leal	4(%esp), %ecx
	andl	$-16, %esp
	pushl	-4(%ecx)
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%esi
	pushl	%ebx
	pushl	%ecx
	subl	$60, %esp
	movl	$5, -32(%ebp)
	movl	$4, -28(%ebp)
	movl	$3, -24(%ebp)
	movl	$2, -20(%ebp)
	movl	$1, -16(%ebp)
	movl	$5, -52(%ebp)
	movl	$4, -48(%ebp)
	movl	$3, -44(%ebp)
	movl	$2, -40(%ebp)
	movl	$1, -36(%ebp)
	movl	$5, 8(%esp)
	leal	-32(%ebp), %esi
	movl	%esi, 4(%esp)
	movl	$2, (%esp)
	call	fillarray
	movl	$5, 8(%esp)
	leal	-52(%ebp), %ebx
	movl	%ebx, 4(%esp)
	movl	$2, (%esp)
	call	fillarray2
	movl	-32(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	$.LC0, 4(%esp)
	movl	$1, (%esp)
	call	__printf_chk
	movl	-28(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	$.LC0, 4(%esp)
	movl	$1, (%esp)
	call	__printf_chk
	movl	-24(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	$.LC0, 4(%esp)
	movl	$1, (%esp)
	call	__printf_chk
	movl	-20(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	$.LC0, 4(%esp)
	movl	$1, (%esp)
	call	__printf_chk
	movl	-16(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	$.LC0, 4(%esp)
	movl	$1, (%esp)
	call	__printf_chk
	movl	$10, (%esp)
	call	putchar
	movl	-52(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	$.LC0, 4(%esp)
	movl	$1, (%esp)
	call	__printf_chk
	movl	-48(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	$.LC0, 4(%esp)
	movl	$1, (%esp)
	call	__printf_chk
	movl	-44(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	$.LC0, 4(%esp)
	movl	$1, (%esp)
	call	__printf_chk
	movl	-40(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	$.LC0, 4(%esp)
	movl	$1, (%esp)
	call	__printf_chk
	movl	-36(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	$.LC0, 4(%esp)
	movl	$1, (%esp)
	call	__printf_chk
	movl	$10, (%esp)
	call	putchar
	movl	$5, 8(%esp)
	movl	%ebx, 4(%esp)
	movl	%esi, (%esp)
	call	compare
	movl	%eax, 8(%esp)
	movl	$.LC1, 4(%esp)
	movl	$1, (%esp)
	call	__printf_chk
	movl	$0, %eax
	addl	$60, %esp
	popl	%ecx
	popl	%ebx
	popl	%esi
	popl	%ebp
	leal	-4(%ecx), %esp
	ret
	.size	main, .-main
	.ident	"GCC: (Ubuntu 4.3.3-5ubuntu4) 4.3.3"
	.section	.note.GNU-stack,"",@progbits
