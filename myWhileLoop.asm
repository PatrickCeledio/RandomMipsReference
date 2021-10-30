# Implementing a while loop in MIPS
# int i = 0 
# while (i<10)
#{
#	i++;
#}
.data 
	message: .asciiz "After while loop is done"
	newLine: .asciiz "\n"
	space:   .asciiz ", "
.text
main:
	# i = 0
	addi $t0, $zero, 0
	
	while:
		bgt $t0, 10, exit	# if value is greater than 10, go to exit branch, exit while loop
		jal printNumber
		addi $t0, $t0, 1	# equivalent to i++ or i = i + 1
		j while			# tell program to jump back to while branch
	exit:
		li $v0, 4
		la $a0, message
		syscall
	# end of program
	li $v0, 10
	syscall
	
printNumber:
	# P
	li $v0, 1
	add $a0, $t0, $zero
	syscall
	
	li $v0, 4
	la $a0, space
	syscall
	
	jr $ra