ipl_image : ipl
	cd ../bootstrap && make
	dd if=ipl.bin of=../floppy.img bs=512 count=1 seek=1
ipl :
	nasm ipl.asm -o ipl.bin