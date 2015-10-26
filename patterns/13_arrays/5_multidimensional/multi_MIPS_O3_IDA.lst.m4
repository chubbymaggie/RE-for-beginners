include(`commons.m4')insert:
; $a0=x
; $a1=y
; $a2=z
; $a3=_EN(`value')_RU(`значение')
                sll     $v0, $a0, 5
; $v0 = $a0<<5 = x*32
                sll     $a0, 3
; $a0 = $a0<<3 = x*8
                addu    $a0, $v0
; $a0 = $a0+$v0 = x*8+x*32 = x*40
                sll     $v1, $a1, 5
; $v1 = $a1<<5 = y*32
                sll     $v0, $a0, 4
; $v0 = $a0<<4 = x*40*16 = x*640
                sll     $a1, 1
; $a1 = $a1<<1 = y*2
                subu    $a1, $v1, $a1
; $a1 = $v1-$a1 = y*32-y*2 = y*30
                subu    $a0, $v0, $a0
; $a0 = $v0-$a0 = x*640-x*40 = x*600
                la      $gp, __gnu_local_gp
                addu    $a0, $a1, $a0
; $a0 = $a1+$a0 = y*30+x*600
                addu    $a0, $a2
; $a0 = $a0+$a2 = y*30+x*600+z
; _EN(`load address of table')_RU(`загрузить адрес таблицы'):
                lw      $v0, (a & 0xFFFF)($gp)
; _EN(`multiply index by 4 to seek array element')_RU(`умножить индекс на 4 для поиска элемента таблицы'):
                sll     $a0, 2
; _EN(`sum up multiplied index and table address')_RU(`сложить умноженный индекс и адрес таблицы'):
                addu    $a0, $v0, $a0
; _EN(`store value into table and return')_RU(`записать значение в таблицу и вернуть управление'):
                jr      $ra
                sw      $a3, 0($a0)

                .comm a:0x1770
