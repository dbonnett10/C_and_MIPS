/**
 * Dan Bonnett
 * CMPSCI 210, Lab 7, part 1 B
 * Due Date: 10/26/2015
 * Description: Use pointers to traverse through an array of long long
 * values, and reverse the elements in the array.
 * Honor Code: This work is my own unless otherwise cited
 */

#include <stdio.h>
#define SIZE 4

int main() {
    long long a[SIZE] = {1000000, 2500000, 3750000, 6700000};
    long long *b, *c;
    int i;
    long long temp;

    for (i = 0; i < SIZE; i++) {
        printf("%lld ", a[i]);
    } //for
    printf("\n");

    /* Use a pointer to advance through the array, we start with b
     * pointing to a, which is the first element in the array
     */
    b = a;  /* sets pointer b to the first index in a */
    for (i = 0; i < SIZE; i++) {
        printf("%lld ", *(b++));
    }
    printf("\n");


    /* Here we change the base of our array. We set the pointer to
     * the end of array a, but we offset all of our indices to compensate for this.
     */
     c = a+SIZE-1;   /* c now points to the last element in a */
    for (i = -(SIZE-1); i <= 0; i++) {
        printf("%lld ", c[i]);
    }
    printf("\n");



    /* Reverse the elements in the array */
     b = a;  /* sets pointer b to point to the first index in array a */
    c = a+SIZE-1;   /* pointer c now points to the last index in a */
    for (i = 0; i < SIZE/2; i++) {  /* sets the loop condition */
        temp = *b;
        *(b++) = *c;
        *(c--) = temp;
    }

    printf("Reversed array is: ");

    for (i = 0; i < SIZE; i++) {
        printf("%lld ", a[i]);
    }
    printf("\n");

}



