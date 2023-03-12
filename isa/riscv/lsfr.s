
.data

counter: .word 10

.text
.global _start


_start:

    li a7, 214
    li a0, 0
    ecall 

    add t0, a0, 0 # copy return value of bkr in t0 
    li a7, 214 # sys_brk
    add a0, a0, 100 # allocate 100 bytes 
    ecall

    li t1, 71   # seed 
    sw t1, 0(a0) # store seed in memory
    add a0,a0, 4 # increment 4 bytes memory address
    # swap value

    li t2, 10 # Counter

_lfsr:
    andi a1, t1, 2 # Gets value position at 7
    andi a2, t1, 4 # Gets value position at 6
    srli a1, a1, 1 # Shifts right 1 postion
    srli a2, a2, 2 # Shifts right 1 position 
    xor a1, a1, a2 # xor
    slli a1, a1, 7 # Shifts left 7 position  
    srli t1, t1, 1 # Shifts right 1 position to discard LSB
    add t1, t1, a1  # Add xor result in LSB of the seed 
    
_store:
    sw t1, 0(a0)

    add a0, a0, 4

    li t3, 1 #
    sub t2 ,t2, t3 # Substracts 1 to counter
    bnez t2, _lfsr # Checks stop condition  
    
    
    