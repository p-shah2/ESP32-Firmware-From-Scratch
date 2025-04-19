// @author: Priyanka Shah
// @date: Apr 17, 2025

#include <stdint.h>

#define GPIO_OUT_REG_ADDR       0x3FF44004 // 1 for enabled output
#define GPIO_ENABLE_REG_ADDR    0x3FF44020


#define GPIO_OUT_REG           (*(volatile uint32_t *)GPIO_OUT_REG_ADDR)
#define GPIO_ENABLE_REG        (*(volatile uint32_t *)GPIO_ENABLE_REG_ADDR)

#define UART0_FIFO_REG 0x3FF40078


void delay(volatile int count) {
    while (count--) {
        __asm__ volatile ("nop");
    }
}



int main(void){
    
    GPIO_ENABLE_REG |= (1 << 2);
    while (1){
       GPIO_OUT_REG|= (1 << 2);
      delay(1000000);

      GPIO_OUT_REG &= ~(1 << 2);
      delay(1000000);
    }

    return 0;
}
