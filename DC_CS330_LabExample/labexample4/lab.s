.section .rodata
leftBracket: .string "["
inArray: .string "%d, "

.data
Arr: .quad 1,2,3,4,5


.text
.global main

printArray:
    # %rdi = base address of array
    # %rsi = # of elements
    # no return

    mov %rdi, %r8
    mov %rsi, %r9

    mov $leftBracket, %rdi
    xor %rax, %rax
    call printf

    mov $0, %rdx #i

_printArray:
    cmp %rdx, %r9
    jl _printArray_end
    mov $inArray, %rdi
    mov (%r8, %rdx, 8), %rsi
    xor %rax, %rax
    call printf
    add $1, %rdx
    jmp _printArray

_printArray_end:
    ret

main:
push %rbp
mov %rsp, %rbp

mov $Arr, %rdi
mov $5, %rsi
xor %rax, %rax
call printArray

leave
ret