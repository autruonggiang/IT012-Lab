.data
input_string:   .asciiz "Nhap: "
output_string:  .asciiz "Xuat: "
buffer:         .space 100   # ??t k�ch th??c buffer t�y �

.text
main:
    # In chu?i nh?p
    li $v0, 4          # System call cho in chu?i
    la $a0, input_string   # Load ??a ch? c?a chu?i nh?p
    syscall

    # ??c chu?i t? ng??i d�ng
    li $v0, 8          # System call cho ??c chu?i
    la $a0, buffer     # Load ??a ch? c?a buffer
    li $a1, 100        # K�ch th??c c?a buffer
    syscall

    # In chu?i xu?t
    li $v0, 4          # System call cho in chu?i
    la $a0, output_string  # Load ??a ch? c?a chu?i xu?t
    syscall

    # In chu?i ?� nh?p
    li $v0, 4          # System call cho in chu?i
    la $a0, buffer     # Load ??a ch? c?a buffer
    syscall

    # K?t th�c ch??ng tr�nh
    li $v0, 10         # System call cho k?t th�c ch??ng tr�nh
    syscall