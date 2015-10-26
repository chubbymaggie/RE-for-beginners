include(`commons.m4')str_trim PROC
        PUSH     {r4,lr}
; R0=s
        MOV      r4,r0
; R4=s
        BL       strlen       ; strlen() _EN(`takes "s" value from R0')_RU(`берет значение "s" из R0')
; R0=str_len
        MOV      r3,`#'0
; R3 _EN(`will always hold')_RU(`всегда будет содержать') 0
|L0.16|
        CMP      r0,`#'0        ; str_len==0?
        ADDNE    r2,r4,r0     ; (_if str_len!=0) R2=R4+R0=s+str_len
        LDRBNE   r1,[r2,`#'-1]  ; (_if str_len!=0) R1=_EN(`load byte at address')_RU(`загрузить байт по адресу') R2-1=s+str_len-1
        CMPNE    r1,`#'0        ; (_if str_len!=0) _EN(`compare loaded byte against')_RU(`сравнить загруженный байт с') 0
        BEQ      |L0.56|      ; _EN(`jump to exit if')_RU(``перейти на выход, если'') str_len==0 _EN(`or loaded byte is')_RU(`или если загруженный байт - это') 0
        CMP      r1,`#'0xd      ; _EN(`is loaded byte')_RU(`загруженный байт - это') '\r'?
        CMPNE    r1,`#'0xa      ; (_EN(`if loaded byte is not')_RU(`если загруженный байт - это не') '\r') _EN(`is loaded byte')_RU(`загруженный байт - это') '\r'?
        SUBEQ    r0,r0,`#'1     ; (_EN(`if loaded byte is')_RU(`если загруженный байт - это') '\r' _or '\n') R0-- _EN(`or')_RU(`или') str_len--
        STRBEQ   r3,[r2,`#'-1]  ; (_EN(`if loaded byte is')_RU(`если загруженный байт - это') '\r' _or '\n') _EN(`store R3 (zero) at address')_RU(`записать R3 (ноль) по адресу') R2-1=s+str_len-1
        BEQ      |L0.16|      ; _EN(`jump to loop begin if loaded byte was')_RU(``перейти на начало цикла, если загруженный байт был'') '\r' _or '\n'
|L0.56|
; _return "s"
        MOV      r0,r4
        POP      {r4,pc}
        ENDP
