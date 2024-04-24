# arithmetic.asm
# A simple calculator program in MIPS Assembly for CS64
#
.data
	promptX: .asciiz "Enter a value for X:"
	promptY: .asciiz "Enter a value for Y:"

.text
main:
	#promptX
	li $v0 4
	li $a0 promptX
	syscall

	#Reads input for promptX and stores inside of $t0
	li $v0 5
	syscall
	move $t0 $v0 

	#promptY
	li $v0 4
	la $a0 promptY
	syscall

	#Reads input for promptY and stores inside of $t1
	li $v0 5
	syscall
	move $t1 $v0
	#Sets $t1 = y input

	#Doing the math for 32 * (x-y/2) + 4 and stores inside of $t4
	sra $t1 $t1 1 #y/2
	sub $t2 $t0 $t1  #x-y/2
	sll $t3 $t2 5  # 32 * (x-y/2)
	add $t4 $t3 4  # 32 * (x -y/2) + 4

	li $v0 1
	move $a0 $t4
	syscall

exit:
	# Exit SPIM: Write your code to exit here!
	li $v0 10
	syscall
