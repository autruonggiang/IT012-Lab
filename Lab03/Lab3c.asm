.data
input_string:   .asciiz "Nhap: "
output_string:  .asciiz "Xuat: "
buffer:         .space 100   # ??t kích th??c buffer tùy ý

.text
main:
    # In chu?i nh?p
    li $v0, 4          # System call cho in chu?i
    la $a0, input_string   # Load ??a ch? c?a chu?i nh?p
    syscall

    # ??c chu?i t? ng??i dùng
    li $v0, 8          # System call cho ??c chu?i
    la $a0, buffer     # Load ??a ch? c?a buffer
    li $a1, 100        # Kích th??c c?a buffer
    syscall

    # In chu?i xu?t
    li $v0, 4          # System call cho in chu?i
    la $a0, output_string  # Load ??a ch? c?a chu?i xu?t
    syscall

    # In chu?i ?ã nh?p
    li $v0, 4          # System call cho in chu?i
    la $a0, buffer     # Load ??a ch? c?a buffer
    syscall

    # K?t thúc ch??ng trình
    li $v0, 10         # System call cho k?t thúc ch??ng trình
    syscall