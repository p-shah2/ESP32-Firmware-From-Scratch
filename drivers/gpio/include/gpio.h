#pragma once 

/*
    Public APIs for GPIO pin config:
        - i/o mode 
        - set
        - get
        - toggle
*/
typedef enum{
    GPIO_OUTPUT,
    GPIO_INPUT
} gpio_mode_t;

void gpio_set_direction(uint8_t gpio_num, gpio_mode_t mode);
void gpio_set_pin_level(uint8_t gpio_num);
void gpio_clear_pin_level(uint8_t gpio_num);
uint8_t gpio_get_pin_level(uint8_t gpio_num);
void gpio_toggle_pin_level(uint8_t gpio_num);


