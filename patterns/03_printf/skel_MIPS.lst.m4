include(`commons.m4')LI $4, _arg1 ; AKA $A0
LI $5, _arg2 ; AKA $A1
LI $6, _arg3 ; AKA $A2
LI $7, _arg4 ; AKA $A3
; _EN(``pass 5th, 6th argument, etc, in stack (if needed)'')_RU(``передать 5-й, 6-й аргумент, и~т.д., в стеке (если нужно)'')
LW temp_reg, _EN(`address of function')_RU(`адрес функции')
JALR temp_reg
