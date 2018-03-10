bootstrap_image : bootstrap
	dd if=bootstrap.bin of=../floppy.img bs=512 count=1
bootstrap :
	nasm bootstrap.asm -o bootstrap.bin