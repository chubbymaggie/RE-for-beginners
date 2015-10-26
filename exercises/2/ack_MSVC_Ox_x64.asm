m$ = 48
n$ = 56
f	PROC
$LN14:
	push	rbx
	sub	rsp, 32
	mov	eax, edx
	mov	ebx, ecx
	test	ecx, ecx
	je	SHORT $LN11@f
$LL5@f:
	test	eax, eax
	jne	SHORT $LN1@f
	mov	eax, 1
	jmp	SHORT $LN12@f
$LN1@f:
	lea	edx, DWORD PTR [rax-1]
	mov	ecx, ebx
	call	f
$LN12@f:
	dec	ebx
	test	ebx, ebx
	jne	SHORT $LL5@f
$LN11@f:
	inc	eax
	add	rsp, 32
	pop	rbx
	ret	0
f	ENDP
