# Dan Bonnett
# CMPSCI 210, Lab 9, PART 1 C
# Due Date: November 16, 2015
# Description: Using the stack to perform the computation (w & (x/4)) | (y & 37)
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

f:	addi	$sp, $sp, -16	# make room for 4 words on the stack
	sw	$a0, 0($sp)	# store register $a0 on the stack
	sw	$a1, 4($sp)	# store register $a1 on the stack
	sw	$a2, 8($sp)	# store register $a2 on the stack
	sw	$ra, 12($sp)	# store register $ra on the stack
	
	srl	$a1, $a1, 2	# this divides the value of $a1 by 4
	and	$a0, $a0, $a1	# places the value of $a0 AND $a1 into register $a0
	andi	$a2, $a2, 37	# places the value of y AND 37 into register $a2
	or	$a0, $a0, $a2	# places the value of $a0 OR $a2 into register $a0
	
	lw	$a0, 0($sp)	# restore $a0
	lw	$a1, 4($sp)	# restore $a1
	lw	$a2, 8($sp)	# restore $a2
	lw	$ra, 12($sp)	# restore $ra
	addi	$sp, $sp, 16	# close the stack
	move	$v0, $a0	# move $a0 into $v0
	jr	$ra		# return
	
