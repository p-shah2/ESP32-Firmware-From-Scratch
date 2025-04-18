/* 
@author: Priyanka Shah
@date: Apr 17, 2025
*/

ENTRY(_start);

MEMORY {
    iram (rx): ORIGIN = 0x40080000, LENGTH = 128K
    dram (rw): ORIGIN = 0x3FFE0000, LENGTH = 128K
}

SECTIONS {
    .text :
    {
        *(.text)
        *(.text*)
    } > iram

    .data : AT(0x10000)
    {
        __data_start = .;
        *(.data)
        __data_end = .;
    } > dram

    __data_load_addr = LOADADDR(.data);

    .bss :
    {
        __bss_start = .;
        *(.bss)
        __bss_end = .;
    } > dram

    __bss_size = __bss_end - __bss_start;
    __data_size = __data_end - __data_start;

}