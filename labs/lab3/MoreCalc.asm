#Dan Bonnett
#CMPSCI 210 Lab3 Part 2
#Due Date: 9/21/2015
#Honor Code: The work I am submitting is mine unless otherwise cited
#Performing the calculation: x = (a - b) * 3 + (a + b) * 6


	.data
	.align2
	
a:	.word 10	# 4 bytes of memory containing the integer 10
b:	.word -1	# 4 bytes of memory containing the integer -1

x:	.space 4	 	# 4 bytes of memory

	.text
	
	lw $t0, b	# load contents of memory address b into $t0
	lw $t1, a 	# load contents of memory address a into $t1
	sub $t0, $t1, $t0	# register $t0 now contains 10-(-1)
	add $t2, $t0, $t0	# $t2 now contains 22
	add $t0, $t2, $t0	# $t0 now contains 33
	
	lw $t2, b	# load contents of b into $t2
	add $t1, $t1, $t2	# $t1 now contains 10 + (-1)
	add $t1, $t1, $t1	# $t1 now contains 9 + 9 so 18
	add $t2, $t1, $t1	# $t1 now contains 18 + 18 so 36
	add $t2, $t1, $t2	# $t2 now contains 18 + 36 so 54
	
	add $t0, $t0, $t2 	# $t0 now contains 33 + 54 so 87, which is our final result
	
	sw $t0, x		# store the value of $t0 in x