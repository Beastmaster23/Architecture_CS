	.file	"operators.c"
	.text
.globl add_node
	.type	add_node, @function
add_node:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$24, %esp
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	je	.L2
	movl	8(%ebp), %eax
	movl	(%eax), %edx
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	add_node
	jmp	.L4
.L2:
	movl	$4, (%esp)
	call	malloc
	movl	%eax, -4(%ebp)
	movl	-4(%ebp), %edx
	movl	12(%ebp), %eax
	movl	%eax, 4(%edx)
	movl	-4(%ebp), %eax
	movl	$0, (%eax)
	movl	8(%ebp), %edx
	movl	-4(%ebp), %eax
	movl	%eax, (%edx)
.L4:
	leave
	ret
	.size	add_node, .-add_node
.globl remove_node
	.type	remove_node, @function
remove_node:
	pushl	%ebp
	movl	%esp, %ebp
	popl	%ebp
	ret
	.size	remove_node, .-remove_node
.globl create_list
	.type	create_list, @function
create_list:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%ebx
	subl	$36, %esp
	movl	$0, -8(%ebp)
	jmp	.L8
.L9:
	call	rand
	movl	%eax, %ecx
	movl	$-1600085855, -28(%ebp)
	movl	-28(%ebp), %eax
	imull	%ecx
	leal	(%edx,%ecx), %eax
	movl	%eax, %edx
	sarl	$5, %edx
	movl	%ecx, %eax
	sarl	$31, %eax
	movl	%edx, %ebx
	subl	%eax, %ebx
	movl	%ebx, -24(%ebp)
	imull	$51, -24(%ebp), %eax
	movl	%ecx, %edx
	subl	%eax, %edx
	movl	%edx, -24(%ebp)
	movl	-24(%ebp), %ebx
	movl	%ebx, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	add_node
	addl	$1, -8(%ebp)
.L8:
	movl	-8(%ebp), %eax
	cmpl	12(%ebp), %eax
	jl	.L9
	addl	$36, %esp
	popl	%ebx
	popl	%ebp
	ret
	.size	create_list, .-create_list
.globl get_ith_elem
	.type	get_ith_elem, @function
get_ith_elem:
	pushl	%ebp
	movl	%esp, %ebp
	movl	8(%ebp), %eax
	popl	%ebp
	ret
	.size	get_ith_elem, .-get_ith_elem
.globl free_list
	.type	free_list, @function
free_list:
	pushl	%ebp
	movl	%esp, %ebp
	popl	%ebp
	ret
	.size	free_list, .-free_list
.globl swap_lists
	.type	swap_lists, @function
swap_lists:
	pushl	%ebp
	movl	%esp, %ebp
	popl	%ebp
	ret
	.size	swap_lists, .-swap_lists
	.section	.rodata
.LC0:
	.string	"%d "
	.text
.globl show_list
	.type	show_list, @function
show_list:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$8, %esp
	cmpl	$0, 8(%ebp)
	jne	.L18
	movl	$10, (%esp)
	call	putchar
	jmp	.L20
.L18:
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	movl	%eax, 4(%esp)
	movl	$.LC0, (%esp)
	call	printf
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, (%esp)
	call	show_list
.L20:
	leave
	ret
	.size	show_list, .-show_list
.globl power
	.type	power, @function
power:
	pushl	%ebp
	movl	%esp, %ebp
	movl	8(%ebp), %eax
	popl	%ebp
	ret
	.size	power, .-power
.globl get_ij_array
	.type	get_ij_array, @function
get_ij_array:
	pushl	%ebp
	movl	%esp, %ebp
	movl	12(%ebp), %eax
	sall	$3, %eax
	movl	%eax, %edx
	addl	8(%ebp), %edx
	movl	16(%ebp), %eax
	movl	(%edx,%eax,4), %eax
	popl	%ebp
	ret
	.size	get_ij_array, .-get_ij_array
.globl fillarray
	.type	fillarray, @function
fillarray:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%ebx
	subl	$24, %esp
	movl	$0, -8(%ebp)
	jmp	.L26
.L27:
	movl	-8(%ebp), %eax
	sall	$2, %eax
	movl	%eax, %ebx
	addl	12(%ebp), %ebx
	movl	-8(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	power
	movl	%eax, (%ebx)
	addl	$1, -8(%ebp)
.L26:
	cmpl	$5, -8(%ebp)
	jle	.L27
	addl	$24, %esp
	popl	%ebx
	popl	%ebp
	ret
	.size	fillarray, .-fillarray
.globl fillarray2
	.type	fillarray2, @function
fillarray2:
	pushl	%ebp
	movl	%esp, %ebp
	popl	%ebp
	ret
	.size	fillarray2, .-fillarray2
.globl compare
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
	cmpl	(%eax, %ecx, 4), %edx
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
.LC1:
	.string	"%d\t%d"
.LC2:
	.string	"Cmp: %d\n"
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
	subl	$84, %esp
	movl	$5, -36(%ebp)
	movl	$6, -32(%ebp)
	movl	$7, -28(%ebp)
	movl	$7, -24(%ebp)
	movl	$9, -20(%ebp)
	movl	$0, -16(%ebp)
	movl	$5, -60(%ebp)
	movl	$6, -56(%ebp)
	movl	$7, -52(%ebp)
	movl	$7, -48(%ebp)
	movl	$9, -44(%ebp)
	movl	$0, -40(%ebp)
	movl	$0, -8(%ebp)
	jmp	.L34
.L35:
	movl	-8(%ebp), %eax
	movl	-60(%ebp,%eax,4), %edx
	movl	-8(%ebp), %eax
	movl	-36(%ebp,%eax,4), %eax
	movl	%edx, 8(%esp)
	movl	%eax, 4(%esp)
	movl	$.LC1, (%esp)
	call	printf
	movl	$10, (%esp)
	call	putchar
	addl	$1, -8(%ebp)
.L34:
	cmpl	$5, -8(%ebp)
	jle	.L35
	movl	$6, 8(%esp)
	leal	-60(%ebp), %eax
	movl	%eax, 4(%esp)
	leal	-36(%ebp), %eax
	movl	%eax, (%esp)
	call	compare
	movl	%eax, 4(%esp)
	movl	$.LC2, (%esp)
	call	printf
	movl	$0, %eax
	addl	$84, %esp
	popl	%ecx
	popl	%ebp
	leal	-4(%ecx), %esp
	ret
	.size	main, .-main
	.ident	"GCC: (Ubuntu 4.3.3-5ubuntu4) 4.3.3"
	.section	.note.GNU-stack,"",@progbits
