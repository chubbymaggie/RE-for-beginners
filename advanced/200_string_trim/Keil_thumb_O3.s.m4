include(`commons.m4')str_trim PROC
        PUSH     {r4,lr}
        MOVS     r4,r0
; R4=s
        BL       strlen        ; strlen() _EN(`takes "s" value from R0')_RU(`берет значение "s" из R0')
; R0=str_len
        MOVS     r3,`#'0
; R3 _EN(`will always hold')_RU(`всегда будет содержать') 0
        B        |L0.24|
|L0.12|
        CMP      r1,`#'0xd       ; _EN(`is loaded byte')_RU(`загруженный байт - это') '\r'?
        BEQ      |L0.20|       
        CMP      r1,`#'0xa       ; _EN(`is loaded byte')_RU(`загруженный байт - это') '\n'?
        BNE      |L0.38|       ; _EN(``jump to exit, if no'')_RU(``перейти на выход, если нет'')
|L0.20|
        SUBS     r0,r0,`#'1      ; R0-- _or str_len--
        STRB     r3,[r2,`#'0x1f] ; _EN(`store')_RU(`записать') 0 _EN(`at address')_RU(`по адресу') R2+0x1F=s+str_len-0x20+0x1F=s+str_len-1
|L0.24|
        CMP      r0,`#'0         ; str_len==0?
        BEQ      |L0.38|       ; _EN(`yes? jump to exit')_RU(`да? тогда перейти на выход')
        ADDS     r2,r4,r0      ; R2=R4+R0=s+str_len
        SUBS     r2,r2,`#'0x20   ; R2=R2-0x20=s+str_len-0x20
        LDRB     r1,[r2,`#'0x1f] ; _EN(`load byte at address')_RU(`загрузить байт по адресу') R2+0x1F=s+str_len-0x20+0x1F=s+str_len-1 _EN(`to')_RU(`в') R1
        CMP      r1,`#'0         ; _EN(`is loaded byte')_RU(`загруженный байт - это') 0?
        BNE      |L0.12|       ; _EN(``jump to loop begin, if it's not 0'')_RU(``перейти на начало цикла, если это не 0'')
|L0.38|
; _return "s"
        MOVS     r0,r4
        POP      {r4,pc}
        ENDP
