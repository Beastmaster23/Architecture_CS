	.file	"extra.c"
	.text
.globl encryptDecrypt
	.type	encryptDecrypt, @function
encryptDecrypt:
	pushl	%ebp
	movl	%esp, %ebp
	movl	8(%ebp), %edx
	mov		%dl, %ah
	mov		%dh, %al
	shrl	$16, %edx
	shll	$16, %eax
	mov		%dl, %ah
	mov		%dh, %al
	popl	%ebp
	ret
	.size	encryptDecrypt, .-encryptDecrypt
.globl insert
	.type	insert, @function
insert:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$24, %esp
	cmpl	$0, 12(%ebp)
	jne	.L4
	movl	$36, (%esp)
	call	malloc
	movl	%eax, 12(%ebp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	encryptDecrypt
	movl	%eax, %edx
	movl	12(%ebp), %eax
	movl	%edx, 24(%eax)
	movl	12(%ebp), %eax
	movl	$0, 28(%eax)
	movl	12(%ebp), %eax
	movl	$0, 32(%eax)
	movl	12(%ebp), %eax
	movl	%eax, (%esp)
	call	encryptDecrypt
	movl	%eax, -4(%ebp)
	jmp	.L5
.L4:
	movl	12(%ebp), %eax
	movl	%eax, (%esp)
	call	encryptDecrypt
	movl	%eax, 12(%ebp)
	movl	12(%ebp), %eax
	movl	24(%eax), %eax
	cmpl	8(%ebp), %eax
	jle	.L6
	movl	12(%ebp), %eax
	movl	28(%eax), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	insert
	movl	%eax, %edx
	movl	12(%ebp), %eax
	movl	%edx, 28(%eax)
	jmp	.L7
.L6:
	movl	12(%ebp), %eax
	movl	32(%eax), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	insert
	movl	%eax, %edx
	movl	12(%ebp), %eax
	movl	%edx, 32(%eax)
.L7:
	movl	12(%ebp), %eax
	movl	%eax, -4(%ebp)
.L5:
	movl	-4(%ebp), %eax
	leave
	ret
	.size	insert, .-insert
.globl mallocEnc
	.type	mallocEnc, @function
mallocEnc:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$8, %esp
	movl	$8, (%esp)
	call	malloc
	leave
	ret
	.size	mallocEnc, .-mallocEnc
.globl memCpyEnc
	.type	memCpyEnc, @function
memCpyEnc:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$24, %esp
	movl	8(%ebp), %eax
	sall	$2, %eax
	movl	%eax, 8(%esp)
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	16(%ebp), %eax
	movl	%eax, (%esp)
	call	memcpy
	leave
	ret
	.size	memCpyEnc, .-memCpyEnc
.globl createTree
	.type	createTree, @function
createTree:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%ebx
	subl	$36, %esp
	movl	$0, -8(%ebp)
	call	rand
	movl	%eax, %ecx
	movl	$1374389535, -32(%ebp)
	movl	-32(%ebp), %eax
	imull	%ecx
	sarl	$5, %edx
	movl	%ecx, %eax
	sarl	$31, %eax
	movl	%edx, %ebx
	subl	%eax, %ebx
	movl	%ebx, -28(%ebp)
	imull	$100, -28(%ebp), %eax
	movl	%ecx, %edx
	subl	%eax, %edx
	movl	%edx, -28(%ebp)
	movl	-8(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-28(%ebp), %ebx
	movl	%ebx, (%esp)
	call	insert
	movl	%eax, -8(%ebp)
	movl	$1, -12(%ebp)
	jmp	.L14
.L15:
	call	rand
	movl	%eax, %ecx
	movl	$1374389535, -32(%ebp)
	movl	-32(%ebp), %eax
	imull	%ecx
	sarl	$5, %edx
	movl	%ecx, %eax
	sarl	$31, %eax
	movl	%edx, %ebx
	subl	%eax, %ebx
	movl	%ebx, -24(%ebp)
	imull	$100, -24(%ebp), %eax
	movl	%ecx, %edx
	subl	%eax, %edx
	movl	%edx, -24(%ebp)
	movl	-8(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-24(%ebp), %ebx
	movl	%ebx, (%esp)
	call	insert
	addl	$1, -12(%ebp)
.L14:
	movl	-12(%ebp), %eax
	cmpl	8(%ebp), %eax
	jl	.L15
	movl	-8(%ebp), %eax
	addl	$36, %esp
	popl	%ebx
	popl	%ebp
	ret
	.size	createTree, .-createTree
.globl freeTree
	.type	freeTree, @function
freeTree:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$8, %esp
	cmpl	$0, 8(%ebp)
	je	.L19
	movl	8(%ebp), %eax
	movl	28(%eax), %eax
	movl	%eax, (%esp)
	call	freeTree
	movl	8(%ebp), %eax
	movl	32(%eax), %eax
	movl	%eax, (%esp)
	call	freeTree
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	free
.L19:
	leave
	ret
	.size	freeTree, .-freeTree
.globl treeToMetaArray
	.type	treeToMetaArray, @function
treeToMetaArray:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%ebx
	subl	$52, %esp
	cmpl	$0, 8(%ebp)
	jne	.L21
	movl	$0, -40(%ebp)
	jmp	.L22
.L21:
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	encryptDecrypt
	movl	%eax, 8(%ebp)
	movl	$8, (%esp)
	call	malloc
	movl	%eax, -8(%ebp)
	movl	$1, -12(%ebp)
	movl	$0, -20(%ebp)
	movl	8(%ebp), %eax
	movl	28(%eax), %eax
	movl	%eax, (%esp)
	call	treeToMetaArray
	movl	%eax, -24(%ebp)
	cmpl	$0, -24(%ebp)
	je	.L23
	movl	-24(%ebp), %eax
	movl	(%eax), %eax
	addl	%eax, -12(%ebp)
.L23:
	movl	8(%ebp), %eax
	movl	32(%eax), %eax
	movl	%eax, (%esp)
	call	treeToMetaArray
	movl	%eax, -28(%ebp)
	cmpl	$0, -28(%ebp)
	je	.L24
	movl	-28(%ebp), %eax
	movl	(%eax), %eax
	addl	%eax, -12(%ebp)
.L24:
	movl	-8(%ebp), %edx
	movl	-12(%ebp), %eax
	movl	%eax, (%edx)
	movl	-8(%ebp), %eax
	movl	(%eax), %eax
	sall	$2, %eax
	movl	%eax, (%esp)
	call	malloc
	movl	%eax, %edx
	movl	-8(%ebp), %eax
	movl	%edx, 4(%eax)
	cmpl	$0, -24(%ebp)
	je	.L25
	movl	$0, -16(%ebp)
	jmp	.L26
.L27:
	movl	-8(%ebp), %eax
	movl	4(%eax), %edx
	movl	-20(%ebp), %eax
	sall	$2, %eax
	leal	(%edx,%eax), %ecx
	movl	-24(%ebp), %eax
	movl	4(%eax), %edx
	movl	-16(%ebp), %eax
	sall	$2, %eax
	leal	(%edx,%eax), %eax
	movl	(%eax), %eax
	movl	%eax, (%ecx)
	addl	$1, -20(%ebp)
	addl	$1, -16(%ebp)
.L26:
	movl	-16(%ebp), %eax
	movl	-24(%ebp), %edx
	movl	(%edx), %edx
	cmpl	%edx, %eax
	jb	.L27
.L25:
	movl	-8(%ebp), %eax
	movl	4(%eax), %edx
	movl	-20(%ebp), %eax
	sall	$2, %eax
	leal	(%edx,%eax), %ebx
	movl	8(%ebp), %eax
	movl	24(%eax), %eax
	movl	%eax, (%esp)
	call	encryptDecrypt
	movl	%eax, (%ebx)
	addl	$1, -20(%ebp)
	cmpl	$0, -28(%ebp)
	je	.L28
	movl	$0, -16(%ebp)
	jmp	.L29
.L30:
	movl	-8(%ebp), %eax
	movl	4(%eax), %edx
	movl	-20(%ebp), %eax
	sall	$2, %eax
	leal	(%edx,%eax), %ecx
	movl	-28(%ebp), %eax
	movl	4(%eax), %edx
	movl	-16(%ebp), %eax
	sall	$2, %eax
	leal	(%edx,%eax), %eax
	movl	(%eax), %eax
	movl	%eax, (%ecx)
	addl	$1, -20(%ebp)
	addl	$1, -16(%ebp)
.L29:
	movl	-16(%ebp), %eax
	movl	-28(%ebp), %edx
	movl	(%edx), %edx
	cmpl	%edx, %eax
	jb	.L30
.L28:
	movl	-8(%ebp), %eax
	movl	%eax, -40(%ebp)
.L22:
	movl	-40(%ebp), %eax
	addl	$52, %esp
	popl	%ebx
	popl	%ebp
	ret
	.size	treeToMetaArray, .-treeToMetaArray
	.section	.rodata
.LC0:
	.string	"%lu "
	.text
.globl main
	.type	main, @function
main:
	leal	4(%esp), %ecx
	andl	$-16, %esp
	pushl	-4(%ecx)
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%ecx
	subl	$36, %esp
	movl	$15, (%esp)
	call	createTree
	movl	%eax, -8(%ebp)
	movl	$0, -12(%ebp)
	movl	-8(%ebp), %eax
	movl	%eax, (%esp)
	call	treeToMetaArray
	movl	%eax, -16(%ebp)
	movl	$0, -12(%ebp)
	jmp	.L33
.L34:
	movl	-16(%ebp), %eax
	movl	4(%eax), %edx
	movl	-12(%ebp), %eax
	sall	$2, %eax
	leal	(%edx,%eax), %eax
	movl	(%eax), %eax
	movl	%eax, 4(%esp)
	movl	$.LC0, (%esp)
	call	printf
	addl	$1, -12(%ebp)
.L33:
	movl	-12(%ebp), %eax
	movl	-16(%ebp), %edx
	movl	(%edx), %edx
	cmpl	%edx, %eax
	jb	.L34
	movl	$10, (%esp)
	call	putchar
	movl	-8(%ebp), %eax
	movl	%eax, (%esp)
	call	freeTree
	movl	$0, %eax
	addl	$36, %esp
	popl	%ecx
	popl	%ebp
	leal	-4(%ecx), %esp
	ret
	.size	main, .-main
	.ident	"GCC: (Ubuntu 4.3.3-5ubuntu4) 4.3.3"
	.section	.note.GNU-stack,"",@progbits
