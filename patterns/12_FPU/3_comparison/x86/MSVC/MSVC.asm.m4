include(`commons.m4')PUBLIC    _d_max
_TEXT    SEGMENT
_a$ = 8                ; size = 8
_b$ = 16               ; size = 8
_d_max     PROC
    push   ebp
    mov    ebp, esp
    fld    QWORD PTR _b$[ebp]

; _EN(`current stack state')_RU(`состояние стека сейчас'): ST(0) = _b
; _EN(``compare \_b (ST(0)) and \_a, and pop register'')_RU(``сравниваем \_b (в ST(0)) и \_a, затем выталкиваем значение из стека'')

    fcomp  QWORD PTR _a$[ebp] 

; _EN(`stack is empty here')_RU(`стек теперь пустой')

    fnstsw ax
    test   ah, 5
    jp     SHORT $LN1@d_max

; _EN(`we are here only if')_RU(`мы здесь только если') a>b

    fld    QWORD PTR _a$[ebp]
    jmp    SHORT $LN2@d_max
$LN1@d_max:
    fld    QWORD PTR _b$[ebp]
$LN2@d_max:
    pop    ebp
    ret    0
_d_max     ENDP
