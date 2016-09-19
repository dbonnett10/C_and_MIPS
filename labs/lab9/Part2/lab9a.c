/* Dan Bonnett
 * CMPSCI 210 Lab 9, Part 2 A
 * Due Date: 11/16/2015
 * Description: Fill in function arrayCalc with a function that replaces each array element with a
 * “running sum” of the elements up to that entry.
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
    int i, temp;    /* Declare two int variables */
    temp = a[0];    /* set the temp variable equal to the value of the first value in the array */
    for (i = 1; i < len; i++) {     /* looping through the array, starting with index 1 */
        a[i] = a[i] + temp;     /* add the values of the current index and the previous one */
        temp = a[i];            /* set temp variable equal to the current array index */
    }
}

