//*****************************************
//Dan Bonnett
//Lab 2 part 5
//This program contains 2 functions, in addition to main. The even
//function will return true(1) if its input is even and non-zero, and will return
//false(0) if the input is non-zero and odd.
//The agmean function will return the arithmetic/geometric mean of two
//unsigned int values. Arithmetic mean will be returned if the sum of the numbers
//is even. Geometric mean will be returned if the sum is odd.
//
//Honor code: The work I am submitting is mine unless otherwise cited
//******************************************

#include <stdio.h>
#include <math.h>

int even(unsigned int m);
double agmean(unsigned int i, unsigned int j);

main() {
    unsigned int num1; //for the even function
    unsigned interger1, interger2;  //for the agmean function
    printf("Enter an unsigned integer (if the integer is odd then a 0 will be returned, if the integer is even then a 1 will be returned)\n");
    scanf("%u", &num1);
    printf("%u\n", even(num1));
    printf("\n");
    printf("Enter the first integer\n");
    scanf("%u", &interger1);
    printf("Enter the second integer\n");
    scanf("%u", &interger2);
    printf(" %.2f\n", agmean(interger1, interger2));



} //main

int even(unsigned int m) {
    if (m%2 == 0) {
        return 1;
    } //if
    else if(m%2 != 0) {
        return 0;
    }

} //even

double agmean(unsigned int i, unsigned int j) {
    double avg;
    double gAvg;

    if ((i + j)%2 == 0) {
        avg = (i + j)/2;
        printf("The arithmetic mean for %u and %u is: ", i, j);
        return avg;
    }
    else if ((i+j)%2 != 0) {
        gAvg = i * j;
        printf("The geometric mean for %u and %u is: ", i, j);
        return sqrt(gAvg);
    } //else

} //agmean
