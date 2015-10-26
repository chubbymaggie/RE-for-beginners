include(`commons.m4')do_filp_open    proc near
...
                push    ebp
                mov     ebp, esp
                push    edi
                push    esi
                push    ebx
                mov     ebx, ecx
                add     ebx, 1
                sub     esp, 98h
                mov     esi, [ebp+arg_4] ; acc_mode (_EN(`5th arg')_RU(`пятый аргумент'))
                test    bl, 3
                mov     [ebp+var_80], eax ; dfd (_EN(`1th arg')_RU(`первый аргумент'))
                mov     [ebp+var_7C], edx ; pathname (_EN(`2th arg')_RU(`второй аргумент'))
                mov     [ebp+var_78], ecx ; open_flag (_EN(`3th arg')_RU(`третий аргумент'))
                jnz     short loc_C01EF684
                mov     ebx, ecx        ; ebx <- open_flag
