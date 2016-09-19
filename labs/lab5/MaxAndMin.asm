#******************************************
#Dan Bonnett
#COMPSCI 210 Lab 5, Part 2
#Due Date: Monday, October 5, 2015
#This program prompts the user to enter an integer of value n. The user is then asked to enter n more integers, and the program will print out the maximum integer and minimum integer
#Honor Code: This work is my own unless other wise cited
#******************************************

	 .data
prompt:  .asciiz "Enter an integer between 1-20 \n"
txt:     .asciiz "Enter "
msg:	 .asciiz " integers (one per line): \n"
nl:	 .asciiz "\n"
MAX:	 .asciiz "The maximum value is: "
MIN:	 .asciiz "The minimum value is: "


	.text
	la $a0,prompt	# ask user to enter integer
	li $v0,4		# print_string
	syscall
	
	li $v0, 5		# read_int
	syscall
	add $s0, $zero, $v0	# put the first integer in $s0
	
	# print a new line
 	la $a0, nl
 	li $v0, 4
 	syscall
 	
 	#print the word "Enter"
 	la $a0, txt
 	li $v0, 4
 	syscall
 	
 	#print the value of $s0, which is the value entered by the user
 	move $a0, $s0
 	li $v0, 1
 	syscall
 	
 	# store the loop counter in t2
 	move $t2, $a0
 	
 	#print the rest of the instruction 
 	la $a0, msg
 	li $v0, 4
 	syscall
 	
 	
 	# read in the first integer
 	li $v0, 5
 	syscall
 	
 	# set that first integer in s0 and s1
 	move $s0, $v0
 	move $s1, $s0
 	
 	addi $t2, $t2, -1	# a = a - 1
 	
 loop:  beq  $zero, $t2, done	# if the loop counter is equal to zero, we are done
 
 
 	# read in the next user input
 	li $v0, 5		# the next integer being condsidered is in v0
 	syscall
 	
 	slt $t0, $v0, $s0	# beginning of the check to see if the new value is less than the old value
 	bne $zero, $t0, min	# if the value in t0 is not 0, then the new value is less than the old value, and we go to min
 	beq $zero, $t0, getMax  # if the value in t0 is 0, then the new value is greater than the old value and we go to getMax
 	
 min:	move $s0, $v0		# min value in s1
 
 
 	#calculate the max
getMax: slt $t0, $s1, $v0	# check if the old value is less than the new value
 	 bne $zero, $t0, max	# if the old value is less than the new value, we go to max
  	 beq $zero, $t0, next	# if the old value is greater than the new value, we go to next
	 
max:	move $s1, $v0		# set new max

next:   addi $t2, $t2, -1
	j loop 	
 	
 	  
 	# print out the values
done:   la $a0, MIN
	li $v0, 4
	syscall		#print the MIN message
	
	move $a0, $s0
	li $v0, 1
	syscall		
	
	# print a new line
 	la $a0, nl
 	li $v0, 4
 	syscall
	
	la $a0, MAX
	li $v0, 4
	syscall		#print the MAX message
	
	move $a0, $s1
	li $v0, 1
	syscall
 	
 	
	#end the program
	li	$v0,10
	syscall
