sum_array:
	pushl	%ebp
	movl	%esp, %ebp
	movl	8(%ebp), %ecx
	movl	(%ecx), %ecx
	movl	$0, %eax
	addl	%ecx, %eax
	addl	12(%ecx), %eax
	subl	24(%ecx), %eax
	popl	%ebp
	ret