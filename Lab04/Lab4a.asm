.data
msg_prompt: .asciiz "Nh?p k� t? (ch? m?t k� t?): "
msg_before: .asciiz "K� t? tr??c: "
msg_after: .asciiz "K� t? sau: "
msg_invalid: .asciiz "Lo?i kh�ng h?p l?"
msg_digit: .asciiz "L� s?"
msg_lower: .asciiz "L� ch? th??ng"
msg_upper: .asciiz "L� ch? hoa"

.text
.globl main
main:
  # In ra th�ng b�o nh?p k� t?
  li $v0, 4
  la $a0, msg_prompt
  syscall

  # Nh?p k� t?
  li $v0, 12
  syscall
  move $t0, $v0

  # Ki?m tra lo?i k� t?
  blt $t0, '0', invalid
  bgt $t0, '9', check_lower

  # L� s?
  li $v0, 4
  la $a0, msg_digit
  syscall
  j done

check_lower:
  blt $t0, 'a', check_upper
  bgt $t0, 'z', invalid

  # L� ch? th??ng
  li $v0, 4
  la $a0, msg_lower
  syscall
  j done

check_upper:
  blt $t0, 'A', invalid
  bgt $t0, 'Z', invalid

  # L� ch? hoa
  li $v0, 4
  la $a0, msg_upper
  syscall
  j done

invalid:
  # Lo?i kh�ng h?p l?
  li $v0, 4
  la $a0, msg_invalid
  syscall

done:
  # In ra k� t? tr??c
  li $v0, 4
  la $a0, msg_before
  syscall
  li $v0, 11
  subi $t0, $t0, 1
  syscall

  # In ra k� t? sau
  li $v0, 4
  la $a0, msg_after
  syscall
  li $v0, 11
  addi $t0, $t0, 1
  syscall

  # Tho�t ch??ng tr�nh
  li $v0, 10
  syscall
