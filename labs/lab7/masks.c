/**
 * Dan Bonnett
 * CMPSCI 210, Lab 7, part 2
 * Due Date: 10/26/2015
 * Description: Use masks to print out the integer formed by just the bits
 * in positions begin through end of the integer a.
 * Honor Code: This work is my own unless otherwise cited
 */

#include <stdio.h>

int main() {
    unsigned mask = 0xFFFFFFFF;     /*creates a mask of all 1's */
    unsigned int a;
    int begin, end;
    printf("Enter an unsigned integer: \n");    /* prompting the user */
    scanf("%u", &a);    /* saving the user input in a */
    printf("Enter the beginning bit position (between 0 and 31) \n");
    scanf("%d", &begin);
    printf("Enter the ending bit position (between 0 and 31) \n");
    scanf("%d", &end);

    mask = (mask << begin);       /*shift the mask to the left by the value in variable begin */
    mask = (mask >> begin);       /*shift the mask back to the right by the value in variable begin */
    a = (mask & a) >> (31-end);   /* set the values after our given range to 0 */
    printf("answer = %u\n", a);   /* printing the answer */

} //main


