.section .rodata
String1: .string "%d Farenheit is equal to %d Celcius.\n"
String2: .string "%d Celcius is equal to %d Farenheit.\n"
InputString1: .string "Enter the Farenheit to convert to Celcius: "
InputString2: .string "Enter the Celcius to convert to Farenheit: "
substring: .string "%d"

.data
A: .quad 0
B: .quad 0
input: .space 8

.text
.global main
ctof:
    
    # Take in celsius in rdi, return farenheit in rax


    # push the value of rdi onto the stack
    push %rdi
    
    # multiply rdi by 9, store in rdi
    imul $9, %rdi


    # divide rdi by 5
    
    # mov rdi into rax, temporarily
    mov %rdi, %rax
    # cqto to extend into rdx
    cqto
    # mov divisor into rbx
    mov $5, %rbx
    # divide by 5, remainder in rdx and product in rax
    idiv %rbx

    # add 32 to the result from before (%rax)
    add $32, %rax

    # pop rdi back off the stack
    pop %rdi

    # return to where the function was called
    ret

ftoc:
    # Take in value in rdi, return value in rax

    # push the value of rdi onto the stack
    push %rdi

    # subtract 32 from rdi
    sub $32, %rdi

    # mulitply rdi by 5
    imul $5, %rdi

    # divide rdi by 5

    # mov rdi into rax, temporarily
    mov %rdi, %rax
    # cqto to extend into rdx
    cqto
    # mov divisor into rbx
    mov $9, %rbx
    # divide by 9, remainder in rdx and product in rax
    idiv %rbx

    # pop rdi back off
    pop %rdi

    #return to where the function was called.
    ret

main:
    #preamble
    pushq %rbp
    movq %rsp, %rbp

    # code here


    # get User Input for ctof
    mov $InputString1, %rdi
    # clear out return register
    xor %rax, %rax
    # call printf
    call printf

    # Run scanf
    # mov substitution string into rdi
    mov $substring, %rdi
    # mov address of our variable into rsi
    mov $input, %rsi
    # clear out return register
    xor %rax, %rax
    # call scanf
    call scanf

    
    # mov farenheit into rdi
    mov (input), %rdi
    # mov rdi into A
    mov %rdi, A

    # get User Input for ctof
    mov $InputString2, %rdi
    # clear out return register
    xor %rax, %rax
    # call printf
    call printf

    # Run scanf
    # mov substitution string into rdi
    mov $substring, %rdi
    # mov address of our variable into rsi
    mov $input, %rsi
    # clear out return register
    xor %rax, %rax
    # call scanf
    call scanf


    # mov farenheit into rdi
    mov (input), %rdi
    # mov rdi into B
    mov %rdi, B

    # mov A into rdi
    mov A, %rdi
    # call ctof
    call ftoc

    # mov rdi into rsi
    mov %rdi, %rsi
    # mov string1 into rdi
    mov $String1, %rdi
    # mov rax into rdx
    mov %rax, %rdx
    # empty the return register
    xor %rax, %rax
    # call printf
    call printf


    # mov B into rdi
    mov B, %rdi
    # call ctof
    call ctof

    # mov rdi into rsi
    mov %rdi, %rsi
    # mov string1 into rdi
    mov $String2, %rdi
    # mov rax into rdx
    mov %rax, %rdx
    # empty the return register
    xor %rax, %rax
    # call printf
    call printf



    # return
    movq $0, %rax
    leave
    ret
