include(`commons.m4')__real@3f800000 DD 03f800000r			; 1

tv128 = -4
_tmp$ = -4
?float_rand@@YAMXZ PROC
	push	ecx
	call	?my_rand@@YAIXZ
; EAX=_EN(`pseudorandom value')_RU(`псевдослучайное значение')
	and	eax, 8388607				; 007fffffH
	or	eax, 1065353216				; 3f800000H
; EAX=_EN(`pseudorandom value')_RU(`псевдослучайное значение') & 0x007fffff | 0x3f800000
; _EN(`store it into local stack:')_RU(`сохранить его в локальном стеке:')
	mov	DWORD PTR _tmp$[esp+4], eax
; _EN(`reload it as float point number:')_RU(`перезагрузить его как число с плавающей точкой:')
	movss	xmm0, DWORD PTR _tmp$[esp+4]
; _EN(`subtract')_RU(`вычесть') 1.0:
	subss	xmm0, DWORD PTR __real@3f800000
; _EN(`move value to ST0 by placing it in temporary variable...')_RU(`переместить значение в ST0 поместив его во временную переменную...')
	movss	DWORD PTR tv128[esp+4], xmm0
; ... _EN(`and reloading it into ST0:')_RU(`и затем перезагрузив её в ST0:')
	fld	DWORD PTR tv128[esp+4]
	pop	ecx
	ret	0
?float_rand@@YAMXZ ENDP
