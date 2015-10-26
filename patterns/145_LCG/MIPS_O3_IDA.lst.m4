include(`commons.m4')my_srand:
; _EN(`store \$a0 to')_RU(`записать \$a0 в') rand_state:
                lui     $v0, (rand_state >> 16)
                jr      $ra
                sw      $a0, rand_state
my_rand:
; _EN(`load rand\_state to \$v0:')_RU(`загрузить rand\_state в \$v0:')
                lui     $v1, (rand_state >> 16)
                lw      $v0, rand_state
                or      $at, $zero  ; load delay slot
; _EN(`multiplicate rand\_state in \$v0 by')_RU(`умножить rand\_state в \$v0 на') 1664525 (RNG_a):
                sll     $a1, $v0, 2
                sll     $a0, $v0, 4
                addu    $a0, $a1, $a0
                sll     $a1, $a0, 6
                subu    $a0, $a1, $a0
                addu    $a0, $v0
                sll     $a1, $a0, 5
                addu    $a0, $a1
                sll     $a0, 3
                addu    $v0, $a0, $v0
                sll     $a0, $v0, 2
                addu    $v0, $a0
; _EN(`add')_RU(`прибавить') 1013904223 (RNG_c)
; _EN(`the LI instruction is coalesced by IDA from LUI and ORI')_RU(`инструкция LI объединена в IDA из LUI и ORI')
                li      $a0, 0x3C6EF35F 
                addu    $v0, $a0
; _EN(`store to')_RU(`сохранить в') rand_state:
                sw      $v0, (rand_state & 0xFFFF)($v1)
                jr      $ra
                andi    $v0, 0x7FFF ; branch delay slot
