# @author: Priyanka Shah
# @date: Apr 17, 2025


CC = xtensa-esp32-elf-gcc 
LD = xtensa-esp32-elf-ld

CFLAGS = -Wall -std=gnu11

all:
	$(CC) main.c -o main.o
	$(LD) main.o -T linker.ld main.o -o main.elf

clean:
	rm -rf main.elf main.o 
