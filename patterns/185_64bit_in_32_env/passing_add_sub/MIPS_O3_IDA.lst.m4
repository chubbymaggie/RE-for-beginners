include(`commons.m4')f_add:
; $a0 - _EN(`high part of')_RU(`старшая часть') a
; $a1 - _EN(`low part of')_RU(`младшая часть') a
; $a2 - _EN(`high part of')_RU(`старшая часть') b
; $a3 - _EN(`low part of')_RU(`младшая часть') b
                addu    $v1, $a3, $a1 ; _EN(`sum up low parts')_RU(`суммировать младшие части')
                addu    $a0, $a2, $a0 ; _EN(`sum up high parts')_RU(`суммировать старшие части')
; _EN(`will carry generated while summing up low parts?')_RU(`будет ли перенос сгенерирован во время суммирования младших частей?')
; _EN(``if yes, set \$v0 to 1'')_RU(``установить \$v0 в 1, если да'')
                sltu    $v0, $v1, $a3
                jr      $ra
; _EN(`add 1 to high part of result if carry should be generated:')_RU(``прибавить 1 к старшей части результата, если перенос должен был быть сгенерирован'')
                addu    $v0, $a0 ; branch delay slot
; $v0 - _EN(`high part of result')_RU(`старшая часть результата')
; $v1 - _EN(`low part of result')_RU(`младшая часть результата')

f_sub:
; $a0 - _EN(`high part of')_RU(`старшая часть') a
; $a1 - _EN(`low part of')_RU(`младшая часть') a
; $a2 - _EN(`high part of')_RU(`старшая часть') b
; $a3 - _EN(`low part of')_RU(`младшая часть') b
                subu    $v1, $a1, $a3 ; _EN(`subtract low parts')_RU(`вычитать младшие части')
                subu    $v0, $a0, $a2 ; _EN(`subtract high parts')_RU(`вычитать старшие части')
; _EN(`will carry generated while subtracting low parts?')_RU(`будет ли перенос сгенерирован во время вычитания младших частей?')
; _EN(``if yes, set \$a0 to 1'')_RU(``установить \$a0 в 1, если да'')
                sltu    $a1, $v1
                jr      $ra
; _EN(`subtract 1 from high part of result if carry should be generated:')_RU(``вычесть 1 из старшей части результата, если перенос должен был быть сгенерирован'')
                subu    $v0, $a1 ; branch delay slot
; $v0 - _EN(`high part of result')_RU(`старшая часть результата')
; $v1 - _EN(`low part of result')_RU(`младшая часть результата')

f_add_test:

var_10          = -0x10
var_4           = -4

                lui     $gp, (__gnu_local_gp >> 16)
                addiu   $sp, -0x20
                la      $gp, (__gnu_local_gp & 0xFFFF)
                sw      $ra, 0x20+var_4($sp)
                sw      $gp, 0x20+var_10($sp)
                lui     $a1, 0x73CE
                lui     $a3, 0x7593
                li      $a0, 0xB3A
                li      $a3, 0x75939F79
                li      $a2, 0x1555
                jal     f_add
                li      $a1, 0x73CE2FF2
                lw      $gp, 0x20+var_10($sp)
                lui     $a0, ($LC0 >> 16)  # "%lld\n"
                lw      $t9, (printf & 0xFFFF)($gp)
                lw      $ra, 0x20+var_4($sp)
                la      $a0, ($LC0 & 0xFFFF)  # "%lld\n"
                move    $a3, $v1
                move    $a2, $v0
                jr      $t9
                addiu   $sp, 0x20

$LC0:           .ascii "%lld\n"<0>
