include(`commons.m4')_i$ = -4
_main    PROC
    push   ebp
    mov    ebp, esp
    push   ecx
    mov    DWORD PTR _i$[ebp], 2   ; _EN(`loop initialization')_RU(`инициализация цикла')
    jmp    SHORT $LN3@main
$LN2@main:
    mov    eax, DWORD PTR _i$[ebp] ; _EN(`here is what we do after each iteration')_RU(`то что мы делаем после каждой итерации'):
    add    eax, 1                  ; _EN(`add 1 to (i) value')_RU(`добавляем 1 к i')
    mov    DWORD PTR _i$[ebp], eax
$LN3@main:
    cmp    DWORD PTR _i$[ebp], 10  ; _EN(`this condition is checked *before* each iteration')_RU(`это условие проверяется *перед* каждой итерацией')
    jge    SHORT $LN1@main         ; _EN(``if (i) is biggest or equals to 10, let's finish loop'')_RU(``если i больше или равно 10, заканчиваем цикл'')
    mov    ecx, DWORD PTR _i$[ebp] ; _EN(`loop body: call')_RU(`тело цикла: вызов функции') printing_function(i)
    push   ecx
    call   _printing_function
    add    esp, 4
    jmp    SHORT $LN2@main         ; _EN(`jump to loop begin')_RU(`переход на начало цикла')
$LN1@main:                         ; _EN(`loop end')_RU(`конец цикла')
    xor    eax, eax
    mov    esp, ebp
    pop    ebp
    ret    0
_main    ENDP
