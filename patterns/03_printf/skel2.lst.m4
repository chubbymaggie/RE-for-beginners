﻿include(`commons.m4')MOV RCX, _arg1
MOV RDX, _arg2
MOV R8, _arg3
MOV R9, _arg4
...
PUSH _EN(``5th, 6th argument, etc (if needed)'')_RU(``5-й, 6-й аргумент, и~т.д. (если нужно)'')
CALL _EN(`function')_RU(`функция')
; _EN(`modify stack pointer (if needed)')_RU(`модифицировать указатель стека (если нужно)')
