include(`commons.m4')CMP register, register/value
Jcc true ; cc=_EN(`condition code')_RU(`код условия')
false:
... _EN(`some code to be executed if comparison result is false')_RU(``код, исполняющийся, если сравнение ложно'') ...
JMP exit 
true:
... _EN(`some code to be executed if comparison result is true')_RU(``код, исполняющийся, если сравнение истинно'') ...
exit:
