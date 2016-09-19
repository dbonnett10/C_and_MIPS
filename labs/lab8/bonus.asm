; Dan Bonnett
; CMPSCI 210 Lab 8, Part 5 (Bonus)
; Due Date: 11/2/2015
; Description: NASM program that is the equivalent to the following C code:
;
; #include <stdio.h>
; int main() {
    ; int i = 36;
    ; int j = 15;
    ; int k = i*i + j*j;
    ; printf("i=%d, j=%d, k=%d\n",i,j,k);
    ; }
    ;
; Honor code: This work is my own unless otherwise cited

    extern printf   ; We are using C's printf function

    section .data   ;costants go here

i: dd 36
j: dd 15
fmt: db "i=%d,j=%d,k=%d",10,0

    section .bss    ;variables go here
k: resb 4   ;reserve one word (4 bytes)
temp: resb 4    ;temp variable

    section .text   ;program goes here
    global main     ;we're following C program conventions
main:
    push ebp        ;always do these two things at the beginning
    mov ebp, esp

    mov eax, [i]    ; eax now contains contents of i (so eax = 36)
    mov ebx, [j]    ; ebx now contains contents of j (so ebx = 15)
    mul eax         ; eax = eax * eax (so eax = i * i = 1296)
    mov [temp], eax ; temp = 1296
    mov eax, ebx    ; copy ebx into eax (so eax now contains j)
    mul eax         ; eax = eax * eax (so eax = j * j = 225)
    add eax, [temp] ; add eax and temp (so eax = 225 + 1296)
    mov [k], eax    ; copy contents of eax into k


	; Get ready to print. We must push the arguments to the printf
	; function in reverse order:
	push	dword	[k]	; first, push u (LAST argument)
        push	dword	[j]	; ... then push j
	push	dword	[i]	; ... then push i
	push	dword	fmt	; ... then push format (FIRST argument)
	call	printf
	add	esp,16		; pop 4 arguments from stack

	mov	esp,ebp	; always include these two steps...
	pop	ebp	; ...at the end

	ret		; return from the program



