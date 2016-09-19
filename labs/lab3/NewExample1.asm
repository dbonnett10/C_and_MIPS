#Dan Bonnett
#CMPSCI 210 Lab3 Part 4
#Due Date: 9/21/2015
#Honor Code: The work I am submitting is mine unless otherwise cited
#Performing the same operation as in example1.asm but this time with 1 less MIPS instruction. Used the addi intstruction.
#int a = 42
#int b = a + 17		will equal 59

	.data
	.align	2	# just a good idea
a:	.word	42	# 4 bytes of memory containing the integer 42
b:	.space	4	# 4 bytes of memory

	.text
	lw	$t0,a		# load contents of memory address a into $t0
	addi	$t0, $t0, 17
	sw	$t0,b		# store result in address b
	
	
	 
