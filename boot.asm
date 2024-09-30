; boot.asm: A simple bootloader that prints a message to the screen.

[BITS 16]           ; Specify 16-bit code (Real Mode)
[ORG 0x7C00]        ; Origin: Load address for the bootloader in memory

start:
    mov si, message ; Load the address of the message into SI register
    call print_string ; Call the subroutine to print the string

hang:
    cli            ; Clear interrupts (disable)
    hlt            ; Halt the CPU
    jmp hang       ; Infinite loop

; Subroutine to print a string to the screen
print_string:
    mov ah, 0x0E   ; BIOS teletype function to print a character
.repeat:
    lodsb          ; Load byte at address in SI into AL register
    or al, al      ; Check if the end of string (null terminator)
    jz .done       ; If zero (end of string), jump to .done
    int 0x10       ; BIOS interrupt to print the character in AL
    jmp .repeat    ; Repeat for next character
.done:
    ret            ; Return from subroutine

message db "Hello, Bootloader!", 0  ; Define the message (null-terminated string)

; Bootloader must end with a 0xAA55 signature for BIOS to recognize
times 510-($-$$) db 0  ; Fill the remaining space to make 512 bytes
dw 0xAA55              ; Boot signature (must be at offset 510)
