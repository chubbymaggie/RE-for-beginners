include(`commons.m4')i$ = 8
my_abs	PROC
; ECX = input
	test	ecx, ecx
; _RU(`проверить знак входного значения')_EN(`check for sign of input value')
; _RU(`пропустить инструкцию NEG если знак положительный')_EN(`skip NEG instruction if sign is positive')
	jns	SHORT $LN2@my_abs
; _RU(`поменять знак')_EN(`negate value')
	neg	ecx
$LN2@my_abs:
; _RU(`подготовить результат в')_EN(`prepare result in') EAX:
	mov	eax, ecx
	ret	0
my_abs	ENDP
