include(`commons.m4')my_memcpy:
; _EN(`jump to loop check part:')_RU(``перейти на ту часть цикла, где проверяется условие:'')
                b       loc_14
; _EN(`initialize counter (i) at 0')_RU(`инициализировать счетчик (i) в 0')
; _EN(`it will always reside in')_RU(`он будет всегда находится в регистре') \$v0:
                move    $v0, $zero ; branch delay slot

loc_8:                                   # CODE XREF: my_memcpy+1C
; _EN(`load byte as unsigned at address in \$t0 to \$v1:')_RU(`загрузить байт как беззнаковый по адресу \$t0 в \$v1:')
                lbu     $v1, 0($t0)
; _EN(`increment counter')_RU(`инкремент счетчика') (i):
                addiu   $v0, 1
; _EN(`store byte at')_RU(`записываем байт по адресу') $a3
                sb      $v1, 0($a3)

loc_14:                                  # CODE XREF: my_memcpy
; _EN(`check if counter (i) in \$v0 is still less then 3rd function argument ("cnt" in \$a2):')_RU(``проверить, до сих пор ли счетчик (i) в \$v0 меньше чем третий аргумент ("cnt" в \$a2)'')
                sltu    $v1, $v0, $a2
; _EN(`form address of byte in source block')_RU(`сформировать адрес байта исходного блока'):
                addu    $t0, $a1, $v0
; $t0 = $a1+$v0 = src+i
; _EN(`jump to loop body if counter sill less then')_RU(``перейти на тело цикла, если счетчик всё еще меньше чем'') "cnt":
                bnez    $v1, loc_8
; _EN(`form address of byte in destination block')_RU(`сформировать адрес байта в целевом блоке') (\$a3 = \$a0+\$v0 = dst+i):
                addu    $a3, $a0, $v0 ; branch delay slot
; _EN(`finish if')_RU(``закончить, если'') BNEZ _EN(``wasn't triggered:'')_RU(`не сработала')
                jr      $ra
                or      $at, $zero ; branch delay slot, NOP
