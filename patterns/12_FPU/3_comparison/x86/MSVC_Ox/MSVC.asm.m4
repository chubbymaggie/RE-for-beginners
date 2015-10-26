include(`commons.m4')_a$ = 8                ; size = 8
_b$ = 16               ; size = 8
_d_max    PROC
    fld    QWORD PTR _b$[esp-4]
    fld    QWORD PTR _a$[esp-4]

; _EN(`current stack state')_RU(`состояне стека сейчас'): ST(0) = _a, ST(1) = _b

    fcom    ST(1) ; _EN(`compare')_RU(`сравнить') _a _EN(`and')_RU(`и') ST(1) = (_b)
    fnstsw  ax
    test    ah, 65 ; 00000041H
    jne     SHORT $LN5@d_max
; _EN(``copy ST(0) to ST(1) and pop register,'')_RU(``копировать содержимое ST(0) в ST(1) и вытолкнуть значение из стека,'')
; _EN(``leave (\_a) on top'')_RU(``оставив \_a на вершине'')
    fstp    ST(1)  

; _EN(`current stack state')_RU(`состояние стека сейчас'): ST(0) = _a

    ret    0
$LN5@d_max:
; _EN(``copy ST(0) to ST(0) and pop register,'')_RU(``копировать содержимое ST(0) в ST(0) и вытолкнуть значение из стека,'')
; _EN(``leave (\_b) on top'')_RU(``оставив \_b на вершине'')
    fstp    ST(0)  

; _EN(`current stack state')_RU(`состояние стека сейчас'): ST(0) = _b

    ret    0
_d_max    ENDP
