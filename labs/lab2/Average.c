//*************************************************
//Dan Bonnett
//Lab2 Part 3
//The program takes in 2 numbers, and calculates the average
//Honor code: The work I am submitting is my own unless otherwise cited
//*************************************************


#include <stdio.h>

double mean(double m , double n);

main() {
    int m;
    int n;
    int sum;
    printf("Enter the first number \n");
    scanf("%d", &m);
    printf("Enter the second number \n");
    scanf("%d", &n);
    printf("The average of the two numbers is: %.1f\n", mean(m, n));

} //main

double mean(double m, double n) {
   double sum = m + n;
    double avg = sum/2;
    return avg;


} //mean
