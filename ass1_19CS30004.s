	.file	"ass1_19CS30004.c"                                    #Source filename
	.text
	.section	.rodata                                       #read-only data section
	.align 8                                                      #align with 8 byte boundary
.LC0:                                                                 #label of f-string - 1st printf
	.string	"Enter how many elements you want:"
.LC1:                                                                 #label of f-string - 1st scanf
	.string	"%d"
.LC2:                                                                 #label of f-string - 2nd scanf
	.string	"Enter the %d elements:\n"
.LC3:                                                                 #label of f-string - 2nd printf
	.string	"\nEnter the item to search"
.LC4:                                                                 #label of f-string - 3rd printf
	.string	"\n%d found in position: %d\n"
	.align 8
.LC5:                                                                 
	.string	"\nItem is not present in the list."
	.text                                                         #code starts
	.globl	main                                                  #main is a global name
	.type	main, @function                                       #main is a function
main:                                                        #main starts
.LFB0:
	.cfi_startproc                                               #Call Frame Information
	pushq	%rbp                                                 #save old base pointer
	.cfi_def_cfa_offset 16                                       
	.cfi_offset 6, -16                                           
	movq	%rsp, %rbp                                           #rbp <-- rsp 
	.cfi_def_cfa_register 6                                      
	subq	$432, %rsp                                           #create space for local arrays and variables 
	movq	%fs:40, %rax                                         # Segment addressing
	movq	%rax, -8(%rbp)                                       
	xorl	%eax, %eax                                           # Clear eax
	leaq	.LC0(%rip), %rdi
	call	puts@PLT                                             #calls puts
	leaq	-432(%rbp), %rax                                     #rax <-- (rbp-432) 
	movq	%rax, %rsi                                           #rsi <-- rax 
	leaq	.LC1(%rip), %rdi
	movl	$0, %eax                                             #eax <-- 0 
	call	__isoc99_scanf@PLT                                   #calls scanf, return value is stored in eax
	movl	-432(%rbp), %eax                                     #eax <-- M[rbp-432] 
	movl	%eax, %esi                                           #esi <-- eax 
	leaq	.LC2(%rip), %rdi
	movl	$0, %eax                                             #eax <-- 0 
	call	printf@PLT                                           #calls printf
	movl	$0, -424(%rbp)                                       #M[rbp-424] <-- 0 
	jmp	.L2                                                     
.L3:
	leaq	-416(%rbp), %rax                                     #rax <-- (rbp-416) 
	movl	-424(%rbp), %edx                                     #edx <-- M[rbp-424] 
	movslq	%edx, %rdx
	salq	$2, %rdx
	addq	%rdx, %rax
	movq	%rax, %rsi                                           #rsi <-- rax 
	leaq	.LC1(%rip), %rdi
	movl	$0, %eax                                             #eax <-- 0 
	call	__isoc99_scanf@PLT                                   #calls scanf, return value is stored in eax
	addl	$1, -424(%rbp)
.L2:
	movl	-432(%rbp), %eax                                     #eax <-- M[rbp-432]
	cmpl	%eax, -424(%rbp)
	jl	.L3
	movl	-432(%rbp), %edx                                      #edx <-- M[rbp-432]
	leaq	-416(%rbp), %rax                                      #rax <-- (rbp-416) 
	movl	%edx, %esi                                            #esi <-- edx 
	movq	%rax, %rdi                                            #rdi <-- rax               
	call	inst_sort                                         
	leaq	.LC3(%rip), %rdi
	call	puts@PLT                                              #calls puts
	leaq	-428(%rbp), %rax                                      #rax <-- (rbp-428)
	movq	%rax, %rsi                                            #rsi <-- rax 
	leaq	.LC1(%rip), %rdi
	movl	$0, %eax                                              #eax <-- 0
	call	__isoc99_scanf@PLT                                    #calls scanf
	movl	-428(%rbp), %edx                                      #edx <-- M[rbp-428]
	movl	-432(%rbp), %ecx                                      #ecx <-- M[rbp-432]
	leaq	-416(%rbp), %rax                                      #rax <-- (rbp-416)
	movl	%ecx, %esi                                            #esi <-- ecx
	movq	%rax, %rdi                                            #rdi <-- rax 
	call	bsearch                                               #calls bsearch
	movl	%eax, -420(%rbp)                                      #M[rbp-420] <-- eax
	movl	-420(%rbp), %eax                                      #eax <-- M[rbp-420]
	cltq
	movl	-416(%rbp,%rax,4), %edx
	movl	-428(%rbp), %eax                                      #eax <-- M[rbp-428]
	cmpl	%eax, %edx
	jne	.L4
	movl	-420(%rbp), %eax                                      #eax <-- M[rbp-420]
	leal	1(%rax), %edx
	movl	-428(%rbp), %eax                                      #eax <-- M[rbp-428]
	movl	%eax, %esi                                            #esi <-- eax
	leaq	.LC4(%rip), %rdi
	movl	$0, %eax                                              #eax <-- 0
	call	printf@PLT                                            #calls printf
	jmp	.L5
.L4:
	leaq	.LC5(%rip), %rdi
	call	puts@PLT                                             #calls put
.L5:
	movl	$0, %eax                                             #eax <-- 0
	movq	-8(%rbp), %rcx                                       #rcx <-- M[rbp-8] 
	xorq	%fs:40, %rcx
	je	.L7
	call	__stack_chk_fail@PLT
.L7:
	leave                                                       #leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.globl	inst_sort                                          #int_sort is a global name
	.type	inst_sort, @function                               #int_sort is a function
inst_sort:
.LFB1:
	.cfi_startproc                                             #Call Frame Information
	pushq	%rbp                                               #save old base pointer
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp                                         #rbp <-- rsp 
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)                                    #M[rbp-24] <-- rdi
	movl	%esi, -28(%rbp)                                    #M[rbp-28] <-- esi
	movl	$1, -8(%rbp)
	jmp	.L9
.L13:
	movl	-8(%rbp), %eax                                     #eax <-- M[rbp-8]
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-24(%rbp), %rax                                    #rax <-- M[rbp-24] 
	addq	%rdx, %rax
	movl	(%rax), %eax                                       #eax <-- rax
	movl	%eax, -4(%rbp)                                     #M[rbp-4] <-- eax
	movl	-8(%rbp), %eax                                     #eax <-- M[rbp-8]
	subl	$1, %eax
	movl	%eax, -12(%rbp)                                    #M[rbp-12] <-- eax
	jmp	.L10
.L12:
	movl	-12(%rbp), %eax                                    #eax <-- M[rbp-12]
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-24(%rbp), %rax                                    #rax <-- M[rbp-24] 
	addq	%rdx, %rax
	movl	-12(%rbp), %edx                                    #edx <-- M[rbp-12]
	movslq	%edx, %rdx
	addq	$1, %rdx
	leaq	0(,%rdx,4), %rcx
	movq	-24(%rbp), %rdx                                    #rdx <-- M[rbp-24] 
	addq	%rcx, %rdx
	movl	(%rax), %eax                                       #eax <-- rax
	movl	%eax, (%rdx)                                       #rdx <-- eax
	subl	$1, -12(%rbp)
.L10:
	cmpl	$0, -12(%rbp)
	js	.L11
	movl	-12(%rbp), %eax                                   #eax <-- M[rbp-12]
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-24(%rbp), %rax                                   #rax <-- M[rbp-24] 
	addq	%rdx, %rax
	movl	(%rax), %eax                                      #eax <-- rax
	cmpl	%eax, -4(%rbp)
	jl	.L12
.L11:
	movl	-12(%rbp), %eax                                  #eax <-- M[rbp-12]
	cltq
	addq	$1, %rax
	leaq	0(,%rax,4), %rdx
	movq	-24(%rbp), %rax                                  #rax <-- M[rbp-24] 
	addq	%rax, %rdx
	movl	-4(%rbp), %eax                                   #eax <-- M[rbp-4]
	movl	%eax, (%rdx)                                     #rdx <-- eax
	addl	$1, -8(%rbp)
.L9:
	movl	-8(%rbp), %eax                                   #eax <-- M[rbp-8] 
	cmpl	-28(%rbp), %eax
	jl	.L13
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	inst_sort, .-inst_sort
	.globl	bsearch                                          #bsearch is a global name
	.type	bsearch, @function                               #bsearch is a function
bsearch:
.LFB2:
	.cfi_startproc                                           #Call Frame Information
	pushq	%rbp                                             #save old pointer
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp                                       #rbp <-- rsp 
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)                                  #M[rbp-24] <-- rdi
	movl	%esi, -28(%rbp)                                  #M[rbp-28] <-- esi
	movl	%edx, -32(%rbp)                                  #M[rbp-32] <-- edx
	movl	$1, -8(%rbp)
	movl	-28(%rbp), %eax                                  #eax <-- M[rbp-28] 
	movl	%eax, -12(%rbp)                                  #M[rbp-12] <-- eax
.L18:
	movl	-8(%rbp), %edx                                   #edx <-- M[rbp-8] 
	movl	-12(%rbp), %eax                                  #eax <-- M[rbp-12] 
	addl	%edx, %eax
	movl	%eax, %edx                                       #edx <-- eax
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	movl	%eax, -4(%rbp)                                   #M[rbp-4] <-- eax
	movl	-4(%rbp), %eax                                   #eax <-- M[rbp-4] 
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-24(%rbp), %rax                                  #rax <-- M[rbp-24] 
	addq	%rdx, %rax
	movl	(%rax), %eax                                     #eax <-- rax
	cmpl	%eax, -32(%rbp)
	jge	.L15
	movl	-4(%rbp), %eax                                   #eax <-- M[rbp-4]
	subl	$1, %eax
	movl	%eax, -12(%rbp)                                  #M[rbp-12] <-- eax
	jmp	.L16
.L15:
	movl	-4(%rbp), %eax                                   #eax <-- M[rbp-4]
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-24(%rbp), %rax                                 #rax <-- M[rbp-24] 
	addq	%rdx, %rax
	movl	(%rax), %eax                                      #eax <-- rax
	cmpl	%eax, -32(%rbp)
	jle	.L16
	movl	-4(%rbp), %eax                                   #eax <-- M[rbp-4]
	addl	$1, %eax
	movl	%eax, -8(%rbp)                                   #M[rbp-8] <-- eax
.L16:
	movl	-4(%rbp), %eax                                   #eax <-- M[rbp-4]
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-24(%rbp), %rax                                  #rax <-- M[rbp-24] 
	addq	%rdx, %rax
	movl	(%rax), %eax                                     #eax <-- rax
	cmpl	%eax, -32(%rbp)
	je	.L17
	movl	-8(%rbp), %eax                                   #eax <-- M[rbp-8]
	cmpl	-12(%rbp), %eax
	jle	.L18
.L17:
	movl	-4(%rbp), %eax                                   #eax <-- M[rbp-4]
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret                                                      #return
	.cfi_endproc
.LFE2:
	.size	bsearch, .-bsearch
	.ident	"GCC: (Ubuntu 7.4.0-1ubuntu1~18.04.1) 7.4.0"
	.section	.note.GNU-stack,"",@progbits
