__real@3fe0000000000000 DQ 03fe0000000000000r
__real@3f50624dd2f1a9fc DQ 03f50624dd2f1a9fcr

_g$ = 8
tv132 = 16
_x$ = 16
f1 PROC
	fld	QWORD PTR _x$[esp-4]
	fld	QWORD PTR __real@3f50624dd2f1a9fc
	fld	QWORD PTR __real@3fe0000000000000
	fld	QWORD PTR _g$[esp-4]
$LN2@f1:
	fld	ST(0)
	fmul	ST(0), ST(1)
	fsub	ST(0), ST(4)
	call	__ftol2_sse
	cdq
	xor	eax, edx
	sub	eax, edx
	mov	DWORD PTR tv132[esp-4], eax
	fild	DWORD PTR tv132[esp-4]
	fcomp	ST(3)
	fnstsw	ax
	test	ah, 5
	jnp	SHORT $LN19@f1
	fld	ST(3)
	fdiv	ST(0), ST(1)
	faddp	ST(1), ST(0)
	fmul	ST(0), ST(1)
	jmp	SHORT $LN2@f1
$LN19@f1:
	fstp	ST(3)
	fstp	ST(1)
	fstp	ST(0)
	ret	0
f1 ENDP

__real@3ff0000000000000 DQ 03ff0000000000000r

_x$ = 8
f2 PROC
	fld	QWORD PTR _x$[esp-4]
	sub	esp, 16
	fstp	QWORD PTR [esp+8]
	fld1
	fstp	QWORD PTR [esp]
	call	f1
	add	esp, 16
	ret	0
f2 ENDP
