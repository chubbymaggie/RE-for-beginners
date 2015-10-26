f1:
	sub	esp, 4
	imul	eax, DWORD PTR v1.2023, 1664525
	add	eax, 1013904223
	mov	DWORD PTR v1.2023, eax
	and	eax, 8388607
	or	eax, 1073741824
	mov	DWORD PTR [esp], eax
	fld	DWORD PTR [esp]
	fsub	DWORD PTR .LC0
	add	esp, 4
	ret
f:
	push	esi
	mov	esi, 1000000
	push	ebx
	xor	ebx, ebx
	sub	esp, 16
.L7:
	call	f1
	fstp	DWORD PTR [esp]
	call	f1
	lea	eax, [ebx+1]
	fld	DWORD PTR [esp]
	fmul	st, st(0)
	fxch	st(1)
	fmul	st, st(0)
	faddp	st(1), st
	fld1
	fucomip	st, st(1)
	fstp	st(0)
	cmova	ebx, eax
	sub	esi, 1
	jne	.L7
	mov	DWORD PTR [esp+4], ebx
	fild	DWORD PTR [esp+4]
	fmul	DWORD PTR .LC3
	fdiv	DWORD PTR .LC4
	fstp	DWORD PTR [esp+8]
	fld	DWORD PTR [esp+8]
	add	esp, 16
	pop	ebx
	pop	esi
	ret

v1.2023:
	.long	305419896
.LC0:
	.long	1077936128
.LC3:
	.long	1082130432
.LC4:
	.long	1232348160
