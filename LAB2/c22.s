.section .data

.section .bss
input_string:    .space 4         

.section .text
.globl _start

_start:
    movl $3, %edx                
    leal input_string, %ecx      
    movl $0, %ebx                
    movl $3, %eax                
    int $0x80

    leal input_string, %esi       
convert_loop:
    movb (%esi), %al              
    testb %al, %al                
    je end_conversion
    subb $32, %al                 
    movb %al, (%esi)              
    incl %esi                     
    loop convert_loop

end_conversion:
    movl $4, %eax                 
    movl $1, %ebx                
    leal input_string, %ecx      
    movl $3, %edx                
    int $0x80

    movl $1, %eax                
    int $0x80
