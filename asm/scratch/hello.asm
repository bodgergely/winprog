global _main
    extern  _ExitProcess@4

    section .text
_main:
    mov     ebp, esp
    sub     esp, 10h
    mov     eax, 00123456h
    lea     ebx, [esp+4]
    mov     [ebx], eax
    push    79
    push    ebx
    call    my_memset

    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ; ExitProcess(0)
    push    0
    call    _ExitProcess@4
    ; never here
    hlt

; first argument is the pointer to the string, second the character to overwrite the elements of the string
my_memset:
    push    ebp
    mov     ebp, esp
    mov     edi, [ebp+8]
    mov     edx, edi
    xor     eax, eax
    or      ecx, 0FFFFFFFFh
    repne   scasb
    add     ecx, 2
    neg     ecx
    mov     al, [ebp+0Ch]
    mov     edi, edx
    rep     stosb
    mov     eax, edx
    leave
    ret

message:
    db      'Hello, World', 10
message_end:
