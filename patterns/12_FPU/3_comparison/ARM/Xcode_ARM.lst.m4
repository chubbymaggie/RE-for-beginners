include(`commons.m4')VMOV            D16, R2, R3 ; b
VMOV            D17, R0, R1 ; a
VCMPE.F64       D17, D16
VMRS            APSR_nzcv, FPSCR
VMOVGT.F64      D16, D17 ; _EN(`copy')_RU(`скопировать') "b" _EN(`to')_RU(`в') D16
VMOV            R0, R1, D16
BX              LR
