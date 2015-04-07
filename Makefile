SHELL = /bin/sh

ARMGNU := arm-none-eabi
CFLAGS := -O2
SRC_DIR := ./src
BUILD_DIR := ./build

ALL_CFLAGS = $(CFLAGS) -mfpu=vfp -mfloat-abi=hard -march=armv6zk -mtune=arm1176jzf-s -nostartfiles

kernel.elf:
	test -d $(BUILD_DIR) || mkdir $(BUILD_DIR)
	$(ARMGNU)-gcc $(ALL_CFLAGS) $(SRC_DIR)/main.c -o $(BUILD_DIR)/kernel.elf

kernel.img: kernel.elf
	test -d $(BUILD_DIR) || mkdir $(BUILD_DIR)
	$(ARMGNU)-objcopy $(BUILD_DIR)/$< -O binary $(BUILD_DIR)/kernel.img

all: kernel.img

install: all
	cp $(BUILD_DIR)/kernel.img ../sdcard/

uninstall:
	rm -f ../sdcard/kernel.img

clean:
	rm -rf $(BUILD_DIR)
