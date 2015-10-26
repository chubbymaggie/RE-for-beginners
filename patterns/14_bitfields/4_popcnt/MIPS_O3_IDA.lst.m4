include(`commons.m4')f:
; $a0=a
; _EN(`rt variable will reside in')_RU(`переменная rt будет находиться в') $v0:
                move    $v0, $zero
; _EN(`i variable will reside in')_RU(`переменная i будет находиться в') $v1:
                move    $v1, $zero
                li      $t0, 1
                li      $a3, 32
                sllv    $a1, $t0, $v1
; $a1 = $t0<<$v1 = 1<<i

loc_14:
                and     $a1, $a0
; $a1 = a&(1<<i)
; _increment i:
                addiu   $v1, 1
; _EN(`jump to')_RU(`переход на') loc\_28 _if a&(1<<i)==0 _and _increment rt:
                beqz    $a1, loc_28
                addiu   $a2, $v0, 1
; _EN(``if BEQZ was not triggered, save updated rt into'')_RU(``если BEQZ не сработала, сохранить обновленную rt в'') $v0:
                move    $v0, $a2

loc_28:
; _if i!=32, _EN(`jump to')_RU(`перейти на') loc_14 _EN(`and also prepare next shifted value')_RU(`а также подготовить следующее сдвинутое значение'):
                bne     $v1, $a3, loc_14
                sllv    $a1, $t0, $v1
; _return
                jr      $ra
                or      $at, $zero ; branch delay slot, NOP
