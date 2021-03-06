	.text
	.global rand
rand:
	pushq %rbp
	movq %rsp, %rbp
	rdrand %eax
	andl $0x7fffffff, %eax
	pop %rbp
	retq
