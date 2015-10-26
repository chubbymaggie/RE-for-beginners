include(`commons.m4')f               proc near

; shadow space:
arg_0           = dword ptr  8
arg_8           = dword ptr  10h
arg_10          = dword ptr  18h

		; ECX - _arg1
		; EDX - _arg2
		; R8D - _arg3
                mov     [rsp+arg_10], r8d
                mov     [rsp+arg_8], edx
                mov     [rsp+arg_0], ecx
                mov     eax, [rsp+arg_0]
                imul    eax, [rsp+arg_8]
                add     eax, [rsp+arg_10]
                retn
f               endp

main            proc near
                sub     rsp, 28h
                mov     r8d, 3 ; _arg3
                mov     edx, 2 ; _arg2
                mov     ecx, 1 ; _arg1
                call    f
                mov     edx, eax
                lea     rcx, $SG2931    ; "%d\n"
                call    printf

                ; _return 0
                xor     eax, eax
                add     rsp, 28h
                retn
main            endp
