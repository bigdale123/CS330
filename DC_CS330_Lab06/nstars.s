# .data declares the region of the file for declaring global variables
.data
# .star declares a string of the star (*) character
# .star is similiar to saying "The variable .star equals a string containing the star cahracter."
.star: .string "*"
# .line declares another string containing the newline character
.line: .string "\n"
# .input declares a string containing the substitution character
.input: .string "%d"
# .count declares a space of 8 bytes filled with zeros
.count: .space 8


# .text declares the beginning of the actual code
.text
# .global main declares the start of the program
.global main

# printstars is a label for the function printstars
printstars:
    # push in the reverse order of the arguments, since it will come off the
    #   Stack in the correct order
    # push register rsi onto the stack
    push %rsi
    # push register rdi onto the stack
    push %rdi

# _printstars is a label for the function _printstars
# Big Brain Moment: By mangling the name with an underscore, we create a way for the function to loop without
#    Having to run the setup code again.
# For Example, in printstars we push rsi and rdi onto the stack. We dont want to run this code again when we loop back to print another star,
#    So we create a "sublabel" that gets run after printstars called _printstars that we can loop through without running the push commands again.
_printstars:
    # push register rdi onto the stack
    push %rdi
    # move literal star ("*") into the stack value (rdi)
    mov $.star, %rdi
    # do xor on rax and rax, and store the result in rax (will store zero)
    xor %rax, %rax
    # call subroutine printf
    call printf
    # pop rdi out of the stack
    pop %rdi
    # decrement rdi by 1
    dec %rdi
    # compare literal zero with rdi (basically, check to see if rdi is zero)
    cmp $0, %rdi
    # jump to label _printstars if rdi is greater than 0
    jg _printstars

    # mov literal line ("\n") into the rdi register
    mov $.line, %rdi
    # compare rax to itself using xor (stores 0)
    xor %rax, %rax
    # call subroutine printf
    call printf

    # pop rdi out of the stack
    pop %rdi
    # pop rsi out of the stack
    pop %rsi
    # ret tells the program to return to where it was called
    ret

# printstarpyramid is a label for the function printstarpyramid
printstarpyramid:
    # move rdi into rsi
    mov %rdi, %rsi
    # move literal 1 into the rdi register
    mov $1, %rdi

# _printstarpyramid is a label for the function _printstarpyramid
_printstarpyramid:
    # call a subrountine to the printstars label
    call printstars
    # increment rdi by 1
    inc %rdi
    # compare rsi to rdi
    cmp %rsi, %rdi
    # if rdi is less than rsi, jump to _printstarpyramid
    jle _printstarpyramid
    # return to where this label was called.
    ret

# main is a label for the main function of the program
main:
    # mov literal input ("%d") into rdi
    mov $.input, %rdi
    # mov literal input (whatever is in .count) into rsi
    mov $.count, %rsi
    # compare rax to itself using xor (stores 0 in rax)
    xor %rax, %rax
    # call subroutine scanf
    call scanf
    # mov address of .count into rdi
    mov (.count), %rdi
    # call subroutine printstarpyramid
    call printstarpyramid
