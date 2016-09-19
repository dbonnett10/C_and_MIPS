# Dan Bonnett
# Lab 6, part 3
# Due Date: 10/19/2015
# Description: uses a stack to rotate the elements of an array of size n to the left by 1
# Honor Code: This work is my own unless otherwise cited

	.data
	.align	2
a1:	.word	10,20,30,40	# first array, size 4
a2:	.word	3		# second array, size 1
a3:	.word	11,12,13,14,15,16,17,18,19	# third array, size 9
lab1:	.asciiz	"Unrotated array: "
lab2:	.asciiz	"Rotated array: "
space:	.asciiz	" "
nl:	.asciiz	"\n"

	.text
# First array:
	la	$a0,lab1	# Print label for unrotated array
	li	$v0,4
	syscall
	
	la	$a0,a1		# Print the unrotated array
	li	$a1,4
	jal	aprint
	
########### UNCOMMENT THESE LINES TO CALL YOUR rotl FUNCTION
	la	$a0,a1
	li	$a1,4
	jal	rotate
###########
	
	la	$a0,lab2	# Print label for rotated array
	li	$v0,4
	syscall
	
	la	$a0,a1		# Print the rotated array
	li	$a1,4
	jal	aprint
# Second array:
	la	$a0,lab1	# Print label for unrotated array
	li	$v0,4
	syscall
	
	la	$a0,a2		# Print the unrotated array
	li	$a1,1
	jal	aprint
########### UNCOMMENT THESE LINES TO CALL YOUR rotl FUNCTION
	la	$a0,a2
	li	$a1,1
	jal	rotate
###########
	
	la	$a0,lab2	# Print label for rotated array
	li	$v0,4
	syscall
	
	la	$a0,a2		# Print the rotated array
	li	$a1,1
	jal	aprint
# Third array:
	la	$a0,lab1	# Print label for unrotated array
	li	$v0,4
	syscall
	
	la	$a0,a3		# Print the unrotated array
	li	$a1,9
	jal	aprint
########### UNCOMMENT THESE LINES TO CALL YOUR rotl FUNCTION
	la	$a0,a3
	li	$a1,9
	jal	rotate
###########
	
	la	$a0,lab2	# Print label for rotated array
	li	$v0,4
	syscall
	
	la	$a0,a3		# Print the rotated array
	li	$a1,9
	jal	aprint
	
	li	$v0,10		# Terminate program
	syscall	

#########################################################
############ Function aprint:
############    prints array at address a0 of length a1
#########################################################

aprint:	addi	$sp,$sp,-8	# Save $s0 and $s1 on the stack
	sw	$s0,0($sp)
	sw	$s1,4($sp)
	
	move	$s0,$a0		# Save a0 in s0--we need a0 for syscalls
	li	$s1,0		# s1 is our loop counter
loop:	slt	$t0,$s1,$a1	# See if we're done yet
	beq	$t0,$zero,done	# exit loop if s1 >= a1 (i.e., if counter >= array size)
	lw	$a0,0($s0)	# Print next array element:
	li	$v0,1
	syscall
	
	la	$a0,space	# Print a space after the array element:
	li	$v0,4
	syscall
	
	addi	$s0,$s0,4	# Move forward to next array value (4 bytes per int)
	addi	$s1,$s1,1	# Increment the loop counter
	j	loop
	
done:	la	$a0,nl		# Print a newline:
	li	$v0,4
	syscall
	
	lw	$s0,0($sp)	# Restore the old values of s0, s1
	lw	$s1,4($sp)
	addi	$sp,$sp,8
	
	jr	$ra		# Finished--return to caller

############################################################################

rotate: 
        addi $sp, $sp, -8	# creates the stack
	sw $s0, 0($sp)		# sets $s0 to be the first item in the stack
	sw $s1, 4($sp)		# sets $s1 to be the second item in the stack

	li $s1, 0		# s1 is going to be our loop counter, with an intitial value of 0
	move $s0, $a0		# place the address of $a0 into $s0
	sub $t1, $a1, 1		# subtract 1 from the array size
	lw $t2, 0($s0)		# the first value of $s0 will now be in register $t2
	
rot:	slt  $t0, $s1, $a1       # checks if our counter is less than the array size
	beq  $zero, $t0, finish  # go to finish if our loop counter is >= array size (4)
	bne  $s1, $t1, loop2	 # if the counter is not equal to 3, go to loop2
	
	
	
loop2:	addi $s0, $s0, 4	# adding 4 to the address of $s0 to get the next index in the array (so n+1)
	lw   $t3, 0($s0)	# load the value of the second index of the array in register t3
	addi $s0, $s0, -4	# go back to the first index of the array
	sw   $t3, 0($s0)	# store the value of the second array element in the first index of the array.
	addi $s0, $s0, 4	#increase index by 1, so n+1
	
	addi $s1, $s1, 1	# increment the loop counter by 1
	j rot			# jump back to rot

	
finish: addi $s0, $s0, -4	# decrement the array index by 4 so that we are at the end of the array
        sw $t2, 0($s0)		# store the temp value into the last index of the array


	lw   $s0,0($sp) 	# Return $s0 back to its original value
	lw   $s1,4($sp)		# Return $s1 back to its original value, at the second array index
	addi $sp,$sp,8		# finishes restoring the stack
	jr   $ra		# Finished--return to caller	

 
############################################################################
		












