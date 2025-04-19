/* 
@author: Priyanka Shah
@date: Apr 17, 2025
*/

ENTRY(call_start_cpu0);

MEMORY {
    iram (rx): ORIGIN = 0x40080000, len = 128K
    dram (rw): ORIGIN = 0x3FFE0000, len = 128K
}

SECTIONS {
    .text :
    {
        . = ALIGN(16);
        KEEP(*(.entry.text))

        *(.text)
        *(.text*)

        *(.rodata)
        *(.rodata*)
        . = ALIGN(4);
    } > iram

    _sidata = .;
    .data : AT(_sidata)
    {
        . = ALIGN(4);
        _sdata = .;
        *(.data)
        *(.data*)
        . = ALIGN(4);
        _edata = .;
    } > dram
 
    .bss :
    {
        . = ALIGN(4);
        _sbss = .;
        *(.bss)
        *(.bss*)
        *(COMMON)
        . = ALIGN(4);
        _ebss = .;
    } > dram


}