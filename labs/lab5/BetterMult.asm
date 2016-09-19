#****************************************************
# Dan Bonnett
# CMPSCI 210, Lab 5, Part 1
# Due Date: Monday, October 5, 2015
# This program is a modification to Professor Roos's slowMult program.
# The slowMult program has been modified to use the smaller of the two integers as the counter for multiplication
# Honor Code: This work is my own unless other wise cited
#****************************************************

	.data
prompt: .asciiz "Enter two positive integers to be multiplied (one per line) \n"

	.text
	
	# Section 1 of program: read in the two integers and save them in registers s0, s1:
	la	$a0,prompt	# ask user to enter values
	li	$v0,4		# print_string
	syscall
	li	$v0,5		# read_int
	syscall
	add	$s0,$zero,$v0	# First integer a in s0
	li	$v0,5		# read_int
	syscall
	add	$s1,$zero,$v0	# Second integer b in s1
	
	
	#Part 2 of the program
	li	$s3, 0			#sum in s3
	slt	$s2, $s0, $s1		#put a 1 in s2 if s0 < s1, put a 0 in s2 if s0 > s1
	bne	$s2, $zero, loop 	#if s2 != 0, do the loop
	add	$t0, $zero, $s0		#t0 now contains the value of $s0
	add	$s0, $zero, $s1		#s0 has now swapped values with s1
	add	$s1, $zero, $t0		#s1 has now swapped values with s0, so s1 now contains the greater value
	
	loop:	beq	$zero,$s0,done	
	add	$s3,$s3,$s1	
	addi	$s0,$s0,-1	
	j	loop
	
	
done:	add	$a0,$zero,$s3	# Copy sum into a0 for pri
	li	$v0,1		# print_int
	syscall
	
	# Section 3: terminate program normally:
	li	$v0,10
	syscall
