// @author: Priyanka Shah
// @date: Apr 17, 2025

#include <string.h>


extern unsigned int __data_start;
extern unsigned int __data_end;
extern unsigned int __bss_start;
extern unsigned int __bss_end;
extern unsigned int __data_load_addr;
extern unsigned int __bss_size;
extern unsigned int __data_size;

extern int main(void);

void custom_memset(void* dst, int value, unsigned int len){
    unsigned char* d = (unsigned char*) dst;
    
    for(int i = 0; i < len; i++){
        *d++ = value;
    }
}

void custom_memcpy(void* dst, void* src, unsigned int len){
    unsigned char* d = (unsigned char*) dst;
    unsigned char* s = (unsigned char*) src;
    for(int i = 0; i < len; i++){
        *d++ = *s++;
    }

}


void _start(void){
    // Zero out the .bss section
    custom_memset(&__bss_start, 0, __bss_size);

    custom_memcpy(&__data_start, &__data_load_addr, __data_size);

    main();

    while(1); // Should never reach here :)
}