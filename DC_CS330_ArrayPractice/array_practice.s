.section .rodata
.result: .string "Sum of array: %d\n"
.Last: .string "Last Element of Array: %d\n"

.data
# arrays should be declared in .data most often
.arr: .quad 5, 5, 5, 5, 5, 5, 0
.arrlen: .quad 6  # you must know array length, so make a var for it

.text
.global main

sumarr:
    # expects array pointer in %rdi
    # expects array length in %rsi
    # use %rcx as the current index
    # returns in %rax
    push %rcx
    xor %rcx, %rcx
    xor %rax, %rax
_sumarr:
    addq (%rdi, %rcx, 8), %rax
    # (pointer, index, width) de-referenced into value

    inc %rcx
    cmp %rcx, %rsi
    jne _sumarr

    inc %rcx
    mov %rdi, %r8
    push %rax
    movq %rax, (%r8, %rcx, 8)
    mov $.Last, %rdi
    mov (%r8,%rcx,8), %rsi
    xor %rax, %rax
    call printf
    pop %rax
    pop %rcx
    ret

printArr:
    

main:
    mov $.arr, %rdi  # arr pointer
    mov (.arrlen), %rsi  # arr len
    call sumarr

    mov $.result, %rdi
    mov %rax, %rsi
    xor %rax, %rax
    call printf

    

    # if you get a segfault after your program finishes
    # this will resolve it
    mov $0, %rdi
    xor %rax, %rax
    call exit
