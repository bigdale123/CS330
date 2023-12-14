.data
.star: .string "*"
.line: .string "\n"

.input: .string "%d"

.count: .space 8

.text
.global main

printstars:
    push %rsi
    push %rdi

_printstars:
    push %rdi
    mov $.star, %rdi
    xor %rax, %rax
    call printf
    pop %rdi

    dec %rdi
    cmp $0, %rdi
    jg _printstars

    mov $.line, %rdi
    xor %rax, %rax
    call printf

    pop %rdi
    pop %rsi

    ret

printstarpyramid:

    mov %rdi, %rsi
    mov $1, %rdi

_printstarpyramid:
    call printstars

    inc %rdi
    cmp %rsi, %rdi
    jle _printstarpyramid
    ret

main:

    mov $.input, %rdi
    mov $.count, %rsi
    xor %rax, %rax
    call scanf

    mov (.count), %rdi

    call printstarpyramid
