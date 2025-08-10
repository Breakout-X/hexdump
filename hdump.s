	.file	"hdump.c"
	.text
	.def	fprintf;	.scl	3;	.type	32;	.endef
	.seh_proc	fprintf
fprintf:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$48, %rsp
	.seh_stackalloc	48
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	%r8, 32(%rbp)
	movq	%r9, 40(%rbp)
	leaq	32(%rbp), %rax
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rdx
	movq	24(%rbp), %rax
	movq	%rdx, %r8
	movq	%rax, %rdx
	movq	16(%rbp), %rcx
	call	__mingw_vfprintf
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	addq	$48, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.def	printf;	.scl	3;	.type	32;	.endef
	.seh_proc	printf
printf:
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$56, %rsp
	.seh_stackalloc	56
	leaq	48(%rsp), %rbp
	.seh_setframe	%rbp, 48
	.seh_endprologue
	movq	%rcx, 32(%rbp)
	movq	%rdx, 40(%rbp)
	movq	%r8, 48(%rbp)
	movq	%r9, 56(%rbp)
	leaq	40(%rbp), %rax
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rbx
	movl	$1, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rbx, %r8
	movq	32(%rbp), %rdx
	movq	%rax, %rcx
	call	__mingw_vfprintf
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	addq	$56, %rsp
	popq	%rbx
	popq	%rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC0:
	.ascii "%02X \0"
.LC1:
	.ascii "\12\0"
	.text
	.globl	print_line_hex
	.def	print_line_hex;	.scl	2;	.type	32;	.endef
	.seh_proc	print_line_hex
print_line_hex:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$48, %rsp
	.seh_stackalloc	48
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	%r8, 32(%rbp)
	movq	$0, -8(%rbp)
	jmp	.L6
.L7:
	movq	16(%rbp), %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %edx
	movq	32(%rbp), %rax
	movl	%edx, %r8d
	leaq	.LC0(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	addq	$1, -8(%rbp)
.L6:
	movq	-8(%rbp), %rax
	cmpq	24(%rbp), %rax
	jb	.L7
	movq	32(%rbp), %rax
	leaq	.LC1(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	nop
	addq	$48, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC2:
	.ascii "%08X  \0"
.LC3:
	.ascii "   \0"
.LC4:
	.ascii " \0"
.LC5:
	.ascii "%c\0"
	.text
	.globl	print_line_full
	.def	print_line_full;	.scl	2;	.type	32;	.endef
	.seh_proc	print_line_full
print_line_full:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$64, %rsp
	.seh_stackalloc	64
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	%r8, 32(%rbp)
	movq	%r9, 40(%rbp)
	movq	24(%rbp), %rax
	movl	%eax, %edx
	movq	40(%rbp), %rax
	movl	%edx, %r8d
	leaq	.LC2(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	movq	$0, -8(%rbp)
	jmp	.L9
.L12:
	movq	-8(%rbp), %rax
	cmpq	32(%rbp), %rax
	jnb	.L10
	movq	16(%rbp), %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %edx
	movq	40(%rbp), %rax
	movl	%edx, %r8d
	leaq	.LC0(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	jmp	.L11
.L10:
	movq	40(%rbp), %rax
	leaq	.LC3(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
.L11:
	addq	$1, -8(%rbp)
.L9:
	cmpq	$15, -8(%rbp)
	jbe	.L12
	movq	40(%rbp), %rax
	leaq	.LC4(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	movq	$0, -16(%rbp)
	jmp	.L13
.L16:
	movq	16(%rbp), %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movb	%al, -17(%rbp)
	cmpb	$31, -17(%rbp)
	jle	.L14
	cmpb	$127, -17(%rbp)
	je	.L14
	movsbl	-17(%rbp), %edx
	jmp	.L15
.L14:
	movl	$46, %edx
.L15:
	movq	40(%rbp), %rax
	movl	%edx, %r8d
	leaq	.LC5(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	addq	$1, -16(%rbp)
.L13:
	movq	-16(%rbp), %rax
	cmpq	32(%rbp), %rax
	jb	.L16
	movq	40(%rbp), %rax
	leaq	.LC1(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	nop
	addq	$64, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	print_line_ascii
	.def	print_line_ascii;	.scl	2;	.type	32;	.endef
	.seh_proc	print_line_ascii
print_line_ascii:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$48, %rsp
	.seh_stackalloc	48
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	%r8, 32(%rbp)
	movq	$0, -8(%rbp)
	jmp	.L18
.L21:
	movq	16(%rbp), %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movb	%al, -9(%rbp)
	cmpb	$31, -9(%rbp)
	jle	.L19
	cmpb	$127, -9(%rbp)
	je	.L19
	movsbl	-9(%rbp), %edx
	jmp	.L20
.L19:
	movl	$46, %edx
.L20:
	movq	32(%rbp), %rax
	movl	%edx, %r8d
	leaq	.LC5(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	addq	$1, -8(%rbp)
.L18:
	movq	-8(%rbp), %rax
	cmpq	24(%rbp), %rax
	jb	.L21
	movq	32(%rbp), %rax
	leaq	.LC1(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	nop
	addq	$48, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC6:
	.ascii "Usage:\12\0"
.LC7:
	.ascii "  hdump <input>\12\0"
.LC8:
	.ascii "  hdump -o <input> <output>\12\0"
.LC9:
	.ascii "  hdump -np <input>\12\0"
	.align 8
.LC10:
	.ascii "  hdump -np -o <input> <output>\12\0"
.LC11:
	.ascii "  hdump -op <input>\12\0"
	.align 8
.LC12:
	.ascii "  hdump -op -o <input> <output>\12\0"
.LC13:
	.ascii "Flags:\12\0"
	.align 8
.LC14:
	.ascii "  -np        No plaintext (hex only, no offset)\12\0"
	.align 8
.LC15:
	.ascii "  -op        Only plaintext (ASCII only)\12\0"
.LC16:
	.ascii "  -o         Output to file\12\0"
	.align 8
.LC17:
	.ascii "  -help      Show this help message\12\0"
	.align 8
.LC18:
	.ascii "  -version   Show version info\12\0"
	.align 8
.LC19:
	.ascii "  -v         Same as -version\12\0"
	.align 8
.LC20:
	.ascii "  -info      Show version and quote\12\0"
.LC21:
	.ascii "  -i         Same as -info\12\0"
	.align 8
.LC22:
	.ascii "  -license   Show license text\12\0"
	.align 8
.LC23:
	.ascii "  --license  Same as -license\12\0"
	.text
	.globl	print_help
	.def	print_help;	.scl	2;	.type	32;	.endef
	.seh_proc	print_help
print_help:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	leaq	.LC6(%rip), %rax
	movq	%rax, %rcx
	call	printf
	leaq	.LC7(%rip), %rax
	movq	%rax, %rcx
	call	printf
	leaq	.LC8(%rip), %rax
	movq	%rax, %rcx
	call	printf
	leaq	.LC9(%rip), %rax
	movq	%rax, %rcx
	call	printf
	leaq	.LC10(%rip), %rax
	movq	%rax, %rcx
	call	printf
	leaq	.LC11(%rip), %rax
	movq	%rax, %rcx
	call	printf
	leaq	.LC12(%rip), %rax
	movq	%rax, %rcx
	call	printf
	leaq	.LC13(%rip), %rax
	movq	%rax, %rcx
	call	printf
	leaq	.LC14(%rip), %rax
	movq	%rax, %rcx
	call	printf
	leaq	.LC15(%rip), %rax
	movq	%rax, %rcx
	call	printf
	leaq	.LC16(%rip), %rax
	movq	%rax, %rcx
	call	printf
	leaq	.LC17(%rip), %rax
	movq	%rax, %rcx
	call	printf
	leaq	.LC18(%rip), %rax
	movq	%rax, %rcx
	call	printf
	leaq	.LC19(%rip), %rax
	movq	%rax, %rcx
	call	printf
	leaq	.LC20(%rip), %rax
	movq	%rax, %rcx
	call	printf
	leaq	.LC21(%rip), %rax
	movq	%rax, %rcx
	call	printf
	leaq	.LC22(%rip), %rax
	movq	%rax, %rcx
	call	printf
	leaq	.LC23(%rip), %rax
	movq	%rax, %rcx
	call	printf
	nop
	addq	$32, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC24:
	.ascii "Copyright (c) 2002 JSON.org\12\12\0"
	.align 8
.LC25:
	.ascii "Permission is hereby granted, free of charge, to any person obtaining a copy\12\0"
	.align 8
.LC26:
	.ascii "of this software and associated documentation files (the \"Software\"), to deal\12\0"
	.align 8
.LC27:
	.ascii "in the Software without restriction, including without limitation the rights\12\0"
	.align 8
.LC28:
	.ascii "to use, copy, modify, merge, publish, distribute, sublicense, and/or sell\12\0"
	.align 8
.LC29:
	.ascii "copies of the Software, and to permit persons to whom the Software is\12\0"
	.align 8
.LC30:
	.ascii "furnished to do so, subject to the following conditions:\12\12\0"
	.align 8
.LC31:
	.ascii "The above copyright notice and this permission notice shall be included in\12\0"
	.align 8
.LC32:
	.ascii "all copies or substantial portions of the Software.\12\12\0"
	.align 8
.LC33:
	.ascii "The Software shall be used for Good, not Evil.\12\12\0"
	.align 8
.LC34:
	.ascii "THE SOFTWARE IS PROVIDED \"AS IS\", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR\12\0"
	.align 8
.LC35:
	.ascii "IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,\12\0"
	.align 8
.LC36:
	.ascii "FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE\12\0"
	.align 8
.LC37:
	.ascii "AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER\12\0"
	.align 8
.LC38:
	.ascii "LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,\12\0"
	.align 8
.LC39:
	.ascii "OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE\12\0"
.LC40:
	.ascii "SOFTWARE.\12\0"
	.text
	.globl	print_license
	.def	print_license;	.scl	2;	.type	32;	.endef
	.seh_proc	print_license
print_license:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	leaq	.LC24(%rip), %rax
	movq	%rax, %rcx
	call	printf
	leaq	.LC25(%rip), %rax
	movq	%rax, %rcx
	call	printf
	leaq	.LC26(%rip), %rax
	movq	%rax, %rcx
	call	printf
	leaq	.LC27(%rip), %rax
	movq	%rax, %rcx
	call	printf
	leaq	.LC28(%rip), %rax
	movq	%rax, %rcx
	call	printf
	leaq	.LC29(%rip), %rax
	movq	%rax, %rcx
	call	printf
	leaq	.LC30(%rip), %rax
	movq	%rax, %rcx
	call	printf
	leaq	.LC31(%rip), %rax
	movq	%rax, %rcx
	call	printf
	leaq	.LC32(%rip), %rax
	movq	%rax, %rcx
	call	printf
	leaq	.LC33(%rip), %rax
	movq	%rax, %rcx
	call	printf
	leaq	.LC34(%rip), %rax
	movq	%rax, %rcx
	call	printf
	leaq	.LC35(%rip), %rax
	movq	%rax, %rcx
	call	printf
	leaq	.LC36(%rip), %rax
	movq	%rax, %rcx
	call	printf
	leaq	.LC37(%rip), %rax
	movq	%rax, %rcx
	call	printf
	leaq	.LC38(%rip), %rax
	movq	%rax, %rcx
	call	printf
	leaq	.LC39(%rip), %rax
	movq	%rax, %rcx
	call	printf
	leaq	.LC40(%rip), %rax
	movq	%rax, %rcx
	call	printf
	nop
	addq	$32, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.def	__main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
.LC41:
	.ascii "-help\0"
.LC42:
	.ascii "-version\0"
.LC43:
	.ascii "-v\0"
.LC44:
	.ascii "--version\0"
.LC45:
	.ascii "hdump v1.0.0 by Breakout-X\0"
.LC46:
	.ascii "%s\12\0"
.LC47:
	.ascii "-info\0"
.LC48:
	.ascii "-i\0"
	.align 8
.LC49:
	.ascii "This is free software. You are free to use, modify, and distribute it without restriction.\0"
.LC50:
	.ascii "%s\12%s\12\0"
.LC51:
	.ascii "-license\0"
.LC52:
	.ascii "--license\0"
.LC53:
	.ascii "-np\0"
.LC54:
	.ascii "-op\0"
.LC55:
	.ascii "-o\0"
.LC56:
	.ascii "rb\0"
.LC57:
	.ascii "Error opening input file\0"
.LC58:
	.ascii "w\0"
.LC59:
	.ascii "Error opening output file\0"
	.text
	.globl	main
	.def	main;	.scl	2;	.type	32;	.endef
	.seh_proc	main
main:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	addq	$-128, %rsp
	.seh_stackalloc	128
	.seh_endprologue
	movl	%ecx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	call	__main
	movl	$1, -4(%rbp)
	movl	$1, -8(%rbp)
	movl	$1, -12(%rbp)
	movq	$0, -24(%rbp)
	movq	$0, -32(%rbp)
	movl	$1, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rax, -40(%rbp)
	movl	$1, -44(%rbp)
	jmp	.L25
.L34:
	movl	-44(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	24(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	leaq	.LC41(%rip), %rdx
	movq	%rax, %rcx
	call	strcmp
	testl	%eax, %eax
	jne	.L26
	call	print_help
	movl	$0, %eax
	jmp	.L50
.L26:
	movl	-44(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	24(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	leaq	.LC42(%rip), %rdx
	movq	%rax, %rcx
	call	strcmp
	testl	%eax, %eax
	je	.L28
	movl	-44(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	24(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	leaq	.LC43(%rip), %rdx
	movq	%rax, %rcx
	call	strcmp
	testl	%eax, %eax
	je	.L28
	movl	-44(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	24(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	leaq	.LC44(%rip), %rdx
	movq	%rax, %rcx
	call	strcmp
	testl	%eax, %eax
	jne	.L29
.L28:
	leaq	.LC45(%rip), %rax
	movq	%rax, %rdx
	leaq	.LC46(%rip), %rax
	movq	%rax, %rcx
	call	printf
	movl	$0, %eax
	jmp	.L50
.L29:
	movl	-44(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	24(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	leaq	.LC47(%rip), %rdx
	movq	%rax, %rcx
	call	strcmp
	testl	%eax, %eax
	je	.L30
	movl	-44(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	24(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	leaq	.LC48(%rip), %rdx
	movq	%rax, %rcx
	call	strcmp
	testl	%eax, %eax
	jne	.L31
.L30:
	leaq	.LC49(%rip), %r8
	leaq	.LC45(%rip), %rax
	movq	%rax, %rdx
	leaq	.LC50(%rip), %rax
	movq	%rax, %rcx
	call	printf
	movl	$0, %eax
	jmp	.L50
.L31:
	movl	-44(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	24(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	leaq	.LC51(%rip), %rdx
	movq	%rax, %rcx
	call	strcmp
	testl	%eax, %eax
	je	.L32
	movl	-44(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	24(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	leaq	.LC52(%rip), %rdx
	movq	%rax, %rcx
	call	strcmp
	testl	%eax, %eax
	jne	.L33
.L32:
	call	print_license
	movl	$0, %eax
	jmp	.L50
.L33:
	addl	$1, -44(%rbp)
.L25:
	movl	-44(%rbp), %eax
	cmpl	16(%rbp), %eax
	jl	.L34
	movl	$1, -48(%rbp)
	jmp	.L35
.L40:
	movl	-48(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	24(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	leaq	.LC53(%rip), %rdx
	movq	%rax, %rcx
	call	strcmp
	testl	%eax, %eax
	jne	.L36
	movl	$0, -8(%rbp)
	movl	$0, -12(%rbp)
	jmp	.L37
.L36:
	movl	-48(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	24(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	leaq	.LC54(%rip), %rdx
	movq	%rax, %rcx
	call	strcmp
	testl	%eax, %eax
	jne	.L38
	movl	$0, -4(%rbp)
	jmp	.L37
.L38:
	movl	-48(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	24(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	leaq	.LC55(%rip), %rdx
	movq	%rax, %rcx
	call	strcmp
	testl	%eax, %eax
	jne	.L39
	movl	-48(%rbp), %eax
	addl	$2, %eax
	cmpl	%eax, 16(%rbp)
	jle	.L39
	movl	-48(%rbp), %eax
	cltq
	addq	$1, %rax
	leaq	0(,%rax,8), %rdx
	movq	24(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	%rax, -24(%rbp)
	movl	-48(%rbp), %eax
	cltq
	addq	$2, %rax
	leaq	0(,%rax,8), %rdx
	movq	24(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	%rax, -32(%rbp)
	addl	$2, -48(%rbp)
	jmp	.L37
.L39:
	cmpq	$0, -24(%rbp)
	jne	.L37
	movl	-48(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	24(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movzbl	(%rax), %eax
	cmpb	$45, %al
	je	.L37
	movl	-48(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	24(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	%rax, -24(%rbp)
.L37:
	addl	$1, -48(%rbp)
.L35:
	movl	-48(%rbp), %eax
	cmpl	16(%rbp), %eax
	jl	.L40
	cmpq	$0, -24(%rbp)
	jne	.L41
	call	print_help
	movl	$1, %eax
	jmp	.L50
.L41:
	movq	-24(%rbp), %rax
	leaq	.LC56(%rip), %rdx
	movq	%rax, %rcx
	call	fopen
	movq	%rax, -64(%rbp)
	cmpq	$0, -64(%rbp)
	jne	.L42
	leaq	.LC57(%rip), %rax
	movq	%rax, %rcx
	call	perror
	movl	$1, %eax
	jmp	.L50
.L42:
	cmpq	$0, -32(%rbp)
	je	.L43
	movq	-32(%rbp), %rax
	leaq	.LC58(%rip), %rdx
	movq	%rax, %rcx
	call	fopen
	movq	%rax, -40(%rbp)
	cmpq	$0, -40(%rbp)
	jne	.L43
	leaq	.LC59(%rip), %rax
	movq	%rax, %rcx
	call	perror
	movq	-64(%rbp), %rax
	movq	%rax, %rcx
	call	fclose
	movl	$1, %eax
	jmp	.L50
.L43:
	movq	$0, -56(%rbp)
	jmp	.L44
.L48:
	cmpl	$0, -4(%rbp)
	je	.L45
	cmpl	$0, -12(%rbp)
	jne	.L45
	movq	-40(%rbp), %rcx
	movq	-72(%rbp), %rdx
	leaq	-96(%rbp), %rax
	movq	%rcx, %r8
	movq	%rax, %rcx
	call	print_line_hex
	jmp	.L46
.L45:
	cmpl	$0, -4(%rbp)
	je	.L47
	cmpl	$0, -8(%rbp)
	je	.L47
	movq	-40(%rbp), %r8
	movq	-72(%rbp), %rcx
	movq	-56(%rbp), %rdx
	leaq	-96(%rbp), %rax
	movq	%r8, %r9
	movq	%rcx, %r8
	movq	%rax, %rcx
	call	print_line_full
	jmp	.L46
.L47:
	cmpl	$0, -8(%rbp)
	je	.L46
	cmpl	$0, -4(%rbp)
	jne	.L46
	movq	-40(%rbp), %rcx
	movq	-72(%rbp), %rdx
	leaq	-96(%rbp), %rax
	movq	%rcx, %r8
	movq	%rax, %rcx
	call	print_line_ascii
.L46:
	movq	-72(%rbp), %rax
	addq	%rax, -56(%rbp)
.L44:
	movq	-64(%rbp), %rdx
	leaq	-96(%rbp), %rax
	movq	%rdx, %r9
	movl	$16, %r8d
	movl	$1, %edx
	movq	%rax, %rcx
	call	fread
	movq	%rax, -72(%rbp)
	cmpq	$0, -72(%rbp)
	jne	.L48
	movq	-64(%rbp), %rax
	movq	%rax, %rcx
	call	fclose
	movl	$1, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	cmpq	%rax, -40(%rbp)
	je	.L49
	movq	-40(%rbp), %rax
	movq	%rax, %rcx
	call	fclose
.L49:
	movl	$0, %eax
.L50:
	subq	$-128, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.ident	"GCC: (MinGW-W64 x86_64-posix-seh, built by Brecht Sanders) 11.1.0"
	.def	__mingw_vfprintf;	.scl	2;	.type	32;	.endef
	.def	strcmp;	.scl	2;	.type	32;	.endef
	.def	fopen;	.scl	2;	.type	32;	.endef
	.def	perror;	.scl	2;	.type	32;	.endef
	.def	fclose;	.scl	2;	.type	32;	.endef
	.def	fread;	.scl	2;	.type	32;	.endef
