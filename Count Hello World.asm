	.data 
str:	.asciiz "Hello world!\n"

	.text
main:	la	$s0,	str
	add 	$s1,	$0,	$0


	lb	$t0,	0($s0)		# pull in a char
	beq	$t0,	$0,	end	# check if null
loop:	addi 	$s0,	$s0,	1	#increment counter and pointer
	addi 	$s1,	$s1,	1

	lb	$t0,	0($s0)		# pull in another char

	
	bne	$t0,	$0,	loop	# loop condition (Not null)
end:	
	li	$v0,	1
	add	$a0,	$s1,	$0	
	syscall
	
	li	$v0,	10		#return
	syscall