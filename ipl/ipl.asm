org 0200h
Set_Video_Mode:
	mov ah, 00h	; set video mode
	mov al, 13h	; video mode: VGA 
	int 10h