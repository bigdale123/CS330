.section .rodata
# put any constants here, such as strings or integers youll reuse
# modifying these during runtime causes a segmentation fault, so be cautious!
.sub: .string "Result of %d times 5: %d\n"
.sub1: .string "Result of (%d + %d) - (%d / %d) = %d\n"
.sub2: .string "Result of (%d - %d) + (%d * %d) = %d\n"
.subtemp: .string "%d\n"

.data
# put any variables here, such as arrays you would sort or empty memory for user input
.A: .quad 8
.B: .quad 8

.text
# everything inside .text is read-only, which includes your code!
.global main  # required

multiply:
    # mov substitution string into rdi
    mov $.sub, %rdi
    # mov value of A into rsi
    mov .A, %rsi
    # mov A into rdi temporarily (for math)
    mov .A, %rdx
    # Multiply rdx (A) by 5 and store in rdx
    imul $5, %rdx
    # clear out return register (rax)
    xor %rax, %rax
    # call printf on %rdi & %rsi & %rdx (should contain A*5)
    call printf
    # return to main function
    ret

Problem2:
    # Note to self: Ran out of time, this may not be optimized but it works, so NO TOUCH. dont break this again.
    # mov sub1 into rdi
    mov $.sub1, %rdi
    # mov value of A into temp reg %rsi
    mov .A, %rsi
    # mov value of B into temp reg %rdx
    mov .B, %r8
    # add A and B together
    add %rsi,%r8
    # mov value of 0 into dividend (rdx)
    mov $0, %rdx
    # mov value of A into dividend (rax)
    mov .A, %rax
    # mov value of B into divisor (rcx)
    mov .B, %rcx
    # divide %rsi by %rdx and store in rdx
    idiv %rcx
    #mov rax into r9
    mov %rax, %r9
    # subtract r9 from r8 and store in r8
    sub %r9,%r8
    # mov r8 into r9 for formatting
    mov %r8,%r9
    # mov B into r8
    mov .B, %r8
    # mov A into rcx
    mov .A, %rcx
    # mov B into rdx
    mov .B, %rdx
    # mov A into rsi
    mov .A, %rsi
    # put 0 in rax
    xor %rax, %rax
    # call printf
    call printf
    # return to main function
    ret

Problem3:
    #mov A into rsi
    mov .A, %rsi
    #mov B into rdx
    mov .B, %rdx
    #Subtract rdx from rsi, store in rsi
    sub %rdx, %rsi
    #mov rsi into r8
    mov %rsi, %r8
    #mov A into rsi
    mov .A, %rsi
    #mov B into rdx
    mov .B, %rdx
    #multiply rsi by rdx, store in rdx
    imul %rsi, %rdx
    #mov rdx into r9
    mov %rdx, %r9
    #add r8 and r9, store in r9
    add %r8, %r9
    # mov sub2 into rdi
    mov $.sub2, %rdi
    # mov A into rsi
    mov .A, %rsi
    # mov B into rdx
    mov .B, %rdx
    # mov A into rcx
    mov .A, %rcx
    # mov B into r8
    mov .B, %r8
    # put 0 in rax
    xor %rax, %rax
    # call printf
    call printf
    # return to main function
    ret


main:  # required, tells gcc where to begin execution
  # call multiply function
  call multiply
  call Problem2
  call Problem3
