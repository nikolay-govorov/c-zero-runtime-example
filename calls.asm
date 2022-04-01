global sys_read
global sys_write
global sys_errno

section		.text

generic_syscall_3:
		push	ebp		; save stack ptr
		mov	ebp, esp

		push	ebx		; get options from stack
		mov	ebx, [ebp+8]
		mov	ecx, [ebp+12]
		mov	edx, [ebp+16]
		int	80h		; run syscall
		mov	edx, eax	; save return flag on EAX
		and	edx, 0fffff000h ; check error
		cmp	edx, 0fffff000h
		jnz	.okay
		mov	[sys_errno], eax
		mov	eax, -1
.okay:		pop	ebx

		mov	esp, ebp	; return
		pop	ebp
		ret


sys_read:	mov	eax, 3
		jmp	generic_syscall_3

sys_write:	mov	eax, 4
		jmp	generic_syscall_3

section		.bss
sys_errno	resd	1

