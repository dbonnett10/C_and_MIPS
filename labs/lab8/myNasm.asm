; Dan Bonnett
; CMPSCI 210 Lab 8, Part 4
; Due Date: 11/2/2015
; Description: NASM program that is the equivalent to the following C code:
;
; #include <stdio.h>
; int main() {
    ; int r = 119;
    ; int s = -32;
    ; int t = 7;
    ; int u = (r-(s-t)) & (s+t-r);
    ; printf("r=%d,s=%d,t=%d,u=%d\n",r,s,t,u);
    ; }
    ;
;Honor code: This work is my own unless otherwise cited

extern printf

section .data

r: dd 119
s: dd -32
t: dd 7

fmt: db "r=%d, s=%d, t=%d, u=%d",10,0
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
section .bss
u: resb 4
temp: resb 4

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
section .text

    global main
main:
    push ebp
    mov ebp, esp

    mov eax, [s]    ;eax = contents of s (= -32)
    sub eax, [t]    ;eax = eax - contents of t (eax = eax - 7 = -39)
    mov ebx, [r]    ;ebx = contents of r (= 119)
    sub ebx, eax    ;ebx = ebx - eax (so ebx = 158)
    mov [temp], ebx ;temp now contains the contents of ebx (so temp = -158)
    mov eax, [s]    ;eax = s = -32
    add eax, [t]    ;eax = eax + 7 (so eax = -25)
    sub eax, [r]    ;eax = eax - 119 (so eax = -144)
    and [temp], eax   ;temp = temp & eax (so temp = 158 & -144)
    mov eax, [temp]  ;copy the contents of temp into eax
    mov [u], eax    ;copy the contents of eax into u

    ; Get ready to print. We must push the arguments to the printf
	; function in reverse order:

    	push	dword	[u]	; first, push u (LAST argument)
        push	dword	[t]	; ... then push t
	push	dword	[s]	; ... then push s
	push	dword	[r]	; ... then push r
	push	dword	fmt	; ... then push format (FIRST argument)
	call	printf
	add	esp,20		; since we pushed five words, pop 20 bytes

	mov	esp,ebp	; always include these two steps...
	pop	ebp	; ...at the end

	ret		; return from the program







