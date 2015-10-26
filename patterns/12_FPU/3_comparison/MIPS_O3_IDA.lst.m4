include(`commons.m4')d_max:
; _EN(`set FPU condition bit if')_RU(``установить бит условия FPU в 1, если'') $f14<$f12 (b<a):
                c.lt.d  $f14, $f12
                or      $at, $zero ; NOP
; _EN(`jump to')_RU(`перейти на') locret_14 _EN(`if condition bit is set')_RU(`если бит условия выставлен')
                bc1t    locret_14
; _EN(`this instruction is always executed')_RU(`эта инструкция всегда исполняется') (_EN(`set return value to')_RU(`установить значение для возврата в') "a"):
                mov.d   $f0, $f12  ; branch delay slot
; _EN(``this instruction is executed only if branch was not taken (i.e., if b>=a)'')_RU(``эта инструкция исполняется только если переход не произошел (т.е. если b>=a)'')
; _EN(`set return value to')_RU(`установить значение для возврата в') "b":
                mov.d   $f0, $f14

locret_14:
                jr      $ra
                or      $at, $zero ; branch delay slot, NOP
