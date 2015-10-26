        PUSH     {r4-r10,lr}
        ADD      r5,r1,#8
        LDM      r5,{r5,r7}
        LDR      r2,[r0,#4]
        LDR      r3,[r0,#0]
        LDR      r4,|L0.116|
        LDR      r6,[r1,#4]
        LDR      r8,[r1,#0]
        MOV      r12,#0
        MOV      r1,r12
|L0.40|
        ADD      r12,r12,r4
        ADD      r9,r8,r2,LSL #4
        ADD      r10,r2,r12
        EOR      r9,r9,r10
        ADD      r10,r6,r2,LSR #5
        EOR      r9,r9,r10
        ADD      r3,r3,r9
        ADD      r9,r5,r3,LSL #4
        ADD      r10,r3,r12
        EOR      r9,r9,r10
        ADD      r10,r7,r3,LSR #5
        EOR      r9,r9,r10
        ADD      r1,r1,#1
        CMP      r1,#0x20
        ADD      r2,r2,r9
        STRCS    r2,[r0,#4]
        STRCS    r3,[r0,#0]
        BCC      |L0.40|
        POP      {r4-r10,pc}

|L0.116|
        DCD      0x9e3779b9
