/**********************************
 *Dan Bonnett
 *Lab 6 Part 1
 *Due Date: 10/19/2015
 *Uses the rot1 function to rotate the elements of an array one index to the left
 */


#include <stdio.h>

/* Function prototypes: */
void aprint(int a[], int n);
void rotl(int a[], int n);

int main() {
    /* Three arrays to be rotated: */
    int a1[] = {10,20,30,40};
    int a2[] = {3};
    int a3[] = {11,12,13,14,15,16,17,18,19};

    /* Array a1: */
    printf("Unrotated array: ");
    aprint(a1,4);
    rotl(a1,4);
    printf("Rotated array: ");
    aprint(a1,4);
    rotl(a1,4);

    /* Array a2: */
    printf("Unrotated array: ");
    aprint(a2,1);
    rotl(a2,1);
    printf("Rotated array: ");
    aprint(a2,1);
    rotl(a2,1);

    /* Array a3: */
    printf("Unrotated array: ");
    aprint(a3,9);
    rotl(a3,9);
    printf("Rotated array: ");
    aprint(a3,9);
    rotl(a3,9);
}

/**
 * aprint(a,n): prints the elements of array a (of size n)
 *   on a single line, separated by blanks and terminating
 *   with a newline.
 */
void aprint(int a[], int n) {
    int i;

    for (i = 0; i < n; i++) {
        printf("%d ",a[i]);
    }
    printf("\n");
}

/**
 * rot1 sets the value in a[0] in a temporary variable
 * the function then moves a[1] to a[0], a[2] to a[1], etc....
 * the function then sets the temp variable to the last index spot
 */
void rotl(int a[], int n) {
    /**
     *  COMPLETE THE rotl FUNCTION
     */

    int i, temp;
    temp  = a[0];

    for (i = 0; i < n; i++) {
         a[i] = a[i+1];
         if(a[i] == a[n-1]) {
             a[n-1] = temp;
         }
    }







}



