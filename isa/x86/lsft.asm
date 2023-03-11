section .data 
counter db 10 


section .text
global _start

_start: 

mov rax, 12
mov rdi, 0
syscall

mov rbx, rax
mov rax, 12
add rbx, 100
mov rdi, rbx
syscall

mov r8, 71
mov [rax], r8
add rax, 4

lsfr:

mov r9, r8
mov r10, r8
and r9, 2
and r10, 4
shr r9, 1
shr r10, 2
xor r9, r10
shl r9, 7
shr r8, 1
add r8, r9
mov [rax], r8
add rax, 4
mov r9, [counter]
sub r9, 1
mov [counter], r9
cmp r9, 0
jne lsfr



exit:

mov rax, 60
mov rdi, 0
syscall

