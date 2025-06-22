#include "typedefs.h"

volatile uint32_t global_counter = 0;
const uint32_t cnt_period = 1000;

void update_counter(void)
{
    static uint32_t counter = 0;
    counter++;
    if(counter == cnt_period)
    {
        global_counter++;
        counter = 0;
    }

}

void main(void)
{
    while(1)
    {
        update_counter();
    }
}