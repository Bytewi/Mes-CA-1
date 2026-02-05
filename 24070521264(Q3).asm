ORG 0000H

    ; --- STEP 1: INITIALIZE RAM (MEMORY SETUP) ---
    ; We are setting up a "Pointer Chain":
    ; Address 30H will hold the value 40H.
    ; Address 40H will hold the value 55H (The Target Data).
    
    MOV 30H, #40H       ; Store '40H' at location 30H
    MOV 40H, #55H       ; Store '55H' at location 40H


    ; --- PROGRAM 1: DIRECT ADDRESSING ---
    ; "Accesses the data stored at the given address"
    ; We directly ask for the content of address 30H.
    
    MOV A, 30H          ; Direct Mode: Read RAM[30H]
    MOV R0, A           ; Save Output to R0
    ; RESULT: R0 should contain 40H.


    ; --- PROGRAM 2: INDIRECT ADDRESSING (POINTER LOGIC) ---
    ; "Treats the contents of that address as a pointer to another location"
    
    MOV R1, #30H        ; Load the address '30H' into a pointer register
    MOV A, @R1          ; 1. Read the content of 30H (We get 40H)
    
    MOV R1, A           ; 2. treating '40H' as the NEW address (Pointer)
    MOV A, @R1          ; 3. Read the content of 40H (We get 55H)
    
    MOV R2, A           ; Save Output to R2
    ; RESULT: R2 should contain 55H.

STOP:
    SJMP STOP           ; Infinite loop to hold the values
END