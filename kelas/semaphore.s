	.file	"semaphore.c"
	.text
.Ltext0:
	.globl	critical
	.type	critical, @function
critical:
.LFB0:
	.file 1 "semaphore.c"
	.loc 1 11 33
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	.loc 1 12 15
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movq	%rax, -8(%rbp)
.LBB2:
	.loc 1 13 14
	movq	$0, -16(%rbp)
	.loc 1 13 2
	jmp	.L2
.L3:
	.loc 1 14 19 discriminator 3
	movq	-24(%rbp), %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	.loc 1 14 3 discriminator 3
	movsbl	%al, %eax
	movl	%eax, %edi
	call	putchar@PLT
	.loc 1 13 30 discriminator 3
	addq	$1, -16(%rbp)
.L2:
	.loc 1 13 2 discriminator 1
	movq	-16(%rbp), %rax
	cmpq	-8(%rbp), %rax
	jb	.L3
.LBE2:
	.loc 1 16 2
	movl	$10, %edi
	call	putchar@PLT
	.loc 1 17 1
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	critical, .-critical
	.comm	sem,8,8
	.globl	delay
	.type	delay, @function
delay:
.LFB1:
	.loc 1 29 1
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movl	%edi, -20(%rbp)
	.loc 1 31 9
	movl	-20(%rbp), %eax
	imull	$1000, %eax, %eax
	movl	%eax, -12(%rbp)
	.loc 1 34 26
	call	clock@PLT
	movq	%rax, -8(%rbp)
	.loc 1 37 11
	nop
.L5:
	.loc 1 37 12 discriminator 1
	call	clock@PLT
	.loc 1 37 33 discriminator 1
	movl	-12(%rbp), %edx
	movslq	%edx, %rcx
	movq	-8(%rbp), %rdx
	addq	%rcx, %rdx
	.loc 1 37 11 discriminator 1
	cmpq	%rdx, %rax
	jl	.L5
	.loc 1 39 1
	nop
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	delay, .-delay
	.globl	wait
	.type	wait, @function
wait:
.LFB2:
	.loc 1 41 23
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%rdi, -40(%rbp)
	.loc 1 41 23
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	.loc 1 42 2
	nop
.L7:
	.loc 1 42 2 is_stmt 0 discriminator 1
	movq	-40(%rbp), %rax
	leaq	4(%rax), %rdx
	movl	$1, %eax
	xchgb	(%rdx), %al
	testb	%al, %al
	jne	.L7
	.loc 1 44 8 is_stmt 1
	nop
.L8:
.LBB3:
	.loc 1 44 9 discriminator 1
	movq	-40(%rbp), %rax
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	movl	(%rax), %eax
	movl	%eax, -20(%rbp)
	movl	-20(%rbp), %eax
.LBE3:
	.loc 1 44 8 discriminator 1
	testl	%eax, %eax
	jle	.L8
	.loc 1 45 2
	movq	-40(%rbp), %rax
	lock subl	$1, (%rax)
	.loc 1 47 2
	movq	-40(%rbp), %rax
	addq	$4, %rax
	movl	$0, %edx
	movb	%dl, (%rax)
	mfence
	.loc 1 48 9
	movl	$0, %eax
	.loc 1 49 1
	movq	-8(%rbp), %rcx
	xorq	%fs:40, %rcx
	je	.L10
	call	__stack_chk_fail@PLT
.L10:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	wait, .-wait
	.globl	signal
	.type	signal, @function
signal:
.LFB3:
	.loc 1 51 25
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	.loc 1 53 9
	movq	-8(%rbp), %rax
	movl	$1, %edx
	lock xaddl	%edx, (%rax)
	movl	%edx, %eax
	.loc 1 54 1
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	signal, .-signal
	.section	.rodata
.LC0:
	.string	"Flag = %d\n"
	.text
	.globl	pingpong
	.type	pingpong, @function
pingpong:
.LFB4:
	.loc 1 56 27
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%rdi, -40(%rbp)
	.loc 1 56 27
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	.loc 1 57 9
	movq	-40(%rbp), %rax
	movq	%rax, -16(%rbp)
.L14:
.LBB4:
	.loc 1 59 20 discriminator 1
	movl	sem(%rip), %eax
	movl	%eax, -28(%rbp)
	.loc 1 59 7 discriminator 1
	movl	-28(%rbp), %eax
	movl	%eax, -20(%rbp)
	.loc 1 60 3 discriminator 1
	leaq	sem(%rip), %rdi
	call	wait
	.loc 1 61 3 discriminator 1
	movq	sem(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC0(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 62 3 discriminator 1
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	critical
	.loc 1 63 16 discriminator 1
	movl	sem(%rip), %eax
	movl	%eax, -24(%rbp)
	.loc 1 63 8 discriminator 1
	movl	-24(%rbp), %eax
	movl	%eax, -20(%rbp)
	.loc 1 64 3 discriminator 1
	movl	$100, %edi
	call	delay
	.loc 1 65 3 discriminator 1
	leaq	sem(%rip), %rdi
	call	signal
	.loc 1 66 3 discriminator 1
	movq	sem(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC0(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
.LBE4:
	.loc 1 58 11 discriminator 1
	jmp	.L14
	.cfi_endproc
.LFE4:
	.size	pingpong, .-pingpong
	.section	.rodata
.LC1:
	.string	"ping"
.LC2:
	.string	"pong"
	.text
	.globl	main
	.type	main, @function
main:
.LFB5:
	.loc 1 70 12
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	.loc 1 70 12
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	.loc 1 71 2
	movq	stdout(%rip), %rax
	movl	$0, %ecx
	movl	$2, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	setvbuf@PLT
.LBB5:
	.loc 1 73 2
	leaq	sem(%rip), %rax
	movq	%rax, -16(%rbp)
	movl	$1, -24(%rbp)
	movl	-24(%rbp), %eax
	movl	%eax, %edx
	movq	-16(%rbp), %rax
	movl	%edx, (%rax)
.LBE5:
	.loc 1 76 2
	leaq	-32(%rbp), %rax
	leaq	.LC1(%rip), %rcx
	leaq	pingpong(%rip), %rdx
	movl	$0, %esi
	movq	%rax, %rdi
	call	pthread_create@PLT
	.loc 1 77 2
	leaq	-24(%rbp), %rax
	leaq	.LC2(%rip), %rcx
	leaq	pingpong(%rip), %rdx
	movl	$0, %esi
	movq	%rax, %rdi
	call	pthread_create@PLT
.L17:
	.loc 1 78 2 discriminator 1
	jmp	.L17
	.cfi_endproc
.LFE5:
	.size	main, .-main
.Letext0:
	.file 2 "/usr/include/x86_64-linux-gnu/bits/types.h"
	.file 3 "/usr/lib/gcc/x86_64-linux-gnu/9/include/stddef.h"
	.file 4 "/usr/include/x86_64-linux-gnu/bits/types/clock_t.h"
	.file 5 "/usr/include/time.h"
	.file 6 "/usr/include/x86_64-linux-gnu/bits/pthreadtypes.h"
	.file 7 "/usr/include/x86_64-linux-gnu/bits/types/struct_FILE.h"
	.file 8 "/usr/include/x86_64-linux-gnu/bits/types/FILE.h"
	.file 9 "/usr/include/stdio.h"
	.file 10 "/usr/lib/gcc/x86_64-linux-gnu/9/include/stdatomic.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x5c6
	.value	0x4
	.long	.Ldebug_abbrev0
	.byte	0x8
	.uleb128 0x1
	.long	.LASF74
	.byte	0xc
	.long	.LASF75
	.long	.LASF76
	.quad	.Ltext0
	.quad	.Letext0-.Ltext0
	.long	.Ldebug_line0
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.long	.LASF0
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.long	.LASF1
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.long	.LASF2
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF3
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.long	.LASF4
	.uleb128 0x2
	.byte	0x2
	.byte	0x5
	.long	.LASF5
	.uleb128 0x3
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x4
	.long	0x57
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.long	.LASF6
	.uleb128 0x5
	.long	.LASF7
	.byte	0x2
	.byte	0x98
	.byte	0x19
	.long	0x63
	.uleb128 0x5
	.long	.LASF8
	.byte	0x2
	.byte	0x99
	.byte	0x1b
	.long	0x63
	.uleb128 0x5
	.long	.LASF9
	.byte	0x2
	.byte	0x9c
	.byte	0x1b
	.long	0x63
	.uleb128 0x6
	.byte	0x8
	.uleb128 0x7
	.byte	0x8
	.long	0x96
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.long	.LASF10
	.uleb128 0x8
	.long	0x96
	.uleb128 0x5
	.long	.LASF11
	.byte	0x3
	.byte	0xd1
	.byte	0x17
	.long	0x42
	.uleb128 0x5
	.long	.LASF12
	.byte	0x4
	.byte	0x7
	.byte	0x13
	.long	0x82
	.uleb128 0x7
	.byte	0x8
	.long	0x9d
	.uleb128 0x9
	.long	0x90
	.long	0xd0
	.uleb128 0xa
	.long	0x42
	.byte	0x1
	.byte	0
	.uleb128 0xb
	.long	.LASF13
	.byte	0x5
	.byte	0x9f
	.byte	0xe
	.long	0xc0
	.uleb128 0xb
	.long	.LASF14
	.byte	0x5
	.byte	0xa0
	.byte	0xc
	.long	0x57
	.uleb128 0xb
	.long	.LASF15
	.byte	0x5
	.byte	0xa1
	.byte	0x11
	.long	0x63
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF16
	.uleb128 0x5
	.long	.LASF17
	.byte	0x6
	.byte	0x1b
	.byte	0x1b
	.long	0x42
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.long	.LASF18
	.uleb128 0xc
	.long	.LASF77
	.byte	0xd8
	.byte	0x7
	.byte	0x31
	.byte	0x8
	.long	0x295
	.uleb128 0xd
	.long	.LASF19
	.byte	0x7
	.byte	0x33
	.byte	0x7
	.long	0x57
	.byte	0
	.uleb128 0xd
	.long	.LASF20
	.byte	0x7
	.byte	0x36
	.byte	0x9
	.long	0x90
	.byte	0x8
	.uleb128 0xd
	.long	.LASF21
	.byte	0x7
	.byte	0x37
	.byte	0x9
	.long	0x90
	.byte	0x10
	.uleb128 0xd
	.long	.LASF22
	.byte	0x7
	.byte	0x38
	.byte	0x9
	.long	0x90
	.byte	0x18
	.uleb128 0xd
	.long	.LASF23
	.byte	0x7
	.byte	0x39
	.byte	0x9
	.long	0x90
	.byte	0x20
	.uleb128 0xd
	.long	.LASF24
	.byte	0x7
	.byte	0x3a
	.byte	0x9
	.long	0x90
	.byte	0x28
	.uleb128 0xd
	.long	.LASF25
	.byte	0x7
	.byte	0x3b
	.byte	0x9
	.long	0x90
	.byte	0x30
	.uleb128 0xd
	.long	.LASF26
	.byte	0x7
	.byte	0x3c
	.byte	0x9
	.long	0x90
	.byte	0x38
	.uleb128 0xd
	.long	.LASF27
	.byte	0x7
	.byte	0x3d
	.byte	0x9
	.long	0x90
	.byte	0x40
	.uleb128 0xd
	.long	.LASF28
	.byte	0x7
	.byte	0x40
	.byte	0x9
	.long	0x90
	.byte	0x48
	.uleb128 0xd
	.long	.LASF29
	.byte	0x7
	.byte	0x41
	.byte	0x9
	.long	0x90
	.byte	0x50
	.uleb128 0xd
	.long	.LASF30
	.byte	0x7
	.byte	0x42
	.byte	0x9
	.long	0x90
	.byte	0x58
	.uleb128 0xd
	.long	.LASF31
	.byte	0x7
	.byte	0x44
	.byte	0x16
	.long	0x2ae
	.byte	0x60
	.uleb128 0xd
	.long	.LASF32
	.byte	0x7
	.byte	0x46
	.byte	0x14
	.long	0x2b4
	.byte	0x68
	.uleb128 0xd
	.long	.LASF33
	.byte	0x7
	.byte	0x48
	.byte	0x7
	.long	0x57
	.byte	0x70
	.uleb128 0xd
	.long	.LASF34
	.byte	0x7
	.byte	0x49
	.byte	0x7
	.long	0x57
	.byte	0x74
	.uleb128 0xd
	.long	.LASF35
	.byte	0x7
	.byte	0x4a
	.byte	0xb
	.long	0x6a
	.byte	0x78
	.uleb128 0xd
	.long	.LASF36
	.byte	0x7
	.byte	0x4d
	.byte	0x12
	.long	0x34
	.byte	0x80
	.uleb128 0xd
	.long	.LASF37
	.byte	0x7
	.byte	0x4e
	.byte	0xf
	.long	0x49
	.byte	0x82
	.uleb128 0xd
	.long	.LASF38
	.byte	0x7
	.byte	0x4f
	.byte	0x8
	.long	0x2ba
	.byte	0x83
	.uleb128 0xd
	.long	.LASF39
	.byte	0x7
	.byte	0x51
	.byte	0xf
	.long	0x2ca
	.byte	0x88
	.uleb128 0xd
	.long	.LASF40
	.byte	0x7
	.byte	0x59
	.byte	0xd
	.long	0x76
	.byte	0x90
	.uleb128 0xd
	.long	.LASF41
	.byte	0x7
	.byte	0x5b
	.byte	0x17
	.long	0x2d5
	.byte	0x98
	.uleb128 0xd
	.long	.LASF42
	.byte	0x7
	.byte	0x5c
	.byte	0x19
	.long	0x2e0
	.byte	0xa0
	.uleb128 0xd
	.long	.LASF43
	.byte	0x7
	.byte	0x5d
	.byte	0x14
	.long	0x2b4
	.byte	0xa8
	.uleb128 0xd
	.long	.LASF44
	.byte	0x7
	.byte	0x5e
	.byte	0x9
	.long	0x8e
	.byte	0xb0
	.uleb128 0xd
	.long	.LASF45
	.byte	0x7
	.byte	0x5f
	.byte	0xa
	.long	0xa2
	.byte	0xb8
	.uleb128 0xd
	.long	.LASF46
	.byte	0x7
	.byte	0x60
	.byte	0x7
	.long	0x57
	.byte	0xc0
	.uleb128 0xd
	.long	.LASF47
	.byte	0x7
	.byte	0x62
	.byte	0x8
	.long	0x2e6
	.byte	0xc4
	.byte	0
	.uleb128 0x5
	.long	.LASF48
	.byte	0x8
	.byte	0x7
	.byte	0x19
	.long	0x10e
	.uleb128 0xe
	.long	.LASF78
	.byte	0x7
	.byte	0x2b
	.byte	0xe
	.uleb128 0xf
	.long	.LASF49
	.uleb128 0x7
	.byte	0x8
	.long	0x2a9
	.uleb128 0x7
	.byte	0x8
	.long	0x10e
	.uleb128 0x9
	.long	0x96
	.long	0x2ca
	.uleb128 0xa
	.long	0x42
	.byte	0
	.byte	0
	.uleb128 0x7
	.byte	0x8
	.long	0x2a1
	.uleb128 0xf
	.long	.LASF50
	.uleb128 0x7
	.byte	0x8
	.long	0x2d0
	.uleb128 0xf
	.long	.LASF51
	.uleb128 0x7
	.byte	0x8
	.long	0x2db
	.uleb128 0x9
	.long	0x96
	.long	0x2f6
	.uleb128 0xa
	.long	0x42
	.byte	0x13
	.byte	0
	.uleb128 0xb
	.long	.LASF52
	.byte	0x9
	.byte	0x89
	.byte	0xe
	.long	0x302
	.uleb128 0x7
	.byte	0x8
	.long	0x295
	.uleb128 0xb
	.long	.LASF53
	.byte	0x9
	.byte	0x8a
	.byte	0xe
	.long	0x302
	.uleb128 0xb
	.long	.LASF54
	.byte	0x9
	.byte	0x8b
	.byte	0xe
	.long	0x302
	.uleb128 0x2
	.byte	0x1
	.byte	0x2
	.long	.LASF55
	.uleb128 0x10
	.byte	0x1
	.byte	0xa
	.byte	0xda
	.byte	0x11
	.long	0x33e
	.uleb128 0xd
	.long	.LASF56
	.byte	0xa
	.byte	0xdd
	.byte	0x9
	.long	0x320
	.byte	0
	.byte	0
	.uleb128 0x4
	.long	0x327
	.uleb128 0x10
	.byte	0x8
	.byte	0x1
	.byte	0x13
	.byte	0x12
	.long	0x367
	.uleb128 0x11
	.string	"val"
	.byte	0x1
	.byte	0x14
	.byte	0x16
	.long	0x373
	.byte	0
	.uleb128 0x11
	.string	"mut"
	.byte	0x1
	.byte	0x15
	.byte	0x17
	.long	0x33e
	.byte	0x4
	.byte	0
	.uleb128 0x4
	.long	0x343
	.uleb128 0x2
	.byte	0x4
	.byte	0x5
	.long	.LASF57
	.uleb128 0x4
	.long	0x36c
	.uleb128 0x5
	.long	.LASF58
	.byte	0x1
	.byte	0x16
	.byte	0x3
	.long	0x367
	.uleb128 0x12
	.string	"sem"
	.byte	0x1
	.byte	0x17
	.byte	0x9
	.long	0x378
	.uleb128 0x9
	.byte	0x3
	.quad	sem
	.uleb128 0x13
	.long	.LASF69
	.byte	0x1
	.byte	0x46
	.byte	0x5
	.long	0x57
	.quad	.LFB5
	.quad	.LFE5-.LFB5
	.uleb128 0x1
	.byte	0x9c
	.long	0x414
	.uleb128 0x14
	.long	.LASF79
	.long	0x424
	.uleb128 0x15
	.long	.LASF59
	.byte	0x1
	.byte	0x4a
	.byte	0xc
	.long	0xfb
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x15
	.long	.LASF60
	.byte	0x1
	.byte	0x4b
	.byte	0xc
	.long	0xfb
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x16
	.quad	.LBB5
	.quad	.LBE5-.LBB5
	.uleb128 0x15
	.long	.LASF61
	.byte	0x1
	.byte	0x49
	.byte	0x2
	.long	0x429
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x15
	.long	.LASF62
	.byte	0x1
	.byte	0x49
	.byte	0x2
	.long	0x57
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.byte	0
	.byte	0
	.uleb128 0x9
	.long	0x9d
	.long	0x424
	.uleb128 0xa
	.long	0x42
	.byte	0x4
	.byte	0
	.uleb128 0x8
	.long	0x414
	.uleb128 0x7
	.byte	0x8
	.long	0x5e
	.uleb128 0x17
	.long	.LASF64
	.byte	0x1
	.byte	0x38
	.byte	0x8
	.long	0x8e
	.quad	.LFB4
	.quad	.LFE4-.LFB4
	.uleb128 0x1
	.byte	0x9c
	.long	0x48f
	.uleb128 0x18
	.string	"p"
	.byte	0x1
	.byte	0x38
	.byte	0x18
	.long	0x8e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x19
	.string	"msg"
	.byte	0x1
	.byte	0x39
	.byte	0x9
	.long	0x90
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x16
	.quad	.LBB4
	.quad	.LBE4-.LBB4
	.uleb128 0x15
	.long	.LASF63
	.byte	0x1
	.byte	0x3b
	.byte	0x7
	.long	0x57
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.byte	0
	.byte	0
	.uleb128 0x1a
	.long	.LASF65
	.byte	0x1
	.byte	0x33
	.byte	0x5
	.long	0x57
	.quad	.LFB3
	.quad	.LFE3-.LFB3
	.uleb128 0x1
	.byte	0x9c
	.long	0x4bf
	.uleb128 0x18
	.string	"s"
	.byte	0x1
	.byte	0x33
	.byte	0x16
	.long	0x4bf
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x7
	.byte	0x8
	.long	0x378
	.uleb128 0x17
	.long	.LASF66
	.byte	0x1
	.byte	0x29
	.byte	0x5
	.long	0x57
	.quad	.LFB2
	.quad	.LFE2-.LFB2
	.uleb128 0x1
	.byte	0x9c
	.long	0x525
	.uleb128 0x18
	.string	"s"
	.byte	0x1
	.byte	0x29
	.byte	0x14
	.long	0x4bf
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x16
	.quad	.LBB3
	.quad	.LBE3-.LBB3
	.uleb128 0x15
	.long	.LASF67
	.byte	0x1
	.byte	0x2c
	.byte	0x9
	.long	0x429
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x15
	.long	.LASF68
	.byte	0x1
	.byte	0x2c
	.byte	0x9
	.long	0x57
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.byte	0
	.byte	0
	.uleb128 0x1b
	.long	.LASF70
	.byte	0x1
	.byte	0x1c
	.byte	0x6
	.quad	.LFB1
	.quad	.LFE1-.LFB1
	.uleb128 0x1
	.byte	0x9c
	.long	0x571
	.uleb128 0x1c
	.long	.LASF71
	.byte	0x1
	.byte	0x1c
	.byte	0x10
	.long	0x57
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x15
	.long	.LASF72
	.byte	0x1
	.byte	0x1f
	.byte	0x9
	.long	0x57
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x15
	.long	.LASF73
	.byte	0x1
	.byte	0x22
	.byte	0xd
	.long	0xae
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x1d
	.long	.LASF80
	.byte	0x1
	.byte	0xb
	.byte	0x6
	.quad	.LFB0
	.quad	.LFE0-.LFB0
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x18
	.string	"str"
	.byte	0x1
	.byte	0xb
	.byte	0x1c
	.long	0xba
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x19
	.string	"len"
	.byte	0x1
	.byte	0xc
	.byte	0x9
	.long	0xa2
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x16
	.quad	.LBB2
	.quad	.LBE2-.LBB2
	.uleb128 0x19
	.string	"i"
	.byte	0x1
	.byte	0xd
	.byte	0xe
	.long	0xa2
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1b
	.uleb128 0xe
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x10
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0x35
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x13
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x13
	.byte	0x1
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2116
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x34
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x16
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.byte	0
	.byte	0
	.uleb128 0x17
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2116
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x18
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x19
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x1a
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1b
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2116
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1c
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x1d
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2116
	.uleb128 0x19
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_aranges,"",@progbits
	.long	0x2c
	.value	0x2
	.long	.Ldebug_info0
	.byte	0x8
	.byte	0
	.value	0
	.value	0
	.quad	.Ltext0
	.quad	.Letext0-.Ltext0
	.quad	0
	.quad	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF7:
	.string	"__off_t"
.LASF20:
	.string	"_IO_read_ptr"
.LASF32:
	.string	"_chain"
.LASF11:
	.string	"size_t"
.LASF38:
	.string	"_shortbuf"
.LASF26:
	.string	"_IO_buf_base"
.LASF16:
	.string	"long long unsigned int"
.LASF41:
	.string	"_codecvt"
.LASF15:
	.string	"__timezone"
.LASF18:
	.string	"long long int"
.LASF4:
	.string	"signed char"
.LASF79:
	.string	"__PRETTY_FUNCTION__"
.LASF33:
	.string	"_fileno"
.LASF21:
	.string	"_IO_read_end"
.LASF62:
	.string	"__atomic_store_tmp"
.LASF6:
	.string	"long int"
.LASF19:
	.string	"_flags"
.LASF27:
	.string	"_IO_buf_end"
.LASF36:
	.string	"_cur_column"
.LASF75:
	.string	"semaphore.c"
.LASF35:
	.string	"_old_offset"
.LASF40:
	.string	"_offset"
.LASF12:
	.string	"clock_t"
.LASF60:
	.string	"pong"
.LASF49:
	.string	"_IO_marker"
.LASF52:
	.string	"stdin"
.LASF2:
	.string	"unsigned int"
.LASF44:
	.string	"_freeres_buf"
.LASF56:
	.string	"__val"
.LASF3:
	.string	"long unsigned int"
.LASF24:
	.string	"_IO_write_ptr"
.LASF1:
	.string	"short unsigned int"
.LASF51:
	.string	"_IO_wide_data"
.LASF28:
	.string	"_IO_save_base"
.LASF67:
	.string	"__atomic_load_ptr"
.LASF9:
	.string	"__clock_t"
.LASF39:
	.string	"_lock"
.LASF80:
	.string	"critical"
.LASF34:
	.string	"_flags2"
.LASF46:
	.string	"_mode"
.LASF53:
	.string	"stdout"
.LASF58:
	.string	"mysem_t"
.LASF73:
	.string	"start_time"
.LASF25:
	.string	"_IO_write_end"
.LASF78:
	.string	"_IO_lock_t"
.LASF77:
	.string	"_IO_FILE"
.LASF14:
	.string	"__daylight"
.LASF57:
	.string	"atomic_int"
.LASF71:
	.string	"number_of_seconds"
.LASF31:
	.string	"_markers"
.LASF17:
	.string	"pthread_t"
.LASF55:
	.string	"_Bool"
.LASF0:
	.string	"unsigned char"
.LASF70:
	.string	"delay"
.LASF5:
	.string	"short int"
.LASF74:
	.string	"GNU C17 9.3.0 -mtune=generic -march=x86-64 -g -O0 -pedantic-errors -std=c17 -fasynchronous-unwind-tables -fstack-protector-strong -fstack-clash-protection -fcf-protection"
.LASF63:
	.string	"flag"
.LASF37:
	.string	"_vtable_offset"
.LASF48:
	.string	"FILE"
.LASF65:
	.string	"signal"
.LASF10:
	.string	"char"
.LASF68:
	.string	"__atomic_load_tmp"
.LASF72:
	.string	"milli_seconds"
.LASF66:
	.string	"wait"
.LASF50:
	.string	"_IO_codecvt"
.LASF8:
	.string	"__off64_t"
.LASF22:
	.string	"_IO_read_base"
.LASF30:
	.string	"_IO_save_end"
.LASF61:
	.string	"__atomic_store_ptr"
.LASF59:
	.string	"ping"
.LASF45:
	.string	"__pad5"
.LASF47:
	.string	"_unused2"
.LASF54:
	.string	"stderr"
.LASF29:
	.string	"_IO_backup_base"
.LASF43:
	.string	"_freeres_list"
.LASF42:
	.string	"_wide_data"
.LASF13:
	.string	"__tzname"
.LASF69:
	.string	"main"
.LASF23:
	.string	"_IO_write_base"
.LASF64:
	.string	"pingpong"
.LASF76:
	.string	"/home/jessica/sisop/kelas"
	.ident	"GCC: (Ubuntu 9.3.0-17ubuntu1~20.04) 9.3.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	 1f - 0f
	.long	 4f - 1f
	.long	 5
0:
	.string	 "GNU"
1:
	.align 8
	.long	 0xc0000002
	.long	 3f - 2f
2:
	.long	 0x3
3:
	.align 8
4:
