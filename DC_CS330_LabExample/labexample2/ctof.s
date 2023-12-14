.data               # start of data section
# put any global or static variables here

.section .rodata    # start of read-only data section
# constants here, such as strings
# modifying these during runtime causes a segmentation fault, so be cautious!
ctofString: .string "%d Celcius = %d Farenheit.\n"
ftocString: .string "%d Farenheit = %d Celcius.\n"

.text               # start of text /code
# everything inside .text is read-only, which includes your code!
.global main        # required, tells gcc where to begin execution

# === functions here ===
FtoC:
    # Input in %rdi, output in %rax

    # Callee Saving
    push %rcx
    push %rdi

    # Function Body
    sub $32, %rdi

    mov %rdi, %rax
    cqto
    mov $5, %rcx
    imul %rcx

    # division
    cqto
    mov $9, %rcx
    idiv %rcx

    # Callee Restore
    pop %rdi
    pop %rcx

    ret

CtoF:
    # input in %rdi, return value %rax

    # Calle Saving
    push %rcx
    push %rdi

    # Function Body
    mov %rdi, %rax
    cqto
    mov $9, %rcx
    imul %rcx

    # Division
    cqto
    mov $5, %rcx
    idiv %rcx

    add $32, %rax

    # Callee Restore
    pop %rdi
    pop %rcx

    ret

main:               # start of main() function
# preamble
pushq %rbp
movq %rsp, %rbp

# === main() code here ===
    mov $32, %rdi
    xor %rax, %rax
    call FtoC

    # print result
    mov %rdi, %rsi
    mov $ftocString, %rdi
    mov %rax, %rdx
    xor %rax, %rax
    call printf

    # Function 2
    mov $100, %rdi
    xor %rax, %rax
    call CtoF

    # print result
    mov %rdi, %rsi
    mov $ctofString, %rdi
    mov %rax, %rdx
    xor %rax, %rax
    call printf

# clean up and return
movq $0, %rax       # place return value in rax
leave               # undo preamble, clean up the stack
ret                 # return
