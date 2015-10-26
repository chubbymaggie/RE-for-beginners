        PUSH     {r4-r12,lr}
        MOV      r9,r2
        MOV      r10,r1
        MOV      r11,r0
        MOV      r5,#0
|L0.20|
        ADD      r0,r5,r5,LSL #3
        ADD      r0,r0,r5,LSL #4
        MOV      r4,#0
        ADD      r8,r10,r0,LSL #5
        ADD      r7,r11,r0,LSL #5
        ADD      r6,r9,r0,LSL #5
|L0.44|
        ADD      r0,r8,r4,LSL #3
        LDM      r0,{r2,r3}
        ADD      r1,r7,r4,LSL #3
        LDM      r1,{r0,r1}
        BL       __aeabi_dadd
        ADD      r2,r6,r4,LSL #3
        ADD      r4,r4,#1
        STM      r2,{r0,r1}
        CMP      r4,#0x64
        BLT      |L0.44|
        ADD      r5,r5,#1
        CMP      r5,#0xc8
        BLT      |L0.20|
        POP      {r4-r12,pc}
