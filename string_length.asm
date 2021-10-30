	.data
str:	.asciiz	"Hello world!\n"	
	
	.text
main:	la	$s0,	str		# $s0 <- base address
	add	$s1,	$0,	$0	# $s1, counter
	
	lb	$t0,	0($s0)
	
	beq	$t0,	$0,	exit
loop:	addi	$s0,	$s0,	1	# ptr++
	addi	$s1,	$s1,	1	# counter++
	
	lb	$t0,	0($s0)		# load another char in
	
	bne	$t0,	$0,	loop
exit:	li	$v0,	1		# print counter
	add	$a0,	$s1,	$0	
	syscall
	
	li	$v0,	10		#return
	syscall
