//************************************
//Dan Bonnett
//Counts the number of vowels and consonants in an input file
//lab1
//*************************************

#include <stdio.h>

main() {

int c;
int vCounter = 0;
int cCounter = 0;

while((c = getchar()) != EOF) {
    if (c == 'a' || c == 'e' || c == 'i' || c == 'o' || c == 'u' || c == 'A' || c == 'E' || c == 'I' || c == 'O' || c == 'U') {
        vCounter++;
    } //if
    else if (c > 'a' && c < 'z' || c > 'A' && c < 'Z') {
        cCounter++;
    }
}

printf("\n");
printf("The number of vowels is: %d\n", vCounter);
printf("The number of consonants is: %d\n", cCounter);

}
 //main
