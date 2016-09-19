#Dan Bonnett
#CMPSCI 210 Lab3 Part 5
#Due Date: 9/21/2015
#Honor Code: The work I am submitting is mine unless otherwise cited
#This program saves an uppercase ASCII letter in a variable named c, and converts the letter to an 
#integer between 0-25, representing the letters location in the alphabet. I chose "D" so it should be 3.



	.data
	.align 2
	
c:	.ascii "D"	# saving the ascii letter "D" to variable C

	.text

	lw $t0, c	# load the contents of c into $t0
	
	
	addi $t0, $t0, -65  # add immediately the ascii value of "D" which is 68, and the negative ascii value of "A"
	
	
	
	li $v0,10
	syscall