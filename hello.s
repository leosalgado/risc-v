.global _start

.section .text
_start:
  li a0, 1
  la a1, hello
  li a2, 13
  li a7, 64   # Write
  ecall

  li a0, 0
  li a7, 93   # Exit
  ecall

.section .data
hello: .ascii "Hello world!\n"
