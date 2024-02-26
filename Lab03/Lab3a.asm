.data
    str1: .asciiz "Chao ban! Ban la sinh vien nam thu may?"
    str2: .asciiz "\nHihi, minh la sinh vien nam thu 1 ^-^"
    input_str: .space 100  # assuming the input string has a maximum length of 100 characters

.text
    main:
        # a) Khai bao va xuat ra cua so I/O 2 chuoi
        li $v0, 4          # system call for print_str
        la $a0, str1       # load address of str1 into $a0
        syscall

        li $v0, 4          # system call for print_str
        la $a0, str2       # load address of str2 into $a0
        syscall

        # b) Bieu dien nhi phan cua 2 chuoi tren duoi bo nho la gi?
        li $v0, 4          # system call for print_str
        la $a0, input_str  # load address of input_str into $a0
        syscall

        # c) Xuat ra lai dung chuoi da nhap
        li $v0, 8          # system call for read_str
        la $a0, input_str  # load address of input_str into $a0
        li $a1, 100        # maximum length of the input string
        syscall

        li $v0, 4          # system call for print_str
        la $a0, input_str  # load address of input_str into $a0
        syscall

        # Exit program
        li $v0, 10         # system call for exit
        syscall