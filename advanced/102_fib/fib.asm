_TEXT	SEGMENT
_a$ = 8		; size = 4
_b$ = 12	; size = 4
_limit$ = 16	; size = 4
_fib	PROC
	push	ebp
	mov	ebp, esp
	mov	eax, DWORD PTR _a$[ebp]
	add	eax, DWORD PTR _b$[ebp]
	push	eax
	push	OFFSET $SG2750 ; "%d"
	call	DWORD PTR __imp__printf
	add	esp, 8
	mov	ecx, DWORD PTR _limit$[ebp]
	push	ecx
	mov	edx, DWORD PTR _a$[ebp]
	add	edx, DWORD PTR _b$[ebp]
	push	edx
	mov	eax, DWORD PTR _b$[ebp]
	push	eax
	call	_fib
	add	esp, 12
	pop	ebp
	ret	0
_fib	ENDP

_main	PROC
	push	ebp
	mov	ebp, esp
	push	OFFSET $SG2753 ; "0\n1\n1\n"
	call	DWORD PTR __imp__printf
	add	esp, 4
	push	20
	push	1
	push	1
	call	_fib
	add	esp, 12
	xor	eax, eax
	pop	ebp
	ret	0
_main	ENDP
