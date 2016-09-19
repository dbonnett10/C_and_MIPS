/**
 * Dan Bonnett
 * CMPSCI 210, Lab 7, Bonus
 * Due Date: 10/26/2015
 * Description: Prints out the number of bytes in various data types
 * Honor Code: This work is my own unless otherwise cited
 */

#include <stdio.h>

int main() {

    /* Uses the sizeof() function to print out the number of bytes in each data type */
    printf("Number of bytes in an int: %lu \n", sizeof(int));
    printf("Number of bytes in a float: %lu \n", sizeof(float));
    printf("Number of bytes in a double: %lu \n", sizeof(double));
    printf("Number of bytes in a char: %lu \n", sizeof(char));
    printf("Number of bytes in a short: %lu \n", sizeof(short));
    printf("Number of bytes in a long: %lu \n", sizeof(long));
    printf("Number of bytes in a long long: %lu \n", sizeof(long long));

}
