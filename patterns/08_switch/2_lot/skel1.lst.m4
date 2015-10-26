include(`commons.m4')MOV REG, input
CMP REG, 4 ; _EN(`maximal number of cases')_RU(`максимальное количество меток')
JA default
SHL REG, 2 ; _EN(``find element in table. shift for 3 bits in x64.'')_RU(``найти элемент в таблице. сдвинуть на 3 бита в x64'')
MOV REG, jump_table[REG]
JMP REG

case1:
    ; _EN(`do something')_RU(`делать что-то')
    JMP exit
case2:
    ; _EN(`do something')_RU(`делать что-то')
    JMP exit
case3:
    ; _EN(`do something')_RU(`делать что-то')
    JMP exit
case4:
    ; _EN(`do something')_RU(`делать что-то')
    JMP exit
case5:
    ; _EN(`do something')_RU(`делать что-то')
    JMP exit

default:

    ...

exit:

    ....

jump_table dd case1
           dd case2
           dd case3
           dd case4
           dd case5
