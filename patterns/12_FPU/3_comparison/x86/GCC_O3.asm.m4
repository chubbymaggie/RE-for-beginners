include(`commons.m4')                public d_max
d_max           proc near

arg_0           = qword ptr  8
arg_8           = qword ptr  10h

                push    ebp
                mov     ebp, esp
                fld     [ebp+arg_0] ; _a
                fld     [ebp+arg_8] ; _b

; _EN(`stack state now')_RU(`состояние стека сейчас'): ST(0) = _b, ST(1) = _a
                fxch    st(1)

; _EN(`stack state now')_RU(`состояние стека сейчас'): ST(0) = _a, ST(1) = _b
                fucom   st(1) ; _EN(`compare \_a and \_b')_RU(`сравнить \_a и \_b')
                fnstsw  ax
                sahf
                ja      short loc_8048448

; _EN(``store ST(0) to ST(0) (idle operation), pop value at top of stack,'')_RU(``записать ST(0) в ST(0) (холостая операция), выкинуть значение лежащее на вершине стека,'')
; _EN(``leave \_b at top'')_RU(``оставить \_b на вершине стека'')
                fstp    st
                jmp     short loc_804844A

loc_8048448:
; _EN(``store \_a to ST(0), pop value at top of stack, leave \_a at top'')_RU(``записать \_a в ST(0), выкинуть значение лежащее на вершине стека, оставить \_a на вершине стека'')
                fstp    st(1)

loc_804844A:
                pop     ebp
                retn
d_max           endp
