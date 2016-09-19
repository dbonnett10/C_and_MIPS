//***********************************************
//Dan Bonnett
//Counts the number of lines in a given input file, and right-justifies the line number in the first three columns
//Lab1
//***********************************************


#include <stdio.h>

main() {

    int c, lineNum;
    int i = 0;

    lineNum = 1;

    printf("%3d.", lineNum);

    while((c = getchar()) != EOF) {

        if(lineNum == i) {
            lineNum++;
            printf("%3d.", lineNum);
        } //if

        if(c == '\n') {
            i++;

        } //if

        putchar(c);

    } //while

    printf("\n");

} //main
