%include 'in_out.asm'
 
SECTION .data
    msg: DB 'Введите x: ', 0
    rem: DB 'Результат: ', 0
 
SECTION .bss
    x: RESB 80
 
SECTION .text
GLOBAL _start
 
_start:
    mov eax, msg
    call sprintLF
 
    mov ecx, x
    mov edx, 80
    call sread
 
    mov eax, x
    call atoi
 
    ; Вызов подпрограммы преобразования ASCII кода в число
    ; eax содержит x, edx сброшен в 0
 
    add eax, 1
    imul eax, 18
    mov ebx, 6
    div ebx
 
    mov eax, rem
    call sprint
 
    mov eax, edx
    call iprintLF
 
    call quit
