
    global  _main
    extern  _printf

    section .text
_main:
    mov     eax, 0
    test    eax, eax
    jz      zero
    push     eax
    push    message
    jmp    print
zero:
    push    eax
    push    zero_message
print:
    call    _printf
    add     sp, 8
    ret

message:
    db  'Did not take jz Result: %d\n\0'
zero_message:
    db  'Took jz Result: %d\n\0'
