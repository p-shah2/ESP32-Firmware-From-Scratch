# @author: Priyanka Shah
# @date: Apr 17, 2025


# simple flash script

# Erase previous img since we're not using a bootloader/partitions etc 
esptool.py --chip esp32 -p /dev/tty.usbserial-0001 erase_flash

# Flash new image 
esptool.py --chip esp32 -b 115200 -p /dev/tty.usbserial-0001 write_flash 0x10000 build/main.bin
