_rt$1 = -4						; size = 4
_rt$2 = 8						; size = 4
_x$ = 8							; size = 4
_y$ = 12						; size = 4
?f@@YAIII@Z PROC					; f
	push	ecx
	push	esi
	mov	esi, DWORD PTR _x$[esp+4]
	test	esi, esi
	jne	SHORT $LN7@f
	mov	eax, DWORD PTR _y$[esp+4]
	pop	esi
	pop	ecx
	ret	0
$LN7@f:
	mov	edx, DWORD PTR _y$[esp+4]
	mov	eax, esi
	test	edx, edx
	je	SHORT $LN8@f
	or	eax, edx
	push	edi
	bsf	edi, eax
	bsf	eax, esi
	mov	ecx, eax
	mov	DWORD PTR _rt$1[esp+12], eax
	bsf	eax, edx
	shr	esi, cl
	mov	ecx, eax
	shr	edx, cl
	mov	DWORD PTR _rt$2[esp+8], eax
	cmp	esi, edx
	je	SHORT $LN22@f
$LN23@f:
	jbe	SHORT $LN2@f
	xor	esi, edx
	xor	edx, esi
	xor	esi, edx
$LN2@f:
	cmp	esi, 1
	je	SHORT $LN22@f
	sub	edx, esi
	bsf	eax, edx
	mov	ecx, eax
	shr	edx, cl
	mov	DWORD PTR _rt$2[esp+8], eax
	cmp	esi, edx
	jne	SHORT $LN23@f
$LN22@f:
	mov	ecx, edi
	shl	esi, cl
	pop	edi
	mov	eax, esi
$LN8@f:
	pop	esi
	pop	ecx
	ret	0
?f@@YAIII@Z ENDP
