/* Dan Bonnett
 * CMPSCI 210 Lab 9, Part 2 C
 * Due Date: 11/16/2015
 * Description: Fill in function arrayCalc with a function that replaces each element in the parameter
 * array a with the sum of the two elements on either side of it.
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
    int temp, i, temp2, temp3;  /* declare 3 different int variables */
    int firstNum = a[0];        /* save the first value of the aray */
    int lastNum = a[len-1];     /* save the last value of the array */
    int secNum = a[1];          /* save the value of array index 1 */
    int secLastNum = a[len-2];  /* save the value of the second to last array index */

        for (i = 0; i < (len-1); i++) {     /* loop through the array */
            temp = a[i];
            temp2 = a[i+1];
            a[i] = temp2 + temp3;
            temp3 = temp;
    }

       a[0] = firstNum + secNum;    /* special case for array index 0 */
       a[len-1] = lastNum + secLastNum; /* special case for the final array index */
}
