||f1|| PROC
        CMP      r0,#0
        RSB      r1,r0,#0
        AND      r0,r0,r1
        CLZ      r0,r0
        RSBNE    r0,r0,#0x1f
        BX       lr
        ENDP

f PROC
        MOVS     r2,r0
        MOV      r3,r1
        MOVEQ    r0,r1
        CMPNE    r3,#0
        PUSH     {lr}
        POPEQ    {pc}
        ORR      r0,r2,r3
        BL       ||f1||
        MOV      r12,r0
        MOV      r0,r2
        BL       ||f1||
        LSR      r2,r2,r0
|L0.196|
        MOV      r0,r3
        BL       ||f1||
        LSR      r0,r3,r0
        CMP      r2,r0
        EORHI    r1,r2,r0
        EORHI    r0,r0,r1
        EORHI    r2,r1,r0
        BEQ      |L0.240|
        CMP      r2,#1
        SUBNE    r3,r0,r2
        BNE      |L0.196|
|L0.240|
        LSL      r0,r2,r12
        POP      {pc}
        ENDP
