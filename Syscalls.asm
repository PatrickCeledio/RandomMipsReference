.data
	
	Student: .asciiz "Name: Patrick James Celedio"
	favWrestler: .asciiz "Favorite Wrestler: Bryan Danielson"
	favDrink: .asciiz "Favorite Drink: Coffee"
	newLine: .asciiz "\n"
	
.text
main:

	# Syscall to print Student label holding string "Patrick James Celedio"
	li $v0, 4
	la $a0, Student		# Pointer to Student
	syscall
	
	la $a0, newLine		# Set $a0 as new line to print out new line
	syscall
	
	la $a0, favWrestler	# Pointer to favWrestler
	syscall
	
	la $a0, newLine		# Pointer to newLine
	syscall
	
	la $a0, favDrink	# Pointer to favDrink
	syscall