# @author: Priyanka Shah
# @date: Apr 17, 2025

CC = xtensa-esp32-elf-gcc 
LD = xtensa-esp32-elf-ld
OBJCOPY = xtensa-esp32-elf-objcopy

BUILD_DIR = build
SRC_DIR = .
LINKER_DIR = ld
LINKER_SCRIPT = $(LINKER_DIR)/linker.ld
STARTUP_DIR = startup


SRCS = $(SRC_DIR)/main.c \
	$(SRC_DIR)/drivers/gpio/gpio.c \
	$(STARTUP_DIR)/startup.c

INCLUDE_DIRS = $(SRC_DIR)/drivers/gpio/include


# OBJS =  $(BUILD_DIR)/main.o \
# 	    $(BUILD_DIR)/gpio.o \
#         $(BUILD_DIR)/startup.o

OBJS = $(patsubst %.c, $(BUILD_DIR)/%.o, $(notdir $(SRCS)))


# added -mtext-section-literals flag to resolve dangerous relocation error 
CFLAGS  = $(foreach dir, $(INCLUDE_DIRS), -I$(dir)) \
			-mlongcalls -nostartfiles -mtext-section-literals  -fstrict-volatile-bitfields -Wall -Werror -std=gnu11 -nostdlib -fno-strict-aliasing -fdata-sections -ffunction-sections -Os -g

LDFLAGS = -mlongcalls -nostartfiles -mtext-section-literals  -fstrict-volatile-bitfields -nostdlib -lm -lc -lgcc 

all: $(BUILD_DIR)/main.elf

# Linking step
$(BUILD_DIR)/main.elf: $(OBJS)
	$(CC)  -T $(LINKER_SCRIPT) -o $@ $^ $(LDFLAGS)

# Compiling step for all .c files
$(BUILD_DIR)/%.o:
	@mkdir -p $(BUILD_DIR)
	$(CC) -c $(filter %/$*.c,$(SRCS)) -o $@ $(CFLAGS)


clean:
	rm -rf *.o *.elf *.bin $(BUILD_DIR)/*.o $(BUILD_DIR)/*.elf $(BUILD_DIR)/*.bin
