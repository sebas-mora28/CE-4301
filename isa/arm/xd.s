.data

counter: .word 10

.text 

.global _start

_start:

mov r0, #71 


lsfr: 

mov r1, r0
mov r2, r0 
and r1, #2 
and r2, #4 
lsl r1, #1 
lsl r2, #2 
eor r1, r1, r2 
lsl r1, #7 
lsr r0, #1  
add r0, r0, r1
_stop:
ldr r1, =counter
ldr r2, [r1]
mov r3, #1
sub r2, r3
str r2, [r1]
cmp r2, #0
bne lsfr
