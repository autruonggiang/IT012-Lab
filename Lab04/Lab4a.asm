.data
msg_prompt: .asciiz "Nh?p ký t? (ch? m?t ký t?): "
msg_before: .asciiz "Ký t? tr??c: "
msg_after: .asciiz "Ký t? sau: "
msg_invalid: .asciiz "Lo?i không h?p l?"
msg_digit: .asciiz "Là s?"
msg_lower: .asciiz "Là ch? th??ng"
msg_upper: .asciiz "Là ch? hoa"

.text
.globl main
main:
  # In ra thông báo nh?p ký t?
  li $v0, 4
  la $a0, msg_prompt
  syscall

  # Nh?p ký t?
  li $v0, 12
  syscall
  move $t0, $v0

  # Ki?m tra lo?i ký t?
  blt $t0, '0', invalid
  bgt $t0, '9', check_lower

  # Là s?
  li $v0, 4
  la $a0, msg_digit
  syscall
  j done

check_lower:
  blt $t0, 'a', check_upper
  bgt $t0, 'z', invalid

  # Là ch? th??ng
  li $v0, 4
  la $a0, msg_lower
  syscall
  j done

check_upper:
  blt $t0, 'A', invalid
  bgt $t0, 'Z', invalid

  # Là ch? hoa
  li $v0, 4
  la $a0, msg_upper
  syscall
  j done

invalid:
  # Lo?i không h?p l?
  li $v0, 4
  la $a0, msg_invalid
  syscall

done:
  # In ra ký t? tr??c
  li $v0, 4
  la $a0, msg_before
  syscall
  li $v0, 11
  subi $t0, $t0, 1
  syscall

  # In ra ký t? sau
  li $v0, 4
  la $a0, msg_after
  syscall
  li $v0, 11
  addi $t0, $t0, 1
  syscall

  # Thoát ch??ng trình
  li $v0, 10
  syscall
