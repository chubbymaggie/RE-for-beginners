include(`commons.m4')                public f
f               proc near

arg_0           = qword ptr  8
arg_8           = qword ptr  10h

                push    ebp
                fld     ds:dbl_8048608 ; 3.14

; _RU(`состояние стека сейчас')_EN(`stack state now'): ST(0) = 3.14

                mov     ebp, esp
                fdivr   [ebp+arg_0]

; _RU(`состояние стека сейчас')_EN(`stack state now'): ST(0) = _EN(`result of division')_RU(`результат деления')

                fld     ds:dbl_8048610 ; 4.1

; _RU(`состояние стека сейчас')_EN(`stack state now'): ST(0) = 4.1, ST(1) = _EN(`result of division')_RU(`результат деления')

                fmul    [ebp+arg_8]

; _RU(`состояние стека сейчас')_EN(`stack state now'): ST(0) = _EN(`result of multiplication')_RU(`результат умножения'), ST(1) = _EN(`result of division')_RU(`результат деления')

                pop     ebp
                faddp   st(1), st

; _RU(`состояние стека сейчас')_EN(`stack state now'): ST(0) = _EN(`result of addition')_RU(`результат сложения')

                retn
f               endp
