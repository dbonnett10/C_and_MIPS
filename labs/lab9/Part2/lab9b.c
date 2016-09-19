/* Dan Bonnett
 * CMPSCI 210 Lab 9, Part 2 B
 * Due Date: 11/16/2015
 * Description: Fill in function arrayCalc with a function that replaces each element in the parameter
 * array a with the bitwise “and” of itself and the preceding element.
 * Honor Code: This work is my own unless otherwise cited
 */

/**********  DON'T CHANGE ANY C CODE EXCEPT THE arrayCalc FUNCTION! *********/
#include <stdio.h>

/* Function prototype: */
void arrayCalc(int a[], int len);

int main() {
    int a1[] = {4,2,9,-1,6,3};
    int a2[] = {10,9,11,12,15,28,19};
    int a3[] = {2,3,5,8,0,19,1};
    int l1 = 6, l2 = 7, l3 = 7, i;
    arrayCalc(a1,l1);
    for (i = 0; i < l1; i++) { printf("%d ",a1[i]); }
    printf("\n");
    arrayCalc(a2,l2);
    for (i = 0; i < l2; i++) { printf("%d ",a2[i]); }
    printf("\n");
    arrayCalc(a3,l3);
    for (i = 0; i < l3; i++) { printf("%d ",a3[i]); }
    printf("\n");
}

/***********  CHANGE THE FOLLOWING FUNCTION ACCORDING TO THE PROBLEM ******/
void arrayCalc(int a[], int len) {
    int i;      /* declare the loop counter */
    int temp = a[0];    /* save the value in a[0] in a temp variable */
    int temp2;      /* declare a second temp variable */

    for (i = 1; i < len; i++) {     /* loop through the array, starting at index 1 */
        temp2 = a[i];       /* set temp2 equal to the current array index */
        a[i] = a[i] & temp; /* current array index = current index & preceding index */
        temp = temp2;       /* temp moves up one index */
    }
    a[0] = a[0] & temp2;    /* handles the first array value */
}
