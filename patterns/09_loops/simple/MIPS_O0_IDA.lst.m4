include(`commons.m4')main:

; _EN(`IDA is not aware of variable names in local stack')_RU(`IDA не знает названия переменных в локальном стеке')
; _EN(`We gave them names manually')_RU(`Это мы назвали их вручную'):
i               = -0x10
saved_FP        = -8
saved_RA        = -4

; _EN(`function prologue')_RU(`пролог функции'):
                addiu   $sp, -0x28
                sw      $ra, 0x28+saved_RA($sp)
                sw      $fp, 0x28+saved_FP($sp)
                move    $fp, $sp
; _EN(`initialize counter at 2 and store this value in local stack')_RU(`инициализировать счетчик значением 2 и сохранить это значение в локальном стеке')
                li      $v0, 2
                sw      $v0, 0x28+i($fp)
; _EN(`pseudoinstruction')_RU(`псевдоинструкция'). _RU(`здесь на самом деле ')"BEQ $ZERO, $ZERO, loc_9C"_EN(` there in fact'):
                b       loc_9C
                or      $at, $zero ; branch delay slot, NOP
 # ---------------------------------------------------------------------------

loc_80:                                  # CODE XREF: main+48
; _EN(`load counter value from local stack and call')_RU(`загрузить значение счетчика из локального стека и вызвать') printing_function():
                lw      $a0, 0x28+i($fp)
                jal     printing_function
                or      $at, $zero ; branch delay slot, NOP
; _EN(``load counter, increment it, store it back'')_RU(``загрузить счетчик, инкрементировать его и записать назад''):
                lw      $v0, 0x28+i($fp)
                or      $at, $zero ; NOP
                addiu   $v0, 1
                sw      $v0, 0x28+i($fp)

loc_9C:                                  # CODE XREF: main+18
; _EN(``check counter, is it 10?'')_RU(``проверить счетчик, он больше 10?'')
                lw      $v0, 0x28+i($fp)
                or      $at, $zero ; NOP
                slti    $v0, 0xA
; _EN(``if it is less than 10, jump to loc\_80 (loop body begin)'')_RU(``если он меньше 10, перейти на loc\_80 (начало тела цикла)''):
                bnez    $v0, loc_80
                or      $at, $zero ; branch delay slot, NOP
; _EN(``finishing, return 0'')_RU(``заканчиваем, возвращаем 0''):
                move    $v0, $zero
; _EN(`function epilogue')_RU(`эпилог функции'):
                move    $sp, $fp
                lw      $ra, 0x28+saved_RA($sp)
                lw      $fp, 0x28+saved_FP($sp)
                addiu   $sp, 0x28
                jr      $ra
                or      $at, $zero ; branch delay slot, NOP
