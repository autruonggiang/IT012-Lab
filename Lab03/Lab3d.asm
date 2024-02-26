.data
prompt1:        .asciiz "Nhap so nguyen thu nhat: "
prompt2:        .asciiz "Nhap so nguyen thu hai: "
result_msg:     .asciiz "Tong cua 2 so nguyen la: "

.text
main:
    # Nh?p s? nguyên th? nh?t
    li $v0, 4           # System call cho in chu?i
    la $a0, prompt1     # Load ??a ch? c?a prompt1
    syscall

    li $v0, 5           # System call cho ??c s? nguyên
    syscall
    move $s0, $v0       # L?u s? nguyên th? nh?t vào $s0

    # Nh?p s? nguyên th? hai
    li $v0, 4           # System call cho in chu?i
    la $a0, prompt2     # Load ??a ch? c?a prompt2
    syscall

    li $v0, 5           # System call cho ??c s? nguyên
    syscall
    move $s1, $v0       # L?u s? nguyên th? hai vào $s1

    # Tính t?ng
    add $s2, $s0, $s1   # $s2 = $s0 + $s1

    # Xu?t k?t qu?
    li $v0, 4           # System call cho in chu?i
    la $a0, result_msg  # Load ??a ch? c?a result_msg
    syscall

    li $v0, 1           # System call cho in s? nguyên
    move $a0, $s2       # Load t?ng vào $a0
    syscall

    # K?t thúc ch??ng trình
    li $v0, 10          # System call cho k?t thúc ch??ng trình
    syscall