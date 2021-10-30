.data
	myArray: .space	12	# 12 bytes in order to store 4 integers because 3 bytes * 4 = 12
	newLine: .asciiz "\n"	# new line
.text
	addi $s0, $zero, 4	# Store some values into $s0-$s2 registers: 4, 10, 12
	addi $s1, $zero, 10	
	addi $s2, $zero, 12
	
	# Index = $t0		
	addi $t0, $zero, 0	# $t0 is counter register, index, location, offset
				# Clear $t0 as 0
	
	# STORING VALUES INTO ARRAY
	sw $s0, myArray($t0)	# Get the value 4 which is stored in $s0, and store it into the label myArray($t0)
	addi $t0, $t0, 4	# Increment array to second position, second index, second byte partition
	
	sw $s1, myArray($t0)	# Store next value, 10, into myArray
	addi $t0, $t0, 4	# Increment counter, index, location, offset into third location
	
	sw $s2, myArray($t0)	# Store next value in third location
				# We do not need to increment anymore, we do not have any space anymore as we used up all 12 bytes
				
	# LOADING VALUES FROM ARRAY
	lw $t6, myArray($zero)	# Load word gets value at location specified in RAM
				# We use $t6 as our register\container to hold the value, 
				# and we extract the value from location the first location of myArray aka myArray($zero)

	li $v0, 1		# Ready system call to print_int by storing 1 into $v0
	addi $a0, $t6, 0	# Add value from $t6 into $a0, as if we are moving it to $a0, in order to prepare it for syscall
	syscall			# Print from second location of array
	
	li $v0, 4		# li system call 4 in to print a string, in order to create a new line
	la $a0, newLine		# la because we are loading address of string newLine
	syscall
	
	addi $t0, $zero, 0	# Reset counter back to zero in order to use again
	addi $t0, $t0, 4	# Increment counter
	
	lw $t6, myArray($t0)	# Load value at next location in $t6
	li $v0, 1		# Ready system call to print int
	addi $a0, $t6, 0	# Move $t6 into $a0
	syscall
	
	li $v0, 4		# Ready system call to print the new line again
	la $a0, newLine		# la because we are loading address of string newLine
	syscall
	
	addi $t0, $t0, 4	# Increment counter to third, last position of array
	lw $t6, myArray($t0)	# Store value at third position of array into $t6
	li $v0, 1
	addi $a0, $t6, 0	# Move value into $a0
	syscall
		
																					
	li $v0, 10		# System call 10 to exit
	syscall			# The final system call which executes the termination of the program. Thank you progam.
