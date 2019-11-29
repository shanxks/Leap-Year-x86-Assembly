section .data
    l db 'is a leap year',0xa
    len equ $-l
    le db'not a leap year',0xa
    len1 equ $-le
    year dd 2020
section .text
    global _start
    
_start:
    mov edx,0
    mov eax,[year]
    mov ecx,4h
    div ecx
    cmp edx,0
    jne ll
    
    mov edx,0
    mov eax,[year]
    mov ecx,64h
    div ecx
    cmp edx,0
    jne l2
    
    mov edx,0
    mov eax,[year]
    mov ecx,190h
    div ecx
    cmp edx,0
    jne ll
    je l2
    
    ll:
    mov ecx,le
    mov edx,len1
    mov eax,4
    mov ebx,1
    int 0x80
    jmp ut
    l2:
    mov ecx,l
    mov edx,len
    mov eax,4
    mov ebx,1
    int 0x80
    ut:
    mov eax,1
    int 0x80
    

