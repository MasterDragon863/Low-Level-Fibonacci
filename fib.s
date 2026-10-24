.global _start

.section .bss
buffer:
	.zero 0x10
out_buf:
	.zero 0x16

.section .text
_start:
input:
	xorq %rax, %rax
	xorq %rdi, %rdi
	movq $buffer, %rsi
	movq $0x10, %rdx
	syscall

	pushq %rax
	xorq %rax, %rax
	movq $buffer, %rcx

convert_to_int:
	movzbq (%rcx), %rdx
	cmpb $0xa, %dl
	je done
	cmpb $0x0, %dl
	je done

	imulq $0xa, %rax
	subq $0x30, %rdx
	addq %rdx, %rax
	incq %rcx
	jmp convert_to_int

done:
	movq %rax, %rcx
	movq $0x0, %rax
	movq $0x1, %rdi

loop:
	testq %rcx, %rcx
	je loop_done
	movq %rdi, %rdx
	addq %rax, %rdi
	movq %rdx, %rax
	decq %rcx
	jmp loop

loop_done:
	movq $out_buf, %rcx
	addq $0x15, %rcx
	movb $0xa, (%rcx)
	decq %rcx
	movq $0x1, %rbx

	movq $0xa, %rdi

convert_to_str:
	xorq %rdx, %rdx
	divq %rdi

	addq $0x30, %rdx
	movb %dl, (%rcx)
	incq %rbx
	decq %rcx

	testq %rax, %rax
	jnz convert_to_str
	
	incq %rcx

convert_comp:
	movq $0x1, %rdi
	movq $0x1, %rax
	movq %rcx, %rsi
	movq %rbx, %rdx
	syscall
	
exit:
	movq $0x3c, %rax
	movq $0x0, %rdi
	syscall

