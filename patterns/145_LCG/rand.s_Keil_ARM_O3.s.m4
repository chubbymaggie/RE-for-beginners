include(`commons.m4')my_srand PROC
        LDR      r1,|L0.52|  ; _EN(`load pointer to')_RU(`загрузить указатель на') rand_state
        STR      r0,[r1,`#'0]  ; _EN(`save')_RU(`сохранить') rand_state
        BX       lr
        ENDP

my_rand PROC
        LDR      r0,|L0.52|  ; _RU(`загрузить указатель на')_EN(`load pointer to') rand_state
        LDR      r2,|L0.56|  ; _RU(`загрузить')_EN(`load') RNG_a
        LDR      r1,[r0,`#'0]  ; _RU(`загрузить')_EN(`load') rand_state
        MUL      r1,r2,r1
        LDR      r2,|L0.60|  ; _RU(`загрузить')_EN(`load') RNG_c
        ADD      r1,r1,r2
        STR      r1,[r0,`#'0]  ; _RU(`сохранить')_EN(`save') rand_state
; AND _RU(`с')_EN(`with') 0x7FFF:
        LSL      r0,r1,#17
        LSR      r0,r0,#17
        BX       lr
        ENDP

|L0.52|
        DCD      ||.data||
|L0.56|
        DCD      0x0019660d
|L0.60|
        DCD      0x3c6ef35f

        AREA ||.data||, DATA, ALIGN=2

rand_state
        DCD      0x00000000
