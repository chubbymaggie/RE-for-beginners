include(`commons.m4')f:
                lui     $gp, (__gnu_local_gp >> 16)
; _EN(`jump to loc\_24 if input value is lesser than 5:')_RU(``перейти на loc\_24, если входное значение меньше 5:'')
                sltiu   $v0, $a0, 5
                bnez    $v0, loc_24
                la      $gp, (__gnu_local_gp & 0xFFFF) ; branch delay slot
; _EN(`input value is greater or equal to 5.')_RU(`входное значение больше или равно 5')
; _print "something unknown" _EN(`and finish')_RU(`и закончить'):
                lui     $a0, ($LC5 >> 16)  # "something unknown"
                lw      $t9, (puts & 0xFFFF)($gp)
                or      $at, $zero ; NOP
                jr      $t9
                la      $a0, ($LC5 & 0xFFFF)  # "something unknown" ; branch delay slot

loc_24:                                  # CODE XREF: f+8
; _EN(`load address of jumptable')_RU(`загрузить адрес таблицы переходов')
; _EN(``LA is pseudoinstruction, LUI and ADDIU pair are there in fact:'')_RU(``LA это псевдоинструкция, на самом деле здесь пара LUI и ADDIU:'')
                la      $v0, off_120
; _EN(`multiply input value by')_RU(`умножить входное значение на') 4:
                sll     $a0, 2
; _EN(`sum up multiplied value and jumptable address')_RU(`прибавить умноженное значение к адресу таблицы'):
                addu    $a0, $v0, $a0
; _EN(`load element from jumptable')_RU(`загрузить элемент из таблицы переходов'):
                lw      $v0, 0($a0)
                or      $at, $zero ; NOP
; _EN(`jump to the address we got in jumptable')_RU(``перейти по адресу, полученному из таблицы''):
                jr      $v0
                or      $at, $zero ; branch delay slot, NOP

sub_44:                                  # DATA XREF: .rodata:0000012C
; _print "three" _EN(`and finish')_RU(`и закончить')
                lui     $a0, ($LC3 >> 16)  # "three"
                lw      $t9, (puts & 0xFFFF)($gp)
                or      $at, $zero ; NOP
                jr      $t9
                la      $a0, ($LC3 & 0xFFFF)  # "three" ; branch delay slot

sub_58:                                  # DATA XREF: .rodata:00000130
; _print "four" _EN(`and finish')_RU(`и закончить')
                lui     $a0, ($LC4 >> 16)  # "four"
                lw      $t9, (puts & 0xFFFF)($gp)
                or      $at, $zero ; NOP
                jr      $t9
                la      $a0, ($LC4 & 0xFFFF)  # "four" ; branch delay slot

sub_6C:                                  # DATA XREF: .rodata:off_120
; _print "zero" _EN(`and finish')_RU(`и закончить')
                lui     $a0, ($LC0 >> 16)  # "zero"
                lw      $t9, (puts & 0xFFFF)($gp)
                or      $at, $zero ; NOP
                jr      $t9
                la      $a0, ($LC0 & 0xFFFF)  # "zero" ; branch delay slot

sub_80:                                  # DATA XREF: .rodata:00000124
; _print "one" _EN(`and finish')_RU(`и закончить')
                lui     $a0, ($LC1 >> 16)  # "one"
                lw      $t9, (puts & 0xFFFF)($gp)
                or      $at, $zero ; NOP
                jr      $t9
                la      $a0, ($LC1 & 0xFFFF)  # "one" ; branch delay slot

sub_94:                                  # DATA XREF: .rodata:00000128
; _print "two" _EN(`and finish')_RU(`и закончить')
                lui     $a0, ($LC2 >> 16)  # "two"
                lw      $t9, (puts & 0xFFFF)($gp)
                or      $at, $zero ; NOP
                jr      $t9
                la      $a0, ($LC2 & 0xFFFF)  # "two" ; branch delay slot

; _EN(`may be placed in .rodata section')_RU(`может быть размещено в секции .rodata'):
off_120:        .word sub_6C
                .word sub_80
                .word sub_94
                .word sub_44
                .word sub_58
