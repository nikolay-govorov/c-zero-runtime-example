EXE = greeter

.PHONY: build
build:
	nasm -f elf calls.asm
	nasm -f elf start.asm
	clang -m32 -Wall -c main.c
	ld -m elf_i386 start.o calls.o main.o -o $(EXE) 

.PHONY: clear
clear:
	rm -f $(EXE) *.o

