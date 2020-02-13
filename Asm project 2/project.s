	.file	"project.c"
	.text
	.globl	power
	.type	power, @function
power:
	pushl	%ebp
	movl	%esp, %ebp
	movl	$1, %eax
	cmpl	$0, 12(%ebp)
	jle	.L30
	movl	$0, %ecx
.L31:
	imull	8(%ebp), %eax
	addl	$1, %ecx
	cmpl	%ecx, 12(%ebp)
	jg	.L31
.L30:
	popl	%ebp
	ret
	.size	power, .-power
	.globl	fillarray
	.type	fillarray, @function
fillarray:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%ebx
	pushl	%edi
	subl	$24, %esp
	movl	$0, %edi
	jmp	.L40
.L41:
	movl	%edi, %ebx
	sall	$2, %ebx
	addl	12(%ebp), %ebx
	movl	%edi, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	power
	movl	%eax, (%ebx)
	addl	$1, %edi
.L40:
	cmpl	16(%ebp), %edi
	jle	.L41
	addl	$24, %esp
	popl	%edi
	popl	%ebx
	popl	%ebp
	ret
	.size	fillarray, .-fillarray
	.globl	fillarray2
	.type	fillarray2, @function
fillarray2:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%ebx
	cmpl	$0, 16(%ebp)
	jl	.L60
	jmp	.L62
.L64:
	movl	$0, %ecx
	movl	$1, %eax
	cmpl	%ebx, %ecx
	jg	.L65
.L63:
	imull	8(%ebp), %eax
	addl	$1, %ecx
	cmpl	%ebx, %ecx
	jl	.L63
	jmp .L65
.L62:
	movl	$1, %eax
	movl	$0, %ebx
.L65:
	movl	%ebx, %edx
	sall	$2, %edx
	addl	12(%ebp), %edx
	movl	%eax, (%edx)
	addl	$1, %ebx
	cmpl	%ebx, 16(%ebp)
	jg	.L64
.L60:
	popl	%ebx
	popl	%ebp
	ret
	.size	fillarray2, .-fillarray2
	.globl	compare
	.type	compare, @function
compare:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%ebx
	movl	$-1, %eax
	cmpl	$0, 16(%ebp)
	jle	.L70
	movl	$0, %ecx
	
.L71:
	movl	8(%ebp), %edx
	movl	12(%ebp), %eax
	leal	(%edx, %ecx, 4), %edx
	leal	(%eax, %ecx, 4), %eax

	testl	%edx, %eax
	je	.L72

	addl	$1, %ecx
	cmpl	%ecx, 16(%ebp)
	jg	.L71
	movl	$1, %eax
	jmp	.L70
.L72:
	movl	$0, %eax
.L70:
	popl	%ebx
	popl	%ebp
	ret
	.size	compare, .-compare
	.section	.rodata
.LC0:
	.string	"fillarray(2,a,10) correct"
.LC1:
	.string	"fillarray(2,a,10) inccrrect"
.LC2:
	.string	"fillarray2(2,b,10) correct"
.LC3:
	.string	"fillarray2(2,b,10) incorrect"
.LC4:
	.string	"fillarray(3,a,10) correct"
.LC5:
	.string	"fillarray(3,a,10) incorrect"
.LC6:
	.string	"fillarray2(3,b,10) correct"
.LC7:
	.string	"fillarray2(3,b,10) incorrect"
	.text
	.globl	main
	.type	main, @function
main:
	pushl	%ebp
	movl	%esp, %ebp
	andl	$-16, %esp
	subl	$192, %esp
	movl	$2, 28(%esp)
	movl	$1, 112(%esp)
	movl	$2, 116(%esp)
	movl	$4, 120(%esp)
	movl	$8, 124(%esp)
	movl	$16, 128(%esp)
	movl	$32, 132(%esp)
	movl	$64, 136(%esp)
	movl	$128, 140(%esp)
	movl	$256, 144(%esp)
	movl	$512, 148(%esp)
	movl	$1, 152(%esp)
	movl	$3, 156(%esp)
	movl	$9, 160(%esp)
	movl	$27, 164(%esp)
	movl	$81, 168(%esp)
	movl	$243, 172(%esp)
	movl	$729, 176(%esp)
	movl	$2187, 180(%esp)
	movl	$6561, 184(%esp)
	movl	$19683, 188(%esp)
	movl	$10, 8(%esp)
	leal	32(%esp), %eax
	movl	%eax, 4(%esp)
	movl	28(%esp), %eax
	movl	%eax, (%esp)
	call	fillarray
	movl	$10, 8(%esp)
	leal	112(%esp), %eax
	movl	%eax, 4(%esp)
	leal	32(%esp), %eax
	movl	%eax, (%esp)
	call	compare
	cmpl	$1, %eax
	jne	.L17
	movl	$.LC0, (%esp)
	call	puts
	jmp	.L18
.L17:
	movl	$.LC1, (%esp)
	call	puts
.L18:
	movl	$10, 8(%esp)
	leal	72(%esp), %eax
	movl	%eax, 4(%esp)
	movl	28(%esp), %eax
	movl	%eax, (%esp)
	call	fillarray2
	movl	$10, 8(%esp)
	leal	112(%esp), %eax
	movl	%eax, 4(%esp)
	leal	72(%esp), %eax
	movl	%eax, (%esp)
	call	compare
	cmpl	$1, %eax
	jne	.L19
	movl	$.LC2, (%esp)
	call	puts
	jmp	.L20
.L19:
	movl	$.LC3, (%esp)
	call	puts
.L20:
	movl	$3, 28(%esp)
	movl	$10, 8(%esp)
	leal	32(%esp), %eax
	movl	%eax, 4(%esp)
	movl	28(%esp), %eax
	movl	%eax, (%esp)
	call	fillarray
	movl	$10, 8(%esp)
	leal	152(%esp), %eax
	movl	%eax, 4(%esp)
	leal	32(%esp), %eax
	movl	%eax, (%esp)
	call	compare
	cmpl	$1, %eax
	jne	.L21
	movl	$.LC4, (%esp)
	call	puts
	jmp	.L22
.L21:
	movl	$.LC5, (%esp)
	call	puts
.L22:
	movl	$10, 8(%esp)
	leal	72(%esp), %eax
	movl	%eax, 4(%esp)
	movl	28(%esp), %eax
	movl	%eax, (%esp)
	call	fillarray2
	movl	$10, 8(%esp)
	leal	152(%esp), %eax
	movl	%eax, 4(%esp)
	leal	72(%esp), %eax
	movl	%eax, (%esp)
	call	compare
	cmpl	$1, %eax
	jne	.L23
	movl	$.LC6, (%esp)
	call	puts
	jmp	.L25
.L23:
	movl	$.LC7, (%esp)
	call	puts
.L25:
	leave
	ret
	.size	main, .-main
	.ident	"GCC: (Ubuntu 4.8.4-2ubuntu1~14.04.4) 4.8.4"
	.section	.note.GNU-stack,"",@progbits
