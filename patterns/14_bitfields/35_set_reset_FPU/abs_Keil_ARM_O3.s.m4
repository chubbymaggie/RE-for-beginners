include(`commons.m4')my_abs PROC
; _EN(`clear bit')_RU(`очистить бит'):
        BIC      r0,r0,#0x80000000
        BX       lr
        ENDP

set_sign PROC
; _EN(`do OR')_RU(`применить ИЛИ'):
        ORR      r0,r0,#0x80000000
        BX       lr
        ENDP

negate PROC
; _EN(`do XOR')_RU(`применить исключающее ИЛИ'):
        EOR      r0,r0,#0x80000000
        BX       lr
        ENDP
