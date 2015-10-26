_buf1$ = 8	; size = 4
_buf2$ = 12	; size = 4
_memcmp_1235 PROC
	mov	edx, DWORD PTR _buf2$[esp-4]
	mov	ecx, DWORD PTR _buf1$[esp-4]
	push	esi
	push	edi
	mov	esi, 1235
	add	edx, 10	
$LL4@memcmp_123:
	mov	eax, DWORD PTR [edx]
	cmp	eax, DWORD PTR [ecx]
	jne	SHORT $LN10@memcmp_123
	sub	esi, 4
	add	ecx, 4
	add	edx, 4
	cmp	esi, 4
	jae	SHORT $LL4@memcmp_123
$LN10@memcmp_123:
	movzx	edi, BYTE PTR [ecx]
	movzx	eax, BYTE PTR [edx]
	sub	eax, edi
	jne	SHORT $LN7@memcmp_123
	movzx	eax, BYTE PTR [edx+1]
	movzx	edi, BYTE PTR [ecx+1]
	sub	eax, edi
	jne	SHORT $LN7@memcmp_123
	movzx	eax, BYTE PTR [edx+2]
	movzx	edi, BYTE PTR [ecx+2]
	sub	eax, edi
	jne	SHORT $LN7@memcmp_123
	cmp	esi, 3
	jbe	SHORT $LN6@memcmp_123
	movzx	eax, BYTE PTR [edx+3]
	movzx	ecx, BYTE PTR [ecx+3]
	sub	eax, ecx
$LN7@memcmp_123:
	sar	eax, 31
	pop	edi
	or	eax, 1
	pop	esi
	ret	0
$LN6@memcmp_123:
	pop	edi
	xor	eax, eax
	pop	esi
	ret	0
_memcmp_1235 ENDP
