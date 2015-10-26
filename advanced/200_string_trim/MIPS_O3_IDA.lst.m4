include(`commons.m4')str_trim:
; _EN(``IDA is not aware of local variable names, we gave them manually'')_RU(``IDA не в курсе об именах переменных, мы присвоили их сами''):
saved_GP          = -0x10
saved_S0           = -8
saved_RA           = -4

                lui     $gp, (__gnu_local_gp >> 16)
                addiu   $sp, -0x20
                la      $gp, (__gnu_local_gp & 0xFFFF)
                sw      $ra, 0x20+saved_RA($sp)
                sw      $s0, 0x20+saved_S0($sp)
                sw      $gp, 0x20+saved_GP($sp)
; _EN(`call')_RU(`вызов') strlen(). _EN(`input string address is still in')_RU(`адрес входной строки всё еще в') $a0, strlen() _EN(`will take it from there')_RU(`возьмет его оттуда'):
                lw      $t9, (strlen & 0xFFFF)($gp)
                or      $at, $zero ; load delay slot, NOP
                jalr    $t9
; _EN(`input string address is still in')_RU(`адрес входной строки всё еще в') $a0, _EN(`put it to')_RU(`переложить его в') $s0:
                move    $s0, $a0   ; branch delay slot
; _EN(`result of')_RU(`результат') strlen() (_EN(``i.e, length of string'')_RU(``т.е. длина строки'')) _EN(`is in \$v0 now')_RU(`теперь в \$v0')
; _EN(``jump to exit if'')_RU(``перейти на выход, если'') $v0==0 (_EN(``i.e., if length of string is'')_RU(``т.е. если длина строки это'') 0):
                beqz    $v0, exit
                or      $at, $zero ; branch delay slot, NOP
                addiu   $a1, $v0, -1
; $a1 = $v0-1 = str_len-1
                addu    $a1, $s0, $a1
; $a1 = _EN(`input string address')_RU(`адрес входной строки') + $a1 = s+strlen-1
; _EN(`load byte at address')_RU(`загрузить байт по адресу') $a1:
                lb      $a0, 0($a1)
                or      $at, $zero ; load delay slot, NOP
; _EN(``loaded byte is zero? jump to exit if it's so'')_RU(``загруженный байт - это ноль? перейти на выход, если это так''):
                beqz    $a0, exit
                or      $at, $zero ; branch delay slot, NOP
                addiu   $v1, $v0, -2
; $v1 = str_len-2
                addu    $v1, $s0, $v1
; $v1 = $s0+$v1 = s+str_len-2
                li      $a2, 0xD
; _EN(`skip loop body')_RU(`пропустить тело цикла'):
                b       loc_6C
                li      $a3, 0xA   ; branch delay slot
loc_5C:
; _EN(`load next byte from memory to')_RU(`загрузить следующий байт из памяти в') $a0:
                lb      $a0, 0($v1)
                move    $a1, $v1
; $a1=s+str_len-2
; _EN(`jump to exit if loaded byte is zero')_RU(``перейти на выход, если загруженный байт - это ноль''):
                beqz    $a0, exit
; _EN(`decrement')_RU(`декремент') str_len:
                addiu   $v1, -1    ; branch delay slot
loc_6C:
; _EN(`at this moment')_RU(`в этот момент'), $a0=_EN(`loaded byte')_RU(`загруженный байт'), $a2=0xD (_EN(`CR symbol')_RU(`символ CR')) _EN(`and')_RU(`и') $a3=0xA (_EN(`LF symbol')_RU(`символ LF'))
; _EN(`loaded byte is CR? jump to loc\_7C then')_RU(`загруженный байт - это CR? тогда перейти на loc\_7C'):
                beq     $a0, $a2, loc_7C
                addiu   $v0, -1    ; branch delay slot
; _EN(``loaded byte is LF? jump to exit if it's not LF'')_RU(``загруженный байт - это LF? перейти на выход, если это не LF''):
                bne     $a0, $a3, exit
                or      $at, $zero ; branch delay slot, NOP
loc_7C:
; _EN(`loaded byte is CR at this moment')_RU(`загруженный байт в этот момент это CR')
; _EN(`jump to loc\_5c (loop body begin) if str\_len (in \$v0) is not zero')_RU(`перейти на loc\_5c (начало тела цикла) если str\_len (в \$v0) не ноль'):
                bnez    $v0, loc_5C
; _EN(``simultaneously, store zero at that place in memory'')_RU(``одновременно с этим, записать ноль в этом месте памяти''):
                sb      $zero, 0($a1) ; branch delay slot
; _EN(`"exit" label was named by me manually')_RU(`метка "exit" была так названа мною'):
exit:
                lw      $ra, 0x20+saved_RA($sp)
                move    $v0, $s0
                lw      $s0, 0x20+saved_S0($sp)
                jr      $ra
                addiu   $sp, 0x20     ; branch delay slot
