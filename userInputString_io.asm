.data
	myWord: .byte 0:41
.text
	la $a0, myWord	# Create pointer to myWord label
	li $a1, 9	# reserved 8 - 1 = 7 spaces inside $a1

	li $v0, 8	# read string
	syscall
	
	li $v0, 4	# print string
	syscall
	
	li $v0, 10	# exit
	syscall