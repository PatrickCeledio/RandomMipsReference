	.data
strA:	.asciiz	"Goodbye world!\n"
strB:	.byte	0:50

	.text
main:				# set up arguments
	la	$a0,	strB	# $a0 <- dest ptr
	la	$a1,	strA	# $a1 <- src ptr
	
	jal	strcpy		# call strcpy(...)
	
	li	$v0,	4	# load system call code 4 to print_string
	la	$a0,	strB
	syscall

	li	$v0,	10
	syscall

strcpy:	lb	$t0,	0($a1)
	sb	$t0,	0($a0)
	addi	$a0,	$a0,	1
	addi	$a1,	$a1,	1
	bne	$t0,	$0,	strcpy
	
	jr	$ra		# return
