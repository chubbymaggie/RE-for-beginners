$SG1305	DB	'read=%d, write=%d', 0aH, 00H

_write$ = -12	; size = 4
_read$ = -8	; size = 4
tv64 = -4	; size = 4
_type$ = 8	; size = 4
_f	PROC
	push	ebp
	mov	ebp, esp
	sub	esp, 12
	mov	DWORD PTR _read$[ebp], 0
	mov	DWORD PTR _write$[ebp], 0
	mov	eax, DWORD PTR _type$[ebp]
	mov	DWORD PTR tv64[ebp], eax
	cmp	DWORD PTR tv64[ebp], 1 ; R
	je	SHORT $LN2@f
	cmp	DWORD PTR tv64[ebp], 2 ; W
	je	SHORT $LN3@f
	cmp	DWORD PTR tv64[ebp], 3 ; RW
	je	SHORT $LN4@f
	jmp	SHORT $LN5@f
$LN4@f: ; case RW:
	mov	DWORD PTR _read$[ebp], 1
$LN3@f: ; case W:
	mov	DWORD PTR _write$[ebp], 1
	jmp	SHORT $LN5@f
$LN2@f: ; case R:
	mov	DWORD PTR _read$[ebp], 1
$LN5@f: ; default
	mov	ecx, DWORD PTR _write$[ebp]
	push	ecx
	mov	edx, DWORD PTR _read$[ebp]
	push	edx
	push	OFFSET $SG1305 ; 'read=%d, write=%d'
	call	_printf
	add	esp, 12
	mov	esp, ebp
	pop	ebp
	ret	0
_f	ENDP
