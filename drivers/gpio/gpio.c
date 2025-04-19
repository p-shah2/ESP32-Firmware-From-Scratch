#include <stdint.h>
#include "gpio_private.h"
#include "gpio.h"

void gpio_set_direction(uint8_t gpio_num, gpio_mode_t mode){
    if(gpio_num < 32){
        if(mode == GPIO_OUTPUT){
            GPIO_ENABLE_REG |= (1 << gpio_num);
        }
        else{
            GPIO_ENABLE_REG &= ~(1 << gpio_num);
        }
    }
    else if (gpio_num <= 39){
        if(mode == GPIO_OUTPUT){
            GPIO_ENABLE1_REG |= (1 << (gpio_num - 32));
        }
        else{
            GPIO_ENABLE1_REG &= ~(1 << (gpio_num - 32));
        }
    }
}

void gpio_set_pin_level(uint8_t gpio_num){
    if(gpio_num < 32){
        GPIO_OUT_REG |= (1 << gpio_num);
    }
    else if (gpio_num <= 39){
        GPIO_OUT1_REG |= (1 << (gpio_num - 32));
    }
}


void gpio_clear_pin_level(uint8_t gpio_num){
    if(gpio_num < 32){
        GPIO_OUT_REG &= ~(1 << gpio_num);
    }
    else if (gpio_num <= 39){
        GPIO_OUT1_REG &= ~(1 << (gpio_num - 32));
    }
}

uint8_t gpio_get_pin_level(uint8_t gpio_num){
    uint8_t read_pin_level = 0;

    if(gpio_num < 32){
        read_pin_level = (GPIO_OUT_REG >> gpio_num) & 1;
    }
    else if (gpio_num <= 39){
        read_pin_level = (GPIO_OUT1_REG >> (gpio_num - 32)) & 1;
    }
    return read_pin_level;
}

void gpio_toggle_pin_level(uint8_t gpio_num){
    if(gpio_num < 32){
        GPIO_OUT_REG ^= (1 << gpio_num);
    }
    else if (gpio_num <= 39){
        GPIO_OUT1_REG ^= (1 << (gpio_num - 32));
    }

}
