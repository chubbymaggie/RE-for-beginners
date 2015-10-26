include(`commons.m4')my_strlen:
; _EN(`"eos" variable will always reside in')_RU(`переменная "eos" всегда будет находиться в') $v1:
                move    $v1, $a0

loc_4:
; _EN(`load byte at address in "eos" into')_RU(`загрузить байт по адресу в "eos" в') $a1:
                lb      $a1, 0($v1)
                or      $at, $zero ; load delay slot, NOP
; _EN(``if loaded byte is not zero, jump to'')_RU(``если загруженный байт не ноль, перейти на'') loc_4:
                bnez    $a1, loc_4
; _EN(`increment "eos" anyway')_RU(``в любом случае, инкрементируем "eos"''):
                addiu   $v1, 1 ; branch delay slot
; _EN(``loop finished. invert "str" variable'')_RU(``цикл закончен. инвертируем переменную "str"''):
                nor     $v0, $zero, $a0
; $v0=-str-1
                jr      $ra
; _EN(`return value')_RU(`возвращаемое значение') = $v1 + $v0 = eos + ( -str-1 ) = eos - str - 1
                addu    $v0, $v1, $v0 ; branch delay slot
