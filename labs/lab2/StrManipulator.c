//*****************************************************
//Dan Bonnett
//CMPSCI 210 Lab 2 part 6
//Honor Code: This work is mine unless otherwise cited
//Description: This program contains a function called swapHead that takes two strings as parameters.
//This function will take the first three letters of the first string, and swap them out with the last three
//letters of the second string.
//
//******************************************************


#include <stdio.h>
#include <string.h>

void swapHead(char message1[], char message2[]);  //swap the first three letters of message1 to the last three
//letters of message2, and the last three letters of message2 to the first three of message1.
int size(char* str); //return the size of a string


main() {

    char string1[10] = "spongebob";
	char string2[8] = "patrick";
	char string3[4] = "dan";
    printf("The original strings are:\n %s\n %s\n %s\n", string1, string2, string3);
    printf("\n");
    printf("When we perform the swap\n");

    swapHead(string1, string2);
    printf("The new strings are:\n %s\n %s\n", string1, string2);

    swapHead(string1, string2);  //swaps the strings back to their original order
    swapHead(string2, string3);
    printf("\n %s\n %s\n", string2, string3);

    swapHead(string2, string3);  //swaps the strings back to their original order
    swapHead(string1, string3);
    printf("\n %s\n %s\n", string1, string3);


} // main

int size(char* str) {
     int j = 0;
     while (str[j] != '\0') {    //got this function from your program, not sure how to legitimately cite it
         j++;
     }
     return j;
     } //size

void swapHead(char* message1, char* message2) {
    int i, k, d;
    int line1[3];  //line1[] and line 2[] are temporary place holders
    int line2[3];
    for (i = 0; i < 3; i++) {
        line1[i] = message1[i];
    }
    for (k = 0; k < 3; k++) {
        line2[k] = message2[size(message2)-3 + k];

    }
    for (d = 0; d < 3; d++) {
        message1[d] = line2[d];
        message2[size(message2)-3+d] = line1[d];
    }


} //swapHead


