ORG 0000H
    
    MOV 50H, #05H       
    MOV 51H, #05H       

    MOV A, 50H
    MOV R0, A
    MOV A, 51H
    MOV R1, A

COMPARE_LOOP:
    MOV A, R0
    JZ CHECK_B_ZERO     ; Both hit 0 at same time
    MOV A, R1
    JZ A_GREATER

    DEC R0
    DEC R1
    MOV A, #01H
    JNZ COMPARE_LOOP

CHECK_B_ZERO:
    MOV A, R1
    JZ BOTH_EQUAL       ; B is also 0, so Equal
    
    MOV R2, #0FFH
    MOV A, #01H
    JNZ STOP_PROGRAM

A_GREATER:
    MOV R2, #01H
    MOV A, #01H
    JNZ STOP_PROGRAM

BOTH_EQUAL:
    MOV R2, #00H        ; Result 00H (Expected here)

STOP_PROGRAM:
    MOV A, #01H
    JNZ STOP_PROGRAM
END