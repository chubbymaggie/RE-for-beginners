include(`commons.m4')MOV X0, _arg1
MOV X1, _arg2
MOV X2, _arg3
MOV X3, _arg4
MOV X4, _EN(`5th argument')_RU(`5-й аргумент')
MOV X5, _EN(`6th argument')_RU(`6-й аргумент')
MOV X6, _EN(`7th argument')_RU(`7-й аргумент')
MOV X7, _EN(`8th argument')_RU(`8-й аргумент')
; _EN(``pass 9th, 10th argument, etc, in stack (if needed)'')_RU(``передать 9-й, 10-й аргумент, и~т.д., в стеке (если нужно)'')
BL CALL _EN(`function')_RU(`функция')
; _EN(`modify stack pointer (if needed)')_RU(`модифицировать указатель стека (если нужно)')
