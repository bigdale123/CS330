.section rodata
retString: .string "Result is %d \n"

.data


.text
.global main

addif:
    mov %rsi, %rax
    add %rdi, %rax

_addif:
    cmp $3, %rax
    jg _addif_end
    add $1, %rdi
    mov %rsi, %rax
    add %rdi, %rax
    jmp _addif

_addif_end:
    ret


main:
    mov $0, %rdi
    mov $1, %rsi
    xor %rax, %rax
    call addif

    mov $retString, %rdi
    mov %rax, %rsi
    xor %rax, %rax
    call printf

    ret
