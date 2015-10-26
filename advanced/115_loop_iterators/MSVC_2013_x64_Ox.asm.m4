include(`commons.m4')f	PROC
; RDX=a1
; RCX=a2
; R8=cnt
	test	r8, r8        ; cnt==0? _EN(`exit then')_RU(`тогда выйти')
	je	SHORT $LN1@f
	npad	11
$LL3@f:
	mov	eax, DWORD PTR [rdx]
	lea	rcx, QWORD PTR [rcx+12]
	lea	rdx, QWORD PTR [rdx+28]
	mov	DWORD PTR [rcx-12], eax
	dec	r8
	jne	SHORT $LL3@f
$LN1@f:
	ret	0
f	ENDP
