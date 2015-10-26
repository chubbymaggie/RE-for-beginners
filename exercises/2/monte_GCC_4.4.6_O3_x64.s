f1:
	mov	eax, DWORD PTR v1.2084[rip]
	imul	eax, eax, 1664525
	add	eax, 1013904223
	mov	DWORD PTR v1.2084[rip], eax
	and	eax, 8388607
	or	eax, 1073741824
	mov	DWORD PTR [rsp-4], eax
	movss	xmm0, DWORD PTR [rsp-4]
	subss	xmm0, DWORD PTR .LC0[rip]
	ret
f:
	push	rbp
	xor	ebp, ebp
	push	rbx
	xor	ebx, ebx
	sub	rsp, 16
.L6:
	xor	eax, eax
	call	f1
	xor	eax, eax
	movss	DWORD PTR [rsp], xmm0
	call	f1
	movss	xmm1, DWORD PTR [rsp]
	mulss	xmm0, xmm0
	mulss	xmm1, xmm1
	lea	eax, [rbx+1]
	addss	xmm1, xmm0
	movss	xmm0, DWORD PTR .LC1[rip]
	ucomiss	xmm0, xmm1
	cmova	ebx, eax
	add	ebp, 1
	cmp	ebp, 1000000
	jne	.L6
	cvtsi2ss	xmm0, ebx
	unpcklps	xmm0, xmm0
	cvtps2pd	xmm0, xmm0
	mulsd	xmm0, QWORD PTR .LC2[rip]
	divsd	xmm0, QWORD PTR .LC3[rip]
	add	rsp, 16
	pop	rbx
	pop	rbp
	unpcklpd	xmm0, xmm0
	cvtpd2ps	xmm0, xmm0
	ret
v1.2084:
	.long	305419896
.LC0:
	.long	1077936128
.LC1:
	.long	1065353216
.LC2:
	.long	0
	.long	1074790400
.LC3:
	.long	0
	.long	1093567616
