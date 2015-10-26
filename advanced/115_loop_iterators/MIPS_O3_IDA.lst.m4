include(`commons.m4'); $a0=a1
; $a1=a2
; $a2=cnt
f:
; _EN(`jump to loop check code')_RU(`переход на код проверки в цикле'):
                beqz    $a2, locret_24
; _EN(`initialize counter (i) at 0')_RU(`инициализировать счетчик (i) в 0'):
                move    $v0, $zero ; branch delay slot, NOP

loc_8:
; _EN(`load 32-bit word at')_RU(`загрузить 32-битное слово в') $a1
                lw      $a3, 0($a1)
; _EN(`increment counter')_RU(`инкремент счетчика') (i):
                addiu   $v0, 1
; _EN(`check for finish (compare "i" in \$v0 and "cnt" in \$a2)')_RU(`проверка на конец (сравнить "i" в \$v0 и "cnt" в \$a2)'):
                sltu    $v1, $v0, $a2
; _EN(`store 32-bit word at')_RU(`сохранить 32-битное слово в') $a0:
                sw      $a3, 0($a0)
; _EN(`add')_RU(`прибавить') 0x1C (28) _EN(`to')_RU(`к') \$a1 _EN(`at each iteration')_RU(`на каждой итерации'):
                addiu   $a1, 0x1C
; _EN(`jump to loop body if')_RU(``перейти на тело цикла, если'') i<cnt:
                bnez    $v1, loc_8
; _EN(`add')_RU(`прибавить') 0xC (12) _EN(`to')_RU(`к') \$a0 _EN(`at each iteration')_RU(`на каждой итерации'):
                addiu   $a0, 0xC ; branch delay slot

locret_24:
                jr      $ra
                or      $at, $zero ; branch delay slot, NOP
