.data 
	strArray:	.asciiz "\nHELLO, TWITTER PEOPLE"
	newLine:	.asciiz "\n"

.text 

main:
	la $s0, strArray	# Set $s0 as pointer to str
	add $s1, $0, $0		# Set $s1 as counter as 0
	
	lb $t0, 0($s0)		# Get char
	beq $t0, $0, end	# Check if null, if so go to end branch


loop:
	li $v0, 11		#print char
	la $a0, 0($t0)
	syscall
	
	li $v0, 4
	la $a0, newLine		# Print new line
	syscall

	addi $s0, $s0, 1	# increment pointer to next char in string, ptr++
	addi $s1, $s1, 1	# increment counter by one, counter++
	lb $t0, 0($s0)		# Get char by the updated pointer
	
	bne $t0, $0, loop	# If condition is not null (0), then continue loop


end:
	li $v0, 8		# Print new line	
	la $a0, newLine	
	syscall
	
	li $v0, 1		# Print string length
	add $a0, $s1, $0
	syscall 
	
	li $v0, 10
	syscall
