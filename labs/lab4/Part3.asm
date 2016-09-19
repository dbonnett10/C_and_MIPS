#************************************************************
# Dan Bonnett
# CMPSCI 210 Lab 4, Part 3
# Due: 9/28/2015
# Creating a program that does a variety of different operations with two integers that the user inputs
# Honor Code: This work is my own unless otherwise cited.
#*************************************************************

	.data
	.align	2	# word boundary
a:	.space 4	# 4 bytes of memory
b:	.space 4	# 4 bytes of space
quote:	.asciiz "Enter two integers \n"
nl:     .asciiz  "\n"     # newline character
AND:	.asciiz	"The logical AND is: \n"
OR:	.asciiz "The logical Or is: \n"
XOR:	.asciiz "The logical XOR is: \n"
LS:	.asciiz "The logical left shift of the first int is: \n"
LS2:	.asciiz "The logical left shift of the second int is: \n "
LRS:	.asciiz "The logical right shift of the first int is: \n"
LRS2:	.asciiz "The logical right shift of the second integer is: \n"
AR:	.asciiz "The arithmetic right shift of the first number is: \n"
AR2:	.asciiz "The arithmetic right shift of the second number is: \n"




	.text
	
	
	# message the user
	la $a0, quote	#prompt the user for input
	li $v0, 4	#code for print_string
	syscall		#perform the print
	li $v0, 5	#code for read_int
	syscall		#perform the read
	sw $v0, a	#save it as memory
	
	li $v0, 5 	#code for read_int
	syscall		#perform the read
	sw $v0, b	#save it in memory
	
	
	# find and print the logical and
	la $a0, AND	#load contents of AND into address $a0
	li $v0, 4	#print the string
	syscall		#perform the print
	
	lw $t0, a	#load contents of memory address a into register $t0
	lw $t1, b	#load contents of memory address b into $t1
 	and $a0, $t0, $t1	#perform the logical And operation
 	li $v0, 1	# code for printing integers
 	syscall 	#prints the result
 	
 	# print a new line
 	la $a0, nl
 	li $v0, 4
 	syscall
 	
 	
 	# find and print the logical Or
 	la $a0, OR
 	li $v0, 4
 	syscall		#print the message contained in OR	
 	
 	or $a0, $t0, $t1	#perform the logical Or operation
 	li $v0, 1
 	syscall			#print the logical Or
 	
 	# print a new line
 	la $a0, nl
 	li $v0, 4
 	syscall
 	
 	# find and print the logical XOR
 	la $a0, XOR
 	li $v0, 4
 	syscall		#print the XOR message
 	
 	 xor $a0, $t0, $t1	#calculate the xor of the integers
 	 li $v0, 1
 	 syscall 	#print the xor of the integers
 	 
 	 # print a new line
 	 la $a0, nl
 	li $v0, 4
 	syscall
 	
 	# find and print the logical left shift by 2 places
 	la $a0, LS
 	li $v0, 4
 	syscall		#print the LS message
 	
 	
 	sll $a0, $t0, 2		#do the LS calculation
 	li $v0, 1
 	syscall			#print the LS of the first integer
 	
 	#print a new line
 	la $a0, nl
 	li $v0, 4
 	syscall
 	
 	#calculate and print the logical left shift of the second integer
 	la $a0, LS2
 	li $v0, 4
 	syscall		#print the LS2 message
 	sll $a0, $t1, 2		#calculate the LS of the second integer
 	li $v0, 1
 	syscall		#print the LS of the second integer
 	
 	#new line
 	la $a0, nl
 	li $v0, 4
 	syscall
 	
 	# find and print the logical right sift of the two integers
 	la $a0, LRS
 	li $v0, 4
 	syscall		# prints my LRS message
 	
 	srl $a0, $t0, 2
 	li $v0, 1
 	syscall		# prints the actual value
 	
 	#new line
 	la $a0, nl
 	li $v0, 4
 	syscall
 	
 	#calculate and print the logical right sift of the second integer
 	la $a0, LRS2
 	li $v0, 4
 	syscall		#prints my LRS2 message
 	
 	srl $a0, $t1, 2
 	li $v0, 1
 	syscall		#prints the actual LRS2 value
 	
 	#new line
 	la $a0, nl
 	li $v0, 4
 	syscall
 	
 	# find and print the arithmetic right shift of the two integrs
 	la $a0, AR
 	li $v0, 4
 	syscall		#prints the AR message
 	
 	sra $a0, $t0, 2
 	li $v0, 1
 	syscall		#prints the actual AR value
 	
 	#new line
 	la $a0, nl
 	li $v0, 4
 	syscall
 	
 	#calculate and print the arithmetic right shift of the second integer
 	la $a0, AR2
 	li $v0, 4
 	syscall		#prints the AR2 message
 	
 	sra $a0, $t1, 2
 	li $v0, 1
 	syscall		#prints the actual AR2 value
 	
 	
 	# end the program
 	li $v0, 10
 	syscall
 	
 	
 	
