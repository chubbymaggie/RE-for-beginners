include(`commons.m4')f:
; $f12-$f13=A
; $f14-$f15=B
                lui     $v0, (dword_C4 >> 16) ; ?
; _EN(`load low 32-bit part of 3.14 constant to')_RU(`загрузить младшую 32-битную часть константы 3.14 в') $f0:
                lwc1    $f0, dword_BC
                or      $at, $zero            ; load delay slot, NOP
; _EN(`load high 32-bit part of 3.14 constant to')_RU(`загрузить старшую 32-битную часть константы 3.14 в') $f1:
                lwc1    $f1, $LC0
                lui     $v0, ($LC1 >> 16)     ; ?
; A _in $f12-$f13, _EN(`3.14 constant in')_RU(`константа 3.14 в') $f0-$f1, _EN(`do division')_RU(`произвести деление'):
                div.d   $f0, $f12, $f0
; $f0-$f1=A/3.14
; _EN(`load low 32-bit part of 4.1 to')_RU(`загрузить младшую 32-битную часть константы 4.1 в') $f2:
                lwc1    $f2, dword_C4
                or      $at, $zero            ; load delay slot, NOP
; _EN(`load high 32-bit part of 4.1 to')_RU(`загрузить страшую 32-битную часть константы 4.1 в') $f3:
                lwc1    $f3, $LC1
                or      $at, $zero            ; load delay slot, NOP
; B _in $f14-$f15, _EN(`4.1 constant in')_RU(`константа 4.1 в') $f2-$f3, _EN(`do multiplication')_RU(`произвести умножение'):
                mul.d   $f2, $f14, $f2
; $f2-$f3=B*4.1
                jr      $ra
; _EN(`sum 64-bit parts and leave result in')_RU(`суммировать 64-битные части и оставить результат в') $f0-$f1:
                add.d   $f0, $f2              ; branch delay slot, NOP


.rodata.cst8:000000B8 $LC0:           .word 0x40091EB8         # DATA XREF: f+C
.rodata.cst8:000000BC dword_BC:       .word 0x51EB851F         # DATA XREF: f+4
.rodata.cst8:000000C0 $LC1:           .word 0x40106666         # DATA XREF: f+10
.rodata.cst8:000000C4 dword_C4:       .word 0x66666666         # DATA XREF: f
