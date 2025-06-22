#include "rcc_driver.h"
#include "rcc_clk_cfg.h"
#include "gpio_driver.h"

void delay_blocking_ms(uint32_t delay_ms)
{
  uint32_t start = ticks;
  while(ticks - start < delay_ms);
}

void config_pin_to_led(GPIO_t *pgpio, gpio_pin_t pin)
{
  //LED
  GPIO_PinConfig_t led_cfg;
  led_cfg.mode = MODE_OUT_2MHz;
  led_cfg.sub_mode = SUBMODE_OUT_GP_PP;

  //configure gpio pins
  gpio_clk_enable(pgpio);
  gpio_set_mode(pgpio, pin, &led_cfg);
}

int main(void) 
{

  /*System timer config*/
  rcc_cfg_systick(TICK_PERIOD_MS);
  config_pin_to_led(GPIOA, 5);
  
  while(1)
  {
   gpio_toggle_pin(GPIOA,5);
   delay_blocking_ms(5000);
  }

  return 0;
}