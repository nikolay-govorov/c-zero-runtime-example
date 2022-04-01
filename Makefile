.PHONY: build
build:
	nasm -f elf calls.asm
	nasm -f elf start.asm
	gcc -m32 -Wall -c main.c
	ld -m elf_i386 start.o calls.o main.o -o greeter

