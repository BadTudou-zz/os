;	MBR structure: 512
;	-------------
;	Code：440
;	Disk Signature: 4
;	Nulls: 2
;	Disk Parttion Table(DPT): 64
;	MBR Signature: 2,0xAA55
;	-------------

; 0xAA55
; AAh = 10101010
; 55h = 01010101

; BIOS loads a first sector(512B) of diskette into 0x7C00
; 7c00h =  32KiB - 1024B = 32KiB - 1 KiB = 31KiB

;	Memory layout
;	+--------------------- 0x0
;	| Interrupts vectors
;	+--------------------- 0x400
;	| BIOS data area
;	+--------------------- 0x5??
;	| OS load area
;	+--------------------- 0x7C00
;	| Boot sector
;	+--------------------- 0x7E00
;	| Boot data/stack
;	+--------------------- 0x7FFF
;	| (not used)
;	+--------------------- (...)


MBR:
    code:
        org 07c00h

        mov ax, cs
        mov ds, ax
        mov si, data


        Print_String:
            mov al, [si]
            cmp al, 0
            je End
            add si, 1h

        Print_Char:
            mov ah, 0eh     ;模式：电传打字机输出
            int 10h
            jmp Print_String

        End:
            hlt
    data:
        db    "Hello, OS world!"
        db     0h   ;字符串结束标志
    
    times 510-($-$$) db    0    ; 当前位置到510，用0填充

    MBR_Signature:
        dw 0xaa55    ; MBR签名

;Why BIOS loads MBR into 0x7C00 in x86 ? https://www.glamenv-septzen.net/en/view/6