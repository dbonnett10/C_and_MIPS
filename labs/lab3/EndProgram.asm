#Dan Bonnett
#CMPSCI 210 Lab3 Part 3
#Due Date: 9/21/2015
#Honor Code: The work I am submitting is mine unless otherwise cited
#Performing the calculation: x = 7 * y for y = 13 and terminating the program properly

	.data
	.align 2
	
y:	.word 13	# 4 bytes of memory containing the integer 13
x:	.space 4	# 4 bytes of memory

	.text
	
	lw $t0, y 	# load contents of memory address y into $t0
	add $t1, $t0, $t0	# $t1 now contains the integer 26
	add $t1, $t1, $t0	# $t1 now contains 26 + 13 so 39
	add $t1, $t1, $t1	# $t1 now contains 39 + 39 so 78
	add $t1, $t1, $t0	# $t1 now contains 78 + 13 so 91, which is our end result 
	
	sw $t1, x		# store the final result ($t1) in x
	
	li $v0,10
	syscall