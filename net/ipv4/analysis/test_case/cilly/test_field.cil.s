	.file	"test_field.cil.c"
	.text
	.globl	recv
	.type	recv, @function
recv:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	movl	$0, 8(%rax)
	movq	-8(%rbp), %rax
	movb	$100, 12(%rax)
	movq	-8(%rbp), %rax
	movzbl	12(%rax), %eax
	movsbl	%al, %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	recv, .-recv
	.globl	main
	.type	main, @function
main:
.LFB1:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movl	$8, %edi
	call	malloc
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, -16(%rbp)
	movl	$40, %edi
	call	malloc
	movq	%rax, -24(%rbp)
	movq	-16(%rbp), %rax
	movq	-24(%rbp), %rdx
	movq	%rdx, (%rax)
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	recv
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	main, .-main
	.ident	"GCC: (Debian 4.7.2-5) 4.7.2"
	.section	.note.GNU-stack,"",@progbits
