include(`commons.m4')main            proc near
                push    ebp
                mov     ebp, esp
                push    esi
                push    ebx
                and     esp, 0FFFFFFF0h
                sub     esp, 40h
                mov     dword ptr [esp], 0 ; timer
                lea     ebx, [esp+14h]
                call    _time
                lea     esi, [esp+38h]
                mov     [esp+4], ebx    ; tp
                mov     [esp+10h], eax
                lea     eax, [esp+10h]
                mov     [esp], eax      ; timer
                call    _localtime_r
                nop
                lea     esi, [esi+0]	; NOP
loc_80483D8:
; _EN(``EBX here is pointer to structure, ESI is the pointer to the end of it'')_RU(``EBX здесь это указатель на структуру, ESI - указатель на её конец'').
                mov     eax, [ebx]	; _EN(`get 32-bit word from array')_RU(`загрузить 32-битное слово из массива')
                add     ebx, 4          ; _EN(`next field in structure')_RU(`следующее поле в структуре')
                mov     dword ptr [esp+4], offset a0x08xD ; "0x%08X (%d)\n"
                mov     dword ptr [esp], 1
                mov     [esp+0Ch], eax	; _EN(`pass value to')_RU(`передать значение в') printf()
                mov     [esp+8], eax	; _EN(`pass value to')_RU(`передать значение в') printf()
                call    ___printf_chk
                cmp     ebx, esi        ; _EN(`meet structure end')_RU(`достигли конца структуры')?
                jnz     short loc_80483D8	; _EN(`no - load next value then')_RU(`нет - тогда загрузить следующее значение')
                lea     esp, [ebp-8]
                pop     ebx
                pop     esi
                pop     ebp
                retn
main            endp

