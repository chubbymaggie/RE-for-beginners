include(`commons.m4')f:
; _EN(``IDA is not aware of variable names, we gave them manually'')_RU(``IDA не знает об именах переменных, мы присвоили их вручную''):
rt              = -0x10
i               = -0xC
var_4           = -4
a               =  0

                addiu   $sp, -0x18
                sw      $fp, 0x18+var_4($sp)
                move    $fp, $sp
                sw      $a0, 0x18+a($fp)
; _EN(`initialize rt and i variables to zero')_RU(`инициализировать переменные rt и i в ноль'):
                sw      $zero, 0x18+rt($fp)
                sw      $zero, 0x18+i($fp)
; _EN(`jump to loop check instructions')_RU(`перейти на инструкции проверки цикла'):
                b       loc_68
                or      $at, $zero ; branch delay slot, NOP

loc_20:
                li      $v1, 1
                lw      $v0, 0x18+i($fp)
                or      $at, $zero ; load delay slot, NOP
                sllv    $v0, $v1, $v0
; $v0 = 1<<i
                move    $v1, $v0
                lw      $v0, 0x18+a($fp)
                or      $at, $zero ; load delay slot, NOP
                and     $v0, $v1, $v0
; $v0 = a&(1<<i)
; _EN(`is ')a&(1<<i) _EN(`equals to zero')_RU(`равен нулю')? _EN(`jump to loc\_58 then')_RU(`тогда перейти на loc\_58'):
                beqz    $v0, loc_58
                or      $at, $zero
; _EN(``no jump occurred, that means'')_RU(``переход не случился, это значит что'') a&(1<<i)!=0, _EN(`so increment "rt" then')_RU(`так что инкрементируем "rt"'):
                lw      $v0, 0x18+rt($fp)
                or      $at, $zero ; load delay slot, NOP
                addiu   $v0, 1
                sw      $v0, 0x18+rt($fp)

loc_58:
; _increment i:
                lw      $v0, 0x18+i($fp)
                or      $at, $zero ; load delay slot, NOP
                addiu   $v0, 1
                sw      $v0, 0x18+i($fp)

loc_68:
; _EN(`load i and compare it with')_RU(`загрузить i и сравнить его с') 0x20 (32).
; _EN(``jump to loc\_20 if it is less then'')_RU(``перейти на loc\_20, если это меньше чем'') 0x20 (32):
                lw      $v0, 0x18+i($fp)
                or      $at, $zero ; load delay slot, NOP
                slti    $v0, 0x20  # ' '
                bnez    $v0, loc_20
                or      $at, $zero ; branch delay slot, NOP
; _EN(`function epilogue')_RU(`эпилог функции'). _return rt:
                lw      $v0, 0x18+rt($fp)
                move    $sp, $fp   ; load delay slot
                lw      $fp, 0x18+var_4($sp)
                addiu   $sp, 0x18  ; load delay slot
                jr      $ra
                or      $at, $zero ; branch delay slot, NOP
