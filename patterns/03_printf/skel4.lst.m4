﻿include(`commons.m4')MOV R0, _arg1
MOV R1, _arg2
MOV R2, _arg3
MOV R3, _arg4
; _EN(``pass 5th, 6th argument, etc, in stack (if needed)'')_RU(``передать 5-й, 6-й аргумент, и~т.д., в стеке (если нужно)'')
BL _EN(`function')_RU(`функция')
; _EN(`modify stack pointer (if needed)')_RU(`модифицировать указатель стека (если нужно)')
