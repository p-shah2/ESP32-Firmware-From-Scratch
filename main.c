// @author: Priyanka Shah
// @date: Apr 17, 2025

#include <stdint.h>
#include "gpio.h"

void delay(volatile int count) {
    while (count--) {
        __asm__ volatile ("nop");
    }
}


int main(void){
    uint8_t gpio2 = 2;
    gpio_set_direction(gpio2, GPIO_OUTPUT);
    gpio_set_pin_level(gpio2);
    

    while (1){
      if(gpio_get_pin_level(gpio2) == 1){
        gpio_clear_pin_level(gpio2);
        delay(100000);
        gpio_set_pin_level(gpio2);
        delay(100000);
      }
      else{
        gpio_clear_pin_level(gpio2);
      }
      
      //delay(1000000);
      
    }

    return 0;
}
