.model small
.data

arr1 db '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F'
len1 equ $-arr1

.code


mov ax, @data
mov ds, ax
mov ch, len1-1
CALL a1
    CALL COPY
    CALL PRINT

a1:
mov cl, ch
lea si, arr1


rept1:
mov al, [si]
inc si
cmp [si], al
jbe next1
xchg al, [si]
mov [si-1], al


next1:
dec cl
jnz rept1
dec ch
jnz a1

COPY:
    LEA SI, [arr1]
    MOV DI, 3000H
    MOV CX, len1

COPY_LOOP:
    MOV AL, [SI]
    MOV [DI], AL

    INC SI
    INC DI
    LOOP COPY_LOOP

    RET

PRINT:
    MOV SI, 3000H
    MOV CX, len1

PRINT_LOOP:
    MOV AH, 0EH
    MOV AL, [SI]
    INT 10H

    INC SI
    DEC CX
    JNZ PRINT_LOOP

    RET
    
mov ah, 4ch
int 21h

end