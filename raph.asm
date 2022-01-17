BITS 64

global _start

section .rodata

        data_salut db "                   ---* Crack-Me by Raph *---", 0xa, 0
        data_salut_len equ $-data_salut

        data_enteryourreponse db "Entre un mot de passe :", 0xa, 0
        data_enteryourreponse_len equ $-data_enteryourreponse

        data_goodpasswd db "Yes, tu a reussi flag : RaphCTF{Bi3n_Jou3_B34u_G0ss3!}", 0xa, 0
        data_goodpasswd_len equ $-data_goodpasswd

        data_badpasswd db "No, continues encore ^^", 0xa, 0
        data_badpasswd_len equ $-data_badpasswd

        data_lebonmdp db "raphgui"
	data_lebonmdp_len equ $-data_lebonmdp
section .bss
        lemotdepasseduboss resb 10

section .text

_start:
        mov rax, 0x1
        mov rdi, 0x1
        mov rsi, data_salut
        mov rdx, data_salut_len
        syscall
        jmp _salut
_salut:
        mov rax, 0x1
        mov rdi, 0x1
        mov rsi, data_enteryourreponse
        mov rdx, data_enteryourreponse_len
        syscall
        jmp _input

_input:
        mov rax, 0x0
        mov rdx, 0
        mov rsi, lemotdepasseduboss
        mov rdx, 10
        syscall
        jmp _raphgui

_raphgui:
        mov rax, 0x1
        mov rdi, 0x1
        mov rsi, lemotdepasseduboss
        mov rdx, 10
        syscall
        jmp _magienoire

_magienoire:
        mov rcx, 12
        cmp rsi, rbp
        je _goodpasswd
        jne _badpasswd

_goodpasswd:
        mov rax, 0x1
        mov rdi, 0x1
        mov rsi, data_goodpasswd
        mov rdx, data_goodpasswd_len
        syscall
        jmp _exit

_badpasswd:
        mov rax, 0x1
        mov rdi, 0x1
        mov rsi, data_badpasswd
        mov rdx, data_badpasswd_len
        syscall
        jmp _exit
_exit:
        mov rax, 0x3C
        mov rdi, 0
        syscall
