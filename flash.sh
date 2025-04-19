# @author: Priyanka Shah
# @date: Apr 17, 2025


# simple flash script

# Erase previous img since we're not using a bootloader/partitions etc 
esptool.py --chip esp32 -p /dev/tty.usbserial-0001 erase_flash

esptool.py --chip esp32 elf2image \
  --flash_mode dio \
  --flash_freq 40m \
  --flash_size 4MB \
  -o build/main.bin build/main.elf


# Flash new image 
esptool.py --chip esp32 \
  --port /dev/tty.usbserial-0001 \
  --baud 115200 \
  --before default_reset \
  --after hard_reset \
  write_flash -z \
  --flash_mode dio \
  --flash_freq 40m \
  --flash_size detect \
  0x1000 build/main.bin
