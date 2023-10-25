.section .data
number: .int 4
positive_msg: .string "Positive\n"
negative_msg: .string "Negative\n"
zero_msg: .string "0\n"

.section .text
.globl _start

_start:
    # Load the value of 'number' into eax
    movl number, %eax

    # Check if the number is zero
    test %eax, %eax
    je is_zero

    # Check if the number is positive
    js is_negative

    # If number is positive
    movl $9, %edx             # Length of message
    movl $positive_msg, %ecx  # Address of message
    call print
    jmp done

is_negative:
    movl $8, %edx             # Length of message
    movl $negative_msg, %ecx  # Address of message
    call print
    jmp done

is_zero:
    movl $2, %edx             # Length of message
    movl $zero_msg, %ecx      # Address of message
    call print

done:
    call exit_program

# Function to print message
print:
    movl $1, %ebx             # File descriptor (stdout)
    movl $4, %eax             # System call number for sys_write
    int $0x80                 # Interrupt to invoke system call
    ret

# Function to exit program
exit_program:
    movl $0, %ebx             # Exit code
    movl $1, %eax             # System call number for sys_exit
    int $0x80                 # Interrupt to invoke system call
    ret
