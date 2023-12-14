.data               # start of data section
# put any global or static variables here

.section .rodata    # start of read-only data section
# constants here, such as strings
# modifying these during runtime causes a segmentation fault, so be cautious!
retString: .string "result is %d\n"

.text               # start of text /code
# everything inside .text is read-only, which includes your code!
.global main        # required, tells gcc where to begin execution

# === functions here ===
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


main:               # start of main() function
# preamble
pushq %rbp
movq %rsp, %rbp

# === main() code here ===

    mov $0, %rdi
    mov $1, %rsi
    xor %rax, %rax
    call addif

    mov $retString, %rdi
    mov %rax, %rsi
    xor %rax, %rax
    call printf

# clean up and return
movq $0, %rax       # place return value in rax
leave               # undo preamble, clean up the stack
ret                 # return
