include(`commons.m4')my_max:
; _EN(`set')_RU(`установить') $v1 _RU(``to 1, if'')_RU(``в 1, если'') $a1<$a0:
                slt     $v1, $a1, $a0
; _EN(``jump, if'')_RU(``переход, если'') $a1<$a0:
                beqz    $v1, locret_10
; _EN(`this is')_RU(`это') branch delay slot
; _EN(`prepare')_RU(`подготовить') $a1 _in $v0 _EN(`in case of branch triggered')_RU(``на случай, если переход сработает''):
                move    $v0, $a1 
; _EN(``no branch triggered, prepare'')_RU(``переход не сработал, подготовить'') $a0 _in $v0:
                move    $v0, $a0

locret_10:
                jr      $ra
                or      $at, $zero ; branch delay slot, NOP

; _EN(``the min() function is same, but input operands in SLT instruction are swapped'')_RU(``функция min() точно такая же, но входные операнды в инструкции SLT поменены местами''):
my_min:
                slt     $v1, $a0, $a1
                beqz    $v1, locret_28
                move    $v0, $a1
                move    $v0, $a0

locret_28:
                jr      $ra
                or      $at, $zero ; branch delay slot, NOP
