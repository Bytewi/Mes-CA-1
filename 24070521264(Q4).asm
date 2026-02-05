MOV R0, #40H ;Q5
        MOV R1, #40H
SCAN_LOOP:
        MOV A, @R1
        CJNE A, #0FFH, KEEP_VAL
        SJMP NEXT_SCAN
KEEP_VAL:
        MOV @R0, A
        INC R0
NEXT_SCAN:
        INC R1
        CJNE R1, #60H, SCAN_LOOP
FILL_ZERO:
        CJNE R0, #60H, WRITE_ZERO
        SJMP DONE
WRITE_ZERO:
        MOV @R0, #00H
        INC R0
        SJMP FILL_ZERO
DONE:
        SJMP DONE