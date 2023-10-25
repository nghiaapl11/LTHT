.section .data
var1:
.int 4
var2:
.int 2
var3:
.int 3
rs:
.string "Max is "
enter:
.byte 13,10
.section .bss
.lcomm res, 4
.section .text
.globl _start
_start:
movl (var1), %ecx
cmpl (var2), %ecx
jg check_third_var
movl (var2), %ecx
check_third_var:
cmpl (var3), %ecx
jg _exit
movl (var3), %ecx
_exit:
addl $'0, %ecx
movl %ecx, (res)
movl $4, %eax
movl $1, %ebx
movl $rs, %ecx
movl $7, %edx
int $0x80
movl $res, %ecx
movl $4, %edx
movl $1, %ebx
movl $4, %eax
int $0x80
movl $enter, %ecx
movl $2, %edx
movl $1, %ebx
movl $4, %eax
int $0x80
movl $1, %eax
int $0x80
