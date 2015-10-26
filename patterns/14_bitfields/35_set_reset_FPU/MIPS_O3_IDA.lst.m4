include(`commons.m4')my_abs:
; _EN(`move from coprocessor')_RU(`скопировать из сопроцессора') 1:
                mfc1    $v1, $f12
                li      $v0, 0x7FFFFFFF
; $v0=0x7FFFFFFF
; _EN(`do AND')_RU(`применить И'):
                and     $v0, $v1
; _EN(`move to coprocessor')_RU(`скопировать в сопроцессор') 1:
                mtc1    $v0, $f0
; _return
                jr      $ra
                or      $at, $zero ; branch delay slot

set_sign:
; _EN(`move from coprocessor')_RU(`скопировать из сопроцессора') 1:
                mfc1    $v0, $f12
                lui     $v1, 0x8000
; $v1=0x80000000
; _EN(`do OR')_RU(`применить ИЛИ'):
                or      $v0, $v1, $v0
; _EN(`move to coprocessor')_RU(`скопировать в сопроцессор') 1:
                mtc1    $v0, $f0
; _return
                jr      $ra
                or      $at, $zero ; branch delay slot

negate:
; _EN(`move from coprocessor')_RU(`скопировать из сопроцессора') 1:
                mfc1    $v0, $f12
                lui     $v1, 0x8000
; $v1=0x80000000
; _EN(`do XOR')_RU(`применить исключающее ИЛИ'):
                xor     $v0, $v1, $v0
; _EN(`move to coprocessor')_RU(`скопировать в сопроцессор') 1:
                mtc1    $v0, $f0
; _return
                jr      $ra
                or      $at, $zero ; branch delay slot
