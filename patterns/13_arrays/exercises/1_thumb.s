        PUSH     {r0-r2,r4-r7,lr}
        MOVS     r4,#0
        SUB      sp,sp,#8
|L0.6|
        MOVS     r1,#0x19
        MOVS     r0,r4
        LSLS     r1,r1,#5
        MULS     r0,r1,r0
        LDR      r2,[sp,#8]
        LDR      r1,[sp,#0xc]
        ADDS     r2,r0,r2
        STR      r2,[sp,#0]
        LDR      r2,[sp,#0x10]
        MOVS     r5,#0
        ADDS     r7,r0,r2
        ADDS     r0,r0,r1
        STR      r0,[sp,#4]
|L0.32|
        LSLS     r6,r5,#3
        ADDS     r0,r0,r6
        LDM      r0!,{r2,r3}
        LDR      r0,[sp,#0]
        ADDS     r1,r0,r6
        LDM      r1,{r0,r1}
        BL       __aeabi_dadd
        ADDS     r2,r7,r6
        ADDS     r5,r5,#1
        STM      r2!,{r0,r1}
        CMP      r5,#0x64
        BGE      |L0.62|
        LDR      r0,[sp,#4]
        B        |L0.32|
|L0.62|
        ADDS     r4,r4,#1
        CMP      r4,#0xc8
        BLT      |L0.6|
        ADD      sp,sp,#0x14
        POP      {r4-r7,pc}
