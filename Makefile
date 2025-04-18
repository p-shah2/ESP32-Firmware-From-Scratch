# @author: Priyanka Shah
# @date: Apr 17, 2025


CC = xtensa-esp32-elf-gcc 
LD = xtensa-esp32-elf-ld

# added -mtext-section-literals flag to resolve dangerous relocation error 
CFLAGS = -Wall -std=gnu11 -mlongcalls -nostartfiles -mtext-section-literals


all: main.elf

main.elf:	startup.o main.o
	$(CC) $(CFLAGS) -T linker.ld -o main.elf startup.o main.o

startup.o:	startup.c
	$(CC) $(CFLAGS) -c startup.c -o startup.o

main.o: main.c
	$(CC) $(CFLAGS) -c main.c -o main.o

clean:
	rm -rf *.o *.elf
