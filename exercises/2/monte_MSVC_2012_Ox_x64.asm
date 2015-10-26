__real@412e848000000000 DQ 0412e848000000000r	; 1e+006
__real@4010000000000000 DQ 04010000000000000r	; 4
__real@4008000000000000 DQ 04008000000000000r	; 3
__real@3f800000 DD 03f800000r			; 1

tmp$1 = 8
tmp$2 = 8
f	PROC
	movsdx	xmm3, QWORD PTR __real@4008000000000000
	movss	xmm4, DWORD PTR __real@3f800000
	mov	edx, DWORD PTR ?RNG_state@?1??get_rand@@9@9
	xor	ecx, ecx
	mov	r8d, 200000				; 00030d40H
	npad	2 ; align next label
$LL4@f:
	imul	edx, 1664525				; 0019660dH
	add	edx, 1013904223				; 3c6ef35fH
	mov	eax, edx
	and	eax, 8388607				; 007fffffH
	imul	edx, 1664525				; 0019660dH
	bts	eax, 30
	add	edx, 1013904223				; 3c6ef35fH
	mov	DWORD PTR tmp$2[rsp], eax
	mov	eax, edx
	and	eax, 8388607				; 007fffffH
	bts	eax, 30
	movss	xmm0, DWORD PTR tmp$2[rsp]
	mov	DWORD PTR tmp$1[rsp], eax
	cvtps2pd xmm0, xmm0
	subsd	xmm0, xmm3
	cvtpd2ps xmm2, xmm0
	movss	xmm0, DWORD PTR tmp$1[rsp]
	cvtps2pd xmm0, xmm0
	mulss	xmm2, xmm2
	subsd	xmm0, xmm3
	cvtpd2ps xmm1, xmm0
	mulss	xmm1, xmm1
	addss	xmm1, xmm2
	comiss	xmm4, xmm1
	jbe	SHORT $LN3@f
	inc	ecx
$LN3@f:
	imul	edx, 1664525				; 0019660dH
	add	edx, 1013904223				; 3c6ef35fH
	mov	eax, edx
	and	eax, 8388607				; 007fffffH
	imul	edx, 1664525				; 0019660dH
	bts	eax, 30
	add	edx, 1013904223				; 3c6ef35fH
	mov	DWORD PTR tmp$2[rsp], eax
	mov	eax, edx
	and	eax, 8388607				; 007fffffH
	bts	eax, 30
	movss	xmm0, DWORD PTR tmp$2[rsp]
	mov	DWORD PTR tmp$1[rsp], eax
	cvtps2pd xmm0, xmm0
	subsd	xmm0, xmm3
	cvtpd2ps xmm2, xmm0
	movss	xmm0, DWORD PTR tmp$1[rsp]
	cvtps2pd xmm0, xmm0
	mulss	xmm2, xmm2
	subsd	xmm0, xmm3
	cvtpd2ps xmm1, xmm0
	mulss	xmm1, xmm1
	addss	xmm1, xmm2
	comiss	xmm4, xmm1
	jbe	SHORT $LN15@f
	inc	ecx
$LN15@f:
	imul	edx, 1664525				; 0019660dH
	add	edx, 1013904223				; 3c6ef35fH
	mov	eax, edx
	and	eax, 8388607				; 007fffffH
	imul	edx, 1664525				; 0019660dH
	bts	eax, 30
	add	edx, 1013904223				; 3c6ef35fH
	mov	DWORD PTR tmp$2[rsp], eax
	mov	eax, edx
	and	eax, 8388607				; 007fffffH
	bts	eax, 30
	movss	xmm0, DWORD PTR tmp$2[rsp]
	mov	DWORD PTR tmp$1[rsp], eax
	cvtps2pd xmm0, xmm0
	subsd	xmm0, xmm3
	cvtpd2ps xmm2, xmm0
	movss	xmm0, DWORD PTR tmp$1[rsp]
	cvtps2pd xmm0, xmm0
	mulss	xmm2, xmm2
	subsd	xmm0, xmm3
	cvtpd2ps xmm1, xmm0
	mulss	xmm1, xmm1
	addss	xmm1, xmm2
	comiss	xmm4, xmm1
	jbe	SHORT $LN16@f
	inc	ecx
$LN16@f:
	imul	edx, 1664525				; 0019660dH
	add	edx, 1013904223				; 3c6ef35fH
	mov	eax, edx
	and	eax, 8388607				; 007fffffH
	imul	edx, 1664525				; 0019660dH
	bts	eax, 30
	add	edx, 1013904223				; 3c6ef35fH
	mov	DWORD PTR tmp$2[rsp], eax
	mov	eax, edx
	and	eax, 8388607				; 007fffffH
	bts	eax, 30
	movss	xmm0, DWORD PTR tmp$2[rsp]
	mov	DWORD PTR tmp$1[rsp], eax
	cvtps2pd xmm0, xmm0
	subsd	xmm0, xmm3
	cvtpd2ps xmm2, xmm0
	movss	xmm0, DWORD PTR tmp$1[rsp]
	cvtps2pd xmm0, xmm0
	mulss	xmm2, xmm2
	subsd	xmm0, xmm3
	cvtpd2ps xmm1, xmm0
	mulss	xmm1, xmm1
	addss	xmm1, xmm2
	comiss	xmm4, xmm1
	jbe	SHORT $LN17@f
	inc	ecx
$LN17@f:
	imul	edx, 1664525				; 0019660dH
	add	edx, 1013904223				; 3c6ef35fH
	mov	eax, edx
	and	eax, 8388607				; 007fffffH
	imul	edx, 1664525				; 0019660dH
	bts	eax, 30
	add	edx, 1013904223				; 3c6ef35fH
	mov	DWORD PTR tmp$2[rsp], eax
	mov	eax, edx
	and	eax, 8388607				; 007fffffH
	bts	eax, 30
	movss	xmm0, DWORD PTR tmp$2[rsp]
	mov	DWORD PTR tmp$1[rsp], eax
	cvtps2pd xmm0, xmm0
	subsd	xmm0, xmm3
	cvtpd2ps xmm2, xmm0
	movss	xmm0, DWORD PTR tmp$1[rsp]
	cvtps2pd xmm0, xmm0
	mulss	xmm2, xmm2
	subsd	xmm0, xmm3
	cvtpd2ps xmm1, xmm0
	mulss	xmm1, xmm1
	addss	xmm1, xmm2
	comiss	xmm4, xmm1
	jbe	SHORT $LN18@f
	inc	ecx
$LN18@f:
	dec	r8
	jne	$LL4@f
	movd	xmm0, ecx
	mov	DWORD PTR ?RNG_state@?1??get_rand@@9@9, edx
	cvtdq2ps xmm0, xmm0
	cvtps2pd xmm1, xmm0
	mulsd	xmm1, QWORD PTR __real@4010000000000000
	divsd	xmm1, QWORD PTR __real@412e848000000000
	cvtpd2ps xmm0, xmm1
	ret	0
f	ENDP
