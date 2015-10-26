include(`commons.m4'); X _EN(`is column on screen')_RU(`это столбец на экране')
; Y _EN(`is row on screen')_RU(`это строка на экране')


; X=0, Y=0              X=319, Y=0
; +------------------------------->
; |
; |
; |
; |
; |
; |
; v
; X=0, Y=199            X=319, Y=199


; _EN(`switch to VGA 320*200*256 graphics mode')_RU(`переключиться в графический видеорежим VGA 320*200*256')
mov al,13h
int 10h
; _EN(`initial BX is 0')_RU(`в самом начале BX равен 0')
; _EN(`initial DI is 0xFFFE')_RU(`в самом начале DI равен 0xFFFE')
; DS:BX (_or DS:0) _EN(`is pointing to')_RU(`указывает на') Program Segment Prefix _EN(`at this moment')_RU(`в этот момент')
; ... _EN(`first 4 bytes of which are')_RU(`первые 4 байта которого этого') CD 20 FF 9F
les ax,[bx]
; ES:AX=9FFF:20CD

FillLoop:
; _EN(`set')_RU(`установить') DX _EN(`to')_RU(`в') 0. CWD _EN(`works as')_RU(`работает так'): DX:AX = sign_extend(AX). 
; _EN(``AX here 0x20CD (at startup) or less then 320 (when getting back after loop),'')_RU(``AX здесь 0x20CD (в начале) или меньше 320 (когда вернемся после цикла),'')
; _EN(`so DX will always be 0')_RU(`так что DX всегда будет 0').
cwd 
mov ax,di
; AX _EN(`is current pointer within VGA buffer')_RU(`это текущий указатель внутри VGA-буфера')
; _EN(`divide current pointer by')_RU(`разделить текущий указатель на') 320
mov cx,320
div cx
; DX (start_X) - _EN(`remainder')_RU(`остаток') (_EN(`column')_RU(`столбец'): 0..319); AX - _EN(`result')_RU(`результат') (_EN(`row')_RU(`строка'): 0..199)
sub ax,100
; AX=AX-100, _EN(`so')_RU(`так что') AX (start_Y) _EN(`now is in range')_RU(`сейчас в пределах') -100..99
; DX _EN(`is in range')_RU(`в пределах') 0..319 _or 0x0000..0x013F
dec dh
; DX _EN(`now is in range')_RU(`сейчас в пределах') 0xFF00..0x003F (-256..63)

xor bx,bx
xor si,si
; BX (temp_X)=0; SI (temp_Y)=0

; _EN(`get maximal number of iterations')_RU(`получить максимальное количество итераций')
; _EN(``CX is still 320 here, so this is also maximal number of iteration'')_RU(``CX всё еще 320 здесь, так что это будет максимальным количеством итераций'')
MandelLoop:
mov bp,si      ; BP = temp_Y
imul si,bx     ; SI = temp_X*temp_Y
add si,si      ; SI = SI*2 = (temp_X*temp_Y)*2
imul bx,bx     ; BX = BX^2 = temp_X^2
jo MandelBreak ; _EN(`overflow')_RU(`переполнение')?
imul bp,bp     ; BP = BP^2 = temp_Y^2
jo MandelBreak ; _EN(`overflow')_RU(`переполнение')?
add bx,bp      ; BX = BX+BP = temp_X^2 + temp_Y^2
jo MandelBreak ; _EN(`overflow')_RU(`переполнение')?
sub bx,bp      ; BX = BX-BP = temp_X^2 + temp_Y^2 - temp_Y^2 = temp_X^2
sub bx,bp      ; BX = BX-BP = temp_X^2 - temp_Y^2

; _EN(`correct scale')_RU(`скорректировать масштаб'):
sar bx,6       ; BX=BX/64
add bx,dx      ; BX=BX+start_X
; _EN(`now')_RU(`здесь') temp_X = temp_X^2 - temp_Y^2 + start_X
sar si,6       ; SI=SI/64
add si,ax      ; SI=SI+start_Y
; _EN(`now')_RU(`здесь') temp_Y = (temp_X*temp_Y)*2 + start_Y

loop MandelLoop

MandelBreak:
; CX=_EN(`iterations')_RU(`итерации')
xchg ax,cx
; AX=_EN(`iterations')_RU(`итерации'). _EN(`store')_RU(`записать') AL _EN(`to VGA buffer at')_RU(`в VGA-буфер на') ES:[DI]
stosb
; stosb _EN(``also increments DI, so DI now points to the next point in VGA buffer'')_RU(``также инкрементирует DI, так что DI теперь указывает на следующую точку в VGA-буфере'')
; _EN(``jump always, so this is eternal loop here'')_RU(``всегда переходим, так что это вечный цикл'')
jmp FillLoop
