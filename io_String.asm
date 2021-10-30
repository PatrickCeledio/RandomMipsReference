# String input and output in mips

.data
	prompt1:	.asciiz		"You are in delim\n"
.text
	la	$a0,	prompt1
	li	$v0,	4
	syscall

	li	$v0,	4
	la	$a0,	newline						# Newline
	syscall