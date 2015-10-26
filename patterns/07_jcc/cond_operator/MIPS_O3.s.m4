include(`commons.m4')$LC0:
        .ascii  "it is not ten\000"
$LC1:
        .ascii  "it is ten\000"
f:
        li      $2,10                   # 0xa
; _EN(`compare')_RU(`сравнить') $a0 _EN(`and')_RU(`и') 10, _EN(`jump if equal')_RU(``переход, если равно''):
        beq     $4,$2,$L2
        nop ; branch delay slot

; _EN(`leave address of "it is not ten" string in \$v0 and return')_RU(`оставить адрес строки "it is not ten" в \$v0 и выйти'):
        lui     $2,%hi($LC0)
        j       $31
        addiu   $2,$2,%lo($LC0)

$L2:
; _EN(`leave address of "it is ten" string in \$v0 and return')_RU(`оставить адрес строки "it is ten" в \$v0 и выйти'):
        lui     $2,%hi($LC1)
        j       $31
        addiu   $2,$2,%lo($LC1)
