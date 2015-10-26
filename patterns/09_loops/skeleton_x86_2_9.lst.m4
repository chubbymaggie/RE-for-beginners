include(`commons.m4')    MOV [counter], 2 ; _EN(`initialization')_RU(`инициализация')
    JMP check
body:
    ; _EN(`loop body')_RU(`тело цикла')
    ; _EN(`do something here')_RU(`делаем тут что-нибудь')
    ; _EN(`use counter variable in local stack')_RU(`используем переменную счетчика в локальном стеке')
    MOV REG, [counter] ; _increment
    INC REG 
    MOV [counter], REG
check:
    CMP [counter], 9
    JLE body
