include(`commons.m4')my_abs:
; _EN(`jump if')_RU(`перейти если') $a0<0:
                bltz    $a0, locret_10
; _EN(`just return input value')_RU(`просто вернуть входное значение') ($a0) _in $v0:
                move    $v0, $a0
                jr      $ra
                or      $at, $zero ; branch delay slot, NOP
locret_10:
; _EN(`negate input value and store it in')_RU(`поменять у значения знак и сохранить его в') $v0:
                jr      $ra
; _EN(``this is pseudoinstruction. in fact, this is'')_RU(``это псевдоинструкция. на самом деле, это'') "subu $v0,$zero,$a0" ($v0=0-$a0)
                negu    $v0, $a0
