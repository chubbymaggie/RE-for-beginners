include(`commons.m4')my_max PROC
; R0=A
; R1=B
; _EN(`compare A and B')_RU(`сравнить A и B'):
        CMP      r0,r1
; _EN(`return B instead of A by placing B in R0')_RU(`вернуть B вместо A копируя B в R0')
; _EN(``this instruction will trigger only if A<=B (hence, LE - Less or Equal)'')_RU(``эта инструкция сработает только если A<=B (т.е. LE - Less or Equal, меньше или равно)'')
; _EN(``if instruction is not triggered (in case of A>B), A is still in R0 register'')_RU(``если инструкция не сработает (в случае A>B), A всё еще в регистре R0'')
        MOVLE    r0,r1
        BX       lr
        ENDP

my_min PROC
; R0=A
; R1=B
; _EN(`compare A and B')_RU(`сравнить A и B'):
        CMP      r0,r1
; _EN(`return B instead of A by placing B in R0')_RU(`вернуть B вместо A копируя B в R0')
; _EN(``this instruction will trigger only if A>=B (hence, GE - Greater or Equal)'')_RU(``эта инструкция сработает только если A>=B (т.е. GE - Greater or Equal, больше или равно)'')
; _EN(``if instruction is not triggered (in case of A<B), A value is still in R0 register'')_RU(``если инструкция не сработает (в случае A<B), A всё еще в регистре R0'')
        MOVGE    r0,r1
        BX       lr
        ENDP
