include(`commons.m4')main:

var_70          = -0x70
var_68          = -0x68
var_14          = -0x14
var_10          = -0x10
var_C           = -0xC
var_8           = -8
var_4           = -4
; _EN(`function prologue')_RU(`пролог функции'):
                lui     $gp, (__gnu_local_gp >> 16)
                addiu   $sp, -0x80
                la      $gp, (__gnu_local_gp & 0xFFFF)
                sw      $ra, 0x80+var_4($sp)
                sw      $s3, 0x80+var_8($sp)
                sw      $s2, 0x80+var_C($sp)
                sw      $s1, 0x80+var_10($sp)
                sw      $s0, 0x80+var_14($sp)
                sw      $gp, 0x80+var_70($sp)
                addiu   $s1, $sp, 0x80+var_68
                move    $v1, $s1
                move    $v0, $zero
; _EN(`that value will be used as a loop terminator')_RU(`это значение используется как терминатор цикла').
; _EN(`it was precalculated by GCC compiler at compile stage')_RU(`оно было вычислено компилятором GCC на стадии компиляции'):
                li      $a0, 0x28  # '('

loc_34:                                  # CODE XREF: main+3C
; _EN(`store value into memory')_RU(`сохранить значение в памяти'):
                sw      $v0, 0($v1)
; _EN(`increase value to be stored by 2 at each iteration')_RU(`увеличивать значение (которое будет записано) на 2 на каждой итерации'):
                addiu   $v0, 2
; _EN(`loop terminator reached')_RU(`дошли до терминатора цикла')?
                bne     $v0, $a0, loc_34
; _EN(`add 4 to address anyway')_RU(``в любом случае, добавляем 4 к адресу''):
                addiu   $v1, 4
; _EN(`array filling loop is ended')_RU(`цикл заполнения массива закончился')
; _EN(`second loop begin')_RU(`начало второго цикла')
                la      $s3, $LC0        # "a[%d]=%d\n"
; _EN(`"i" variable will reside in')_RU(`переменная "i" будет находится в') $s0:
                move    $s0, $zero
                li      $s2, 0x14

loc_54:                                  # CODE XREF: main+70
; _EN(`call')_RU(`вызов') printf():
                lw      $t9, (printf & 0xFFFF)($gp)
                lw      $a2, 0($s1)
                move    $a1, $s0
                move    $a0, $s3
                jalr    $t9
; _increment "i":
                addiu   $s0, 1
                lw      $gp, 0x80+var_70($sp)
; _EN(`jump to loop body if end is not reached')_RU(``перейти на начало тела цикла, если конец еще не достигнут''):
                bne     $s0, $s2, loc_54
; _EN(`move memory pointer to the next 32-bit word')_RU(`передвинуть указатель на следующее 32-битное слово'):
                addiu   $s1, 4
; _EN(`function epilogue')_RU(`эпилог функции')
                lw      $ra, 0x80+var_4($sp)
                move    $v0, $zero
                lw      $s3, 0x80+var_8($sp)
                lw      $s2, 0x80+var_C($sp)
                lw      $s1, 0x80+var_10($sp)
                lw      $s0, 0x80+var_14($sp)
                jr      $ra
                addiu   $sp, 0x80

$LC0:           .ascii "a[%d]=%d\n"<0>   # DATA XREF: main+44
