include(`commons.m4')                public main
main            proc near

var_20          = dword ptr -20h

                push    ebp
                mov     ebp, esp
                and     esp, 0FFFFFFF0h
                push    ebx
                mov     ebx, 2    ; i=2
                sub     esp, 1Ch

; _EN(`aligning label loc\_80484D0 (loop body begin) by 16-byte border')_RU(`выравнивание метки loc\_80484D0 (начало тела цикла) по 16-байтной границе'):
                nop

loc_80484D0:
; _EN(`pass (i) as first argument to printing\_function()')_RU(`передать i как первый аргумент для printing\_function()'):
                mov     [esp+20h+var_20], ebx 
                add     ebx, 1    ; i++
                call    printing_function
                cmp     ebx, 64h  ; i==100?
                jnz     short loc_80484D0 ; _EN(``if not, continue'')_RU(``если нет, продолжать'')
                add     esp, 1Ch
                xor     eax, eax  ; _return 0
                pop     ebx
                mov     esp, ebp
                pop     ebp
                retn
main            endp
