include(`commons.m4')            EXPORT _main
_main
            STMFD   SP!, {R4,LR}
            SUB     SP, SP, `#'0x50      ; _EN(`allocate place for 20 int variables')_RU(`выделить место для 20-и переменных типа int')

; _EN(`first loop')_RU(`первый цикл')

            MOV     R4, #0             ; i
            B       loc_4A0
loc_494                             
            MOV     R0, R4,LSL#1       ; R0=R4*2
            STR     R0, [SP,R4,LSL`#'2]  ; _EN(`store R0 to SP+R4<<2 (same as SP+R4*4)')_RU(`сохранить R0 в SP+R4<<2 (то же что и SP+R4*4)')
            ADD     R4, R4, #1         ; i=i+1

loc_4A0                             
            CMP     R4, #20            ; i<20?
            BLT     loc_494            ; _EN(``yes, run loop body again'')_RU(``да, запустить тело цикла снова'')

; _EN(`second loop')_RU(`второй цикл')

            MOV     R4, #0             ; i
            B       loc_4C4
loc_4B0                             
            LDR     R2, [SP,R4,LSL`#'2]  ; _EN(``(second printf argument) R2=*(SP+R4<<4) (same as *(SP+R4*4))'')_RU(``(второй аргумент printf) R2=*(SP+R4<<4) (то же что и *(SP+R4*4))'')
            MOV     R1, R4             ; (_EN(`first printf argument')_RU(`первый аргумент printf')) R1=i
            ADR     R0, aADD           ; "a[%d]=%d\n"
            BL      __2printf
            ADD     R4, R4, #1         ; i=i+1

loc_4C4                             
            CMP     R4, #20            ; i<20?
            BLT     loc_4B0            ; _EN(``yes, run loop body again'')_RU(``да, запустить тело цикла снова'')
            MOV     R0, `#'0             ; _EN(`value to return')_RU(`значение для возврата')
            ADD     SP, SP, `#'0x50      ; _EN(``deallocate chunk, allocated for 20 int variables'')_RU(``освободить блок в стеке, выделенное для 20 переменных'')
            LDMFD   SP!, {R4,PC}
