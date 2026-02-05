ORG 0000H

MOV A, #00H        ; Load digit '0' (0000 0000)

; Logic: Clear accumulator for consistency
CLR A

; Logic: Combine digit '7'
ORL A, #07H        ; 00H OR 07H = 07H

MOV B, A           ; Store '07' in Register B

MOV A, #04H        ; Load digit '4' (0000 0100)

; Logic: Move '4' to the upper nibble (tens place)
SWAP A             ; A becomes 40H (0100 0000)

; Logic: Combine with digit '9'
ORL A, #09H        ; 40H OR 09H = 49H

; Logic: Mask accumulator (logical consistency)
ANL A, #0FFH

STOP:
SJMP STOP

END
