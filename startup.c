// @author: Priyanka Shah
// @date: Apr 17, 2025
#include <string.h>
#include <stdint.h>

extern unsigned int _sbss, _ebss, _sidata, _sdata, _edata;
extern int main(void);

void call_start_cpu0() {

    memset(&_sbss, 0, (&_ebss - &_sbss) * sizeof(_sbss));
    memmove(&_sdata, &_sidata, (&_edata - &_sdata) * sizeof(_sdata));

    main();

    while(1); // Should never reach here :)
}