# Dan Bonnett
# CMPSCI 210, Lab 9, PART 1 A
# Due Date: November 16, 2015
# Description: Created the function f to calculate the value of 8w + x
# Honor Code: This work is my own unless otherwise cited.

########  DON'T CHANGE ANYTHING BETWEEN HERE AND THE NEXT "########" COMMENT
	.data
	.align	2
w:	.word	77		# See problem description
x:	.word	-14		# See problem description
y:	.word	89		# See problem description

	.text
	li	$s0,9999	# Dummy value to test that s0 gets restored
	li	$s1,-99999	# Dummy value to test that s1 gets restored
	lw	$a0,w		# Pass w to f in register a0
	lw	$a1,x		# Pass x to f in register a1
	lw	$a2,y		# Pass y to f in register a2
	jal	f		# Call function f
	
	move	$a0,$v0		# Print the result returned from f in register v0
	li	$v0,1
	syscall
	
	li	$v0,10		# Normal program termination
	syscall
########  DON'T CHANGE ANYTHING BETWEEN HERE AND THE PREVIOUS "########" COMMENT
	
f:	sll	$a0, $a0, 3	# perform a logical left shift of 3 on the contents of $a0 (same as multiplying by 8)
	add	$a0, $a0, $a1	# add the contents of $a0 and $a1, placing the result in $a0
	move	$v0, $a0	# move the contents of $a0 into $v0
	jr	$ra		# return
