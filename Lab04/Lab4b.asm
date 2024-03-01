.data
    prompt1:    .asciiz "Nhap so thu nhat: "
    prompt2:    .asciiz "Nhap so thu hai: "
    result1:    .asciiz "So lon hon: "
    result2:    .asciiz "\nTong: "
    result3:    .asciiz "\nHieu: "
    result4:    .asciiz "\nTich: "
    result5:    .asciiz "\nThuong: "
    div_zero_error: .asciiz "\nLoi: Chia cho 0"

.text
    main:
        # Nh?p s? th? nh?t
        li $v0, 4
        la $a0, prompt1
        syscall

        li $v0, 5
        syscall
        move $s0, $v0  # L?u s? th? nh?t vào thanh ghi $s0

        # Nh?p s? th? hai
        li $v0, 4
        la $a0, prompt2
        syscall

        li $v0, 5
        syscall
        move $s1, $v0  # L?u s? th? hai vào thanh ghi $s1

        # So sánh và in ra s? l?n h?n
        bgt $s0, $s1, larger
        li $v0, 4
        la $a0, result1
        syscall

        move $a0, $s1
        li $v0, 1
        syscall
        j done

    larger:
        li $v0, 4
        la $a0, result1
        syscall

        move $a0, $s0
        li $v0, 1
        syscall

    done:
        # Tính t?ng, hi?u, tích và th??ng
        add $s2, $s0, $s1  # T?ng
        sub $s3, $s0, $s1  # Hi?u
        mul $s4, $s0, $s1  # Tích

        beqz $s1, division_by_zero_check  # Ki?m tra chia cho 0
        div $s0, $s1
        mflo $s5  # Th??ng
        j print_results

    division_by_zero_check:
    # X? lý chia cho 0
    beqz $s1, skip_division_by_zero  # Ki?m tra chia cho 0
    li $v0, 4
    la $a0, div_zero_error
    syscall
    j exit_program

    skip_division_by_zero:
    # Tính th??ng khi không chia cho 0
    div $s0, $s1
    mflo $s5  # Th??ng
    j print_results


    print_results:
        # In k?t qu?
        li $v0, 4
        la $a0, result2
        syscall

        move $a0, $s2
        li $v0, 1
        syscall

        li $v0, 4
        la $a0, result3
        syscall

        move $a0, $s3
        li $v0, 1
        syscall

        li $v0, 4
        la $a0, result4
        syscall

        move $a0, $s4
        li $v0, 1
        syscall

        li $v0, 4
        la $a0, result5
        syscall

        move $a0, $s5
        li $v0, 1
        syscall

    exit_program:
        # K?t thúc ch??ng trình
        li $v0, 10
        syscall