include(`commons.m4').text:00000000 main:
.text:00000000
.text:00000000 var_10          = -0x10
.text:00000000 var_4           = -4
.text:00000000
; _EN(`function prologue.')_RU(`пролог функции')
; _EN(`set the')_RU(`установить') GP:
.text:00000000                 lui     $gp, (__gnu_local_gp >> 16)
.text:00000004                 addiu   $sp, -0x20
.text:00000008                 la      $gp, (__gnu_local_gp & 0xFFFF)
; _EN(`save the RA to the local stack')_RU(`сохранить RA в локальном стеке'):
.text:0000000C                 sw      $ra, 0x20+var_4($sp)
; _EN(`save the GP to the local stack')_RU(`сохранить GP в локальном стеке'):
; _EN(``for some reason, this instruction is missing in the GCC assembly output'')_RU(``по какой-то причине, этой инструкции не было в ассемблерном выводе в GCC''):
.text:00000010                 sw      $gp, 0x20+var_10($sp)
; _EN(`load the address of the puts() function from the GP to')_RU(`загрузить адрес функции puts() из GP в') $t9:
.text:00000014                 lw      $t9, (puts & 0xFFFF)($gp)
; _EN(`form the address of the text string in')_RU(`сформировать адрес текстовой строки в') $a0:
.text:00000018                 lui     $a0, ($LC0 >> 16)  # "Hello, world!"
; _EN(``jump to puts(), saving the return address in the link register'')_RU(``перейти на puts(), сохранив адрес возврата в link-регистре''):
.text:0000001C                 jalr    $t9
.text:00000020                 la      $a0, ($LC0 & 0xFFFF)  # "Hello, world!"
; _EN(`restore the')_RU(`восстановить') RA:
.text:00000024                 lw      $ra, 0x20+var_4($sp)
; _EN(`copy 0 from')_RU(`скопировать 0 из') $zero _EN(`to')_RU(`в') $v0:
.text:00000028                 move    $v0, $zero
; _EN(`return by jumping to the RA')_RU(`вернуть управление сделав переход по адресу в RA'):
.text:0000002C                 jr      $ra
; _EN(`function epilogue')_RU(`эпилог функции'):
.text:00000030                 addiu   $sp, 0x20
