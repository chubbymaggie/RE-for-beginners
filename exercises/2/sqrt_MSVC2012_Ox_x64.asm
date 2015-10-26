__real@3fe0000000000000 DQ 03fe0000000000000r
__real@3f50624dd2f1a9fc DQ 03f50624dd2f1a9fcr
__real@3ff0000000000000 DQ 03ff0000000000000r

x$ = 8
f	PROC
	movsdx	xmm2, QWORD PTR __real@3ff0000000000000
	movsdx	xmm5, QWORD PTR __real@3f50624dd2f1a9fc
	movsdx	xmm4, QWORD PTR __real@3fe0000000000000
	movapd	xmm3, xmm0
	npad	4
$LL4@f:
	movapd	xmm1, xmm2
	mulsd	xmm1, xmm2
	subsd	xmm1, xmm3
	cvttsd2si eax, xmm1
	cdq
	xor	eax, edx
	sub	eax, edx
	movd	xmm0, eax
	cvtdq2pd xmm0, xmm0
	comisd	xmm5, xmm0
	ja	SHORT $LN18@f
	movapd	xmm0, xmm3
	divsd	xmm0, xmm2
	addsd	xmm0, xmm2
	movapd	xmm2, xmm0
	mulsd	xmm2, xmm4
	jmp	SHORT $LL4@f
$LN18@f:
	movapd	xmm0, xmm2
	ret	0
f	ENDP
