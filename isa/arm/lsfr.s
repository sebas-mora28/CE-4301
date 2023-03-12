.data

counter: .word 10

.text 

.global _start

_start:

mov r7, #45
mov r0, #0
svc #0

mov r1, r0
mov r7, #45
add r0, r0, #100
svc #0

mov r0, #71 
str r0, [r1]
mov r2, r0 
mov r0, r1
mov r1, r2

add r0, #4

lsfr: 
mov r2, r1
mov r3, r1 
and r2, #2 
and r3, #4 
lsr r2, #1 
lsr r3, #2 
eor r2, r2, r3 
lsl r2, #7 
lsr r1, #1  
add r1, r1, r2

str r1, [r0]
add r0, #4

ldr r2, =counter
ldr r3, [r2]
mov r4, #1
sub r3, r4
str r3, [r2]
cmp r3, #0
bne lsfr

mov r0, #0 
mov r8, #93
svc #0

