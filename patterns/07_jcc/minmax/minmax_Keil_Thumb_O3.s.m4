include(`commons.m4')my_max PROC
; R0=A
; R1=B
; _EN(`compare A and B')_RU(`сравнить A и B'):
        CMP      r0,r1
; _EN(`branch if A is greater then B')_RU(``переход, если A больше B''):
        BGT      |L0.6|
; _EN(`otherwise')_RU(`в противном случае') (A<=B) _return R1 (B):
        MOVS     r0,r1
|L0.6|
; _return
        BX       lr
        ENDP

my_min PROC
; R0=A
; R1=B
; _EN(`compare A and B')_RU(`сравнить A и B'):
        CMP      r0,r1
; _EN(`branch if A is less then B')_RU(``переход, если A меньше B''):
        BLT      |L0.14|
; _EN(`otherwise')_RU(`в противном случае') (A>=B) _return R1 (B):
        MOVS     r0,r1
|L0.14|
; _return
        BX       lr
        ENDP
