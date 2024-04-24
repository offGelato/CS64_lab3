# conditional.asm
# A conditionally branching program in MIPS Assembly for CS64
#
#  Data Area - allocate and initialize variables
.data
	prompt: .asciiz "Enter an integer: "

#Text Area (i.e. instructions)
.text
main:
	#prompt
	li $v0 4
	la $a0 prompt
	syscall

	#Reads user input from prompt and stores inside of $t0
	li $v0 5
	syscall 
	move $t0 $v0

	#Create bitmask in $t1 to check right two bits of input
	li $t1 3

	#Using the AND function to see if $t0 is divisible by 4 and sotres inside $t2.
	and $t2 $t1 $t0

	#Checking the result of the AND function. If $t2 = 0, then it is divisible. 
	li $t3 0
	beq $t2 $t3 divisible

	#If $t2 != 0, then multiply by 7. Stored in $t5
	li $t4 7 
	mult $t0 $t4
	mflo $t5

	li $v0 1
	move $a0 $t5
	syscall
	j exit
divisible:

	#Multiply by 4. Stored in $t7
	li $t6 4
	mult $t0 $t6
	mflo $7

	li $v0 1
	move $a0 $t7
	syscall
	j exit
exit:
	# Exit SPIM: Write your code here!
	li $v0, 10
	syscall
