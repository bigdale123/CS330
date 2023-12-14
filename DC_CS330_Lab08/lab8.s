.section .rodata
# put any constants here, such as strings or integers youll reuse
.True: .string "This is a valid triangle (True)\n"
.False: .string "This is NOT a valid triangle (False)\n"
.input: .string "%d"
.InputA: .string "Enter the value of A: "
.InputB: .string "Enter the value of B: "
.InputC: .string "Enter the value of C: "
.newline: .string "\n"

.data
# put any variables here, such as arrays you would sort or empty memory for user input
.A: .quad 0
.B: .quad 4
.C: .quad 5
.count: .space 8


.text
# everything inside .text is read-only, which includes your code!
.global main  # required

checkTriangle:
  mov .A, %rdi
  mov .B, %rsi
  add %rdi, %rsi
  mov .C, %rax
  cmpq %rax, %rsi
  jle .end
  mov .A, %rdi
  mov .C, %rsi
  add %rdi, %rsi
  mov .B, %rax
  cmpq %rax, %rsi
  jle .end
  mov .B, %rdi
  mov .C, %rsi
  add %rdi, %rsi
  mov .A, %rax
  cmpq %rax, %rsi
  jle .end
  ###all three conditions true, print true
  # mov literal True string into rdi
  mov $.True, %rdi
  # clear out return register
  xor %rax, %rax
  # call printf
  call printf
  ret

.end:
  #mov literal false string into rdi
  mov $.False, %rdi
  # clear out return register
  xor %rax,%rax
  # call printf
  call printf
  ret

main:  # required, tells gcc where to begin execution
  mov $.InputA, %rdi
  xor %rax, %rax
  call printf

  mov $.input, %rdi
  mov $.count, %rsi
  xor %rax, %rax
  call scanf

  mov (.count), %rdi
  mov %rdi, .A

  mov $.InputB, %rdi
  xor %rax, %rax
  call printf

  mov $.input, %rdi
  mov $.count, %rsi
  xor %rax, %rax
  call scanf

  mov (.count), %rdi
  mov %rdi, .B

  mov $.InputC, %rdi
  xor %rax, %rax
  call printf

  mov $.input, %rdi
  mov $.count, %rsi
  xor %rax, %rax
  call scanf

  mov (.count), %rdi
  mov %rdi, .C

  mov $.newline, %rdi
  xor %rax, %rax
  call printf

  call checkTriangle
