include(`commons.m4')    MOV [counter], 2 ; _EN(`initialization')_RU(`инициализация')
    JMP label_check
label_increment:
    ADD [counter], 1 ; _increment
label_check:
    CMP [counter], 10
    JGE exit
    ; _EN(`loop body')_RU(`тело цикла')
    ; _EN(`do something here')_RU(`делаем тут что-нибудь')
    ; _EN(`use counter variable in local stack')_RU(`используем переменную счетчика в локальном стеке')
    JMP label_increment
exit:
