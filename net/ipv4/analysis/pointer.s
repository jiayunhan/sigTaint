	.file	"pointer.c"
	.section	.rodata
.LC0:
	.string	"result=%ld\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	$101010, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	movl	%eax, %esi
	movl	$.LC0, %edi
	movl	$0, %eax
	call	printf
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.globl	swap_words
	.type	swap_words, @function
swap_words:
.LFB1:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, -20(%rbp)
	leaq	-20(%rbp), %rax
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movzwl	(%rax), %eax
	movw	%ax, -10(%rbp)
	movq	-8(%rbp), %rax
	movzwl	2(%rax), %eax
	movw	%ax, -12(%rbp)
	movq	-8(%rbp), %rax
	leaq	2(%rax), %rdx
	movzwl	-10(%rbp), %eax
	movw	%ax, (%rdx)
	movq	-8(%rbp), %rax
	movzwl	-12(%rbp), %edx
	movw	%dx, (%rax)
	movl	-20(%rbp), %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	swap_words, .-swap_words
	.ident	"GCC: (Debian 4.7.2-5) 4.7.2"
	.section	.note.GNU-stack,"",@progbits
