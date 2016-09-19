/**
 * Dan Bonnett
 * CMPSCI 210, Lab 7, part 1 A
 * Due Date: 10/26/2015
 * Description: Use pointers to traverse through an array of doubles, and
 * reverse the elements in the array.
 * Honor Code: This work is my own unless otherwise cited
 */

#include <stdio.h>
#define SIZE 6
int main() {
    double a[SIZE] = {3.14, 1.59, 17.38, 10.10, 3.21, 6.54};
    double *b, *c;
    int i;
    double temp;

    for (i = 0; i < SIZE; i++) {
        printf("%4.2f ", a[i]);
    }
    printf("\n");

    /* Use a pointer to advance through the array. We start with
     * b pointing to a, and we add 8 to b each time through the loop
     * */

    b = a;  /* sets pointer b to point to the first index in a */
    for (i = 0; i < SIZE; i++) {
        printf("%4.2f ", *(b++));  /* b++ will add 8 to b */
    }
    printf("\n");

    /* Changing the base of the array. Here, we set the pointer to
      the END of array a, but we offset all of our indices by -5 to
      compensate. Note that "c[1]", "c[2]", etc. are all illegal
      locations under this scheme.
    */

    c = a+SIZE-1;   /* c now points to the last element in a */
    for (i = -(SIZE-1); i <= 0; i++) {
        printf("%4.2f ", c[i]);
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
        printf("%4.2f ", a[i]);
    }
    printf("\n");

}
