f PROC
        PUSH     {r4,lr}
        MOVS     r4,r0
        ADDEQ    r0,r1,#1
        POPEQ    {r4,pc}
        CMP      r1,#0
        MOVEQ    r1,#1
        SUBEQ    r0,r0,#1
        BEQ      |L0.48|
        SUB      r1,r1,#1
        BL       f
        MOV      r1,r0
        SUB      r0,r4,#1
|L0.48|
        POP      {r4,lr}
        B        f
        ENDP
