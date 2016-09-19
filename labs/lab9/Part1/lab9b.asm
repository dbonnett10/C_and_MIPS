# Dan Bonnett
# CMPSCI 210, Lab 9, PART 1 B
# Due Date: November 16, 2015
# Description: Use function f to calculate (w & (x/4)) | (y & 37). Use a shift operator to do the
# division; use an “immediate” instruction to do the final “&” operation
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

f:	sra	$a1, $a1, 2	# this computes (x/4) and places that value in $a1
	and	$a0, $a0, $a1	# $a0 AND $a1, saved in $a0
	andi	$a2, $a2, 37	# $a2 AND 37, saved in $a2
	or	$a0, $a0, $a2	# $a0 OR $a2, saved in $a0
	move	$v0, $a0	# $v0 = $a0
	jr	$ra		# return
	
