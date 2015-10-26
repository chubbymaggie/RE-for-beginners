f	PROC 
; parameter 1: rcx = a1
; parameter 2: rdx = a2
; parameter 3: r8  = cnt
.B1.1::                         ; Preds .B1.0
        test      r8, r8                                        ;8.14
        jbe       exit        ; Prob 50%                      ;8.14
                                ; LOE rdx rcx rbx rbp rsi rdi r8 r12 r13 r14 r15 xmm6 xmm7 xmm8 xmm9 xmm10 xmm11 xmm12 xmm13 xmm14 xmm15
.B1.2::                         ; Preds .B1.1
        cmp       r8, 6                                         ;8.2
        jbe       just_copy        ; Prob 50%                      ;8.2
                                ; LOE rdx rcx rbx rbp rsi rdi r8 r12 r13 r14 r15 xmm6 xmm7 xmm8 xmm9 xmm10 xmm11 xmm12 xmm13 xmm14 xmm15
.B1.3::                         ; Preds .B1.2
        cmp       rcx, rdx                                      ;9.11
        jbe       .B1.5         ; Prob 50%                      ;9.11
                                ; LOE rdx rcx rbx rbp rsi rdi r8 r12 r13 r14 r15 xmm6 xmm7 xmm8 xmm9 xmm10 xmm11 xmm12 xmm13 xmm14 xmm15
.B1.4::                         ; Preds .B1.3
        mov       r10, r8                                       ;9.11
        mov       r9, rcx                                       ;9.11
        shl       r10, 5                                        ;9.11
        lea       rax, QWORD PTR [r8*4]                         ;9.11
        sub       r9, rdx                                       ;9.11
        sub       r10, rax                                      ;9.11
        cmp       r9, r10                                       ;9.11
        jge       just_copy2         ; Prob 50%                      ;9.11
                                ; LOE rdx rcx rbx rbp rsi rdi r8 r12 r13 r14 r15 xmm6 xmm7 xmm8 xmm9 xmm10 xmm11 xmm12 xmm13 xmm14 xmm15
.B1.5::                         ; Preds .B1.3 .B1.4
        cmp       rdx, rcx                                      ;9.11
        jbe       just_copy        ; Prob 50%                      ;9.11
                                ; LOE rdx rcx rbx rbp rsi rdi r8 r12 r13 r14 r15 xmm6 xmm7 xmm8 xmm9 xmm10 xmm11 xmm12 xmm13 xmm14 xmm15
.B1.6::                         ; Preds .B1.5
        mov       r9, rdx                                       ;9.11
        lea       rax, QWORD PTR [r8*8]                         ;9.11
        sub       r9, rcx                                       ;9.11
        lea       r10, QWORD PTR [rax+r8*4]                     ;9.11
        cmp       r9, r10                                       ;9.11
        jl        just_copy        ; Prob 50%                      ;9.11
                                ; LOE rdx rcx rbx rbp rsi rdi r8 r12 r13 r14 r15 xmm6 xmm7 xmm8 xmm9 xmm10 xmm11 xmm12 xmm13 xmm14 xmm15
just_copy2::                         ; Preds .B1.4 .B1.6
; R8 = cnt
; RDX = a2
; RCX = a1
        xor       r10d, r10d                                    ;8.2
        xor       r9d, r9d                                      ;
        xor       eax, eax                                      ;
                                ; LOE rax rdx rcx rbx rbp rsi rdi r8 r9 r10 r12 r13 r14 r15 xmm6 xmm7 xmm8 xmm9 xmm10 xmm11 xmm12 xmm13 xmm14 xmm15
.B1.8::                         ; Preds .B1.8 just_copy2
        mov       r11d, DWORD PTR [rax+rdx]                     ;3.6
        inc       r10                                           ;8.2
        mov       DWORD PTR [r9+rcx], r11d                      ;3.6
        add       r9, 12                                        ;8.2
        add       rax, 28                                       ;8.2
        cmp       r10, r8                                       ;8.2
        jb        .B1.8         ; Prob 82%                      ;8.2
        jmp       exit        ; Prob 100%                     ;8.2
                                ; LOE rax rdx rcx rbx rbp rsi rdi r8 r9 r10 r12 r13 r14 r15 xmm6 xmm7 xmm8 xmm9 xmm10 xmm11 xmm12 xmm13 xmm14 xmm15
just_copy::                        ; Preds .B1.2 .B1.5 .B1.6
; R8 = cnt
; RDX = a2
; RCX = a1
        xor       r10d, r10d                                    ;8.2
        xor       r9d, r9d                                      ;
        xor       eax, eax                                      ;
                                ; LOE rax rdx rcx rbx rbp rsi rdi r8 r9 r10 r12 r13 r14 r15 xmm6 xmm7 xmm8 xmm9 xmm10 xmm11 xmm12 xmm13 xmm14 xmm15
.B1.11::                        ; Preds .B1.11 just_copy
        mov       r11d, DWORD PTR [rax+rdx]                     ;3.6
        inc       r10                                           ;8.2
        mov       DWORD PTR [r9+rcx], r11d                      ;3.6
        add       r9, 12                                        ;8.2
        add       rax, 28                                       ;8.2
        cmp       r10, r8                                       ;8.2
        jb        .B1.11        ; Prob 82%                      ;8.2
                                ; LOE rax rdx rcx rbx rbp rsi rdi r8 r9 r10 r12 r13 r14 r15 xmm6 xmm7 xmm8 xmm9 xmm10 xmm11 xmm12 xmm13 xmm14 xmm15
exit::                        ; Preds .B1.11 .B1.8 .B1.1
        ret                                                     ;10.1
