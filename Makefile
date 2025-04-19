# @author: Priyanka Shah
# @date: Apr 17, 2025


CC = xtensa-esp32-elf-gcc 
LD = xtensa-esp32-elf-ld
OBJCOPY = xtensa-esp32-elf-objcopy


# added -mtext-section-literals flag to resolve dangerous relocation error 
CFLAGS  = -mlongcalls -nostartfiles -mtext-section-literals  -fstrict-volatile-bitfields -Wall -Werror -std=gnu11 -nostdlib -fno-strict-aliasing -fdata-sections -ffunction-sections -Os -g
LDFLAGS = -mlongcalls -nostartfiles -mtext-section-literals  -fstrict-volatile-bitfields -nostdlib -lm -lc -lgcc 

all: build/main.elf

build/main.elf: build/startup.o build/main.o
	$(CC)  -T linker.ld -o build/main.elf build/startup.o build/main.o $(LDFLAGS)

build/startup.o:	startup.c
	$(CC) -c startup.c -o build/startup.o $(CFLAGS)

build/main.o: main.c
	$(CC) -c main.c -o build/main.o $(CFLAGS)

clean:
	rm -rf *.o *.elf *.bin build/*.o build/*.elf build/*.bin
