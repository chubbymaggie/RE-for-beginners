include(`commons.m4')_TEXT	SEGMENT
_a$ = 8							; size = 4
_b$ = 12						; size = 4
_c$ = 16						; size = 4
_f	PROC
	push	ebp
	mov	ebp, esp
	mov	eax, DWORD PTR _a$[ebp]
	imul	eax, DWORD PTR _b$[ebp]
	add	eax, DWORD PTR _c$[ebp]
	pop	ebp
	ret	0
_f	ENDP

_main	PROC
	push	ebp
	mov	ebp, esp
	push	3 ; _arg3
	push	2 ; _arg2
	push	1 ; _arg1
	call	_f
	add	esp, 12
	push	eax
	push	OFFSET $SG2463 ; '%d', 0aH, 00H
	call	_printf
	add	esp, 8
	; _return 0
	xor	eax, eax
	pop	ebp
	ret	0
_main	ENDP
