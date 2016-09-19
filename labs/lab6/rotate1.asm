# Dan Bonnett  
# Lab 6, part 2
# Due Date: 10/19/2015
# Description: Added code to the rotate1 program so that the program rotates the elements of an array to the left by 1
# Honor Code: This work is my own unless otherwise cited


	.data
	.align	2
a1:	.word	10,20,30,40	# the array to be rotated
lab1:	.asciiz	"Unrotated array: "
lab2:	.asciiz	"Rotated array: "
space:	.asciiz	" "
nl:	.asciiz	"\n"


	.text
	la	$a0,lab1	# Print label for unrotated array
	li	$v0,4
	syscall
	
	la	$a0,a1		# Print the unrotated array
	li	$a1,4
	jal	aprint
	
#####################################################################################################################
#  Rotate the array
	li $s1, 0		#s1 is going to be our loop counter, with an intitial value of 0
	la $t4, a1		# load the addess of a1 into $t4
	lw $t1, 0($t4)		# t1 now is equal to 10 and is the temp
	li $t3, 3		# t3 is going to be our n-1
	
rot:	slt  $t0, $s1, $a1       # checks if our counter is less than the array size
	beq  $zero, $t0, finish  # go to finish if our loop counter is >= array size (4)
	bne  $s1, $t3, loop2	 # if the counter is not equal to 3, go to loop2
	
	
	
loop2:	addi $t4, $t4, 4	# add 4 to the address of $t4 to get the second index of the array
	lw   $t2, 0($t4)	# load the value of the second index of the array in register t2
	addi $t4, $t4, -4	# go back to the first index of the array
	sw   $t2, 0($t4)	# store the value of the second array element in the first index of the array.
	addi $t4, $t4, 4	#increase index by 1, so n+1
	
	addi $s1, $s1, 1	# increment the loop counter by 1
	j rot			# jump back to rot

	
finish: addi $t4, $t4, -4	# decrement the array index by 4 so that we are at the end of the array
 	sw $t1, 0($t4)		# store the temp value (10) into the last index of the array

		
#######################################################################################################################
	
	la	$a0,lab2	# Print label for rotated array
	li	$v0,4
	syscall
	
	la	$a0,a1		# Print the rotated array
	li	$a1,4
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
