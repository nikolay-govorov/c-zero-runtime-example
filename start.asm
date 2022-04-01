global _start

extern main		; defined on C

section .text
_start:
	mov ecx, [esp]	; save the argc in ECX
	mov eax, esp	; prepare argv on EAX
	add eax, 4
	push eax
	push ecx
	call main	; call main(argc, argv) from C
	add esp, 8


	mov ebx, eax	; exit
	mov eax, 1
	int 80h

