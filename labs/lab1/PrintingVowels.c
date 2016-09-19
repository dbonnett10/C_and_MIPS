/************************************
 * Dan Bonnett
 * Sample program based on K & R page 17
 * Copying a file but printing only the characters that are vowels.
 */

#include <stdio.h>

/*copy input to output; 2nd version*/

main() {
    int c;
    int counter = 0;

    while((c = getchar()) != EOF) {

        if (c == '\n') {
            putchar(c);
        } //if

        //only print the vowels
        else if (c == 'a' || c == 'e' || c == 'i' || c == 'o' || c == 'u' || c =='y') {
            putchar(c);
        } //else if

        if (c == 'a') {
            counter++;
        }


    } //while

    printf("%d\n" , counter);   //prints the total number of a's

} //main
