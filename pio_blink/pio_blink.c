#include <stdio.h>
#include "pico/stdlib.h"
#include "hardware/pio.h"
#include "hardware/clocks.h"
#include "blink.pio.h"

const uint LED_PIN1 = 6;
const uint LED_PIN2 = 8;
const uint LED_PIN3 = 11;

#define SLEEP_TIME 50

void blink_pin_forever(PIO pio, uint sm, uint offset, uint pin, uint freq);

int main() {
	int i = 0;

	setup_default_uart();

	PIO pio = pio0;
	uint offset = pio_add_program(pio, &blink_program);
	printf("Loaded program at %d\n", offset);

	blink_pin_forever(pio, 0, offset, LED_PIN1, 5);
	sleep_ms(SLEEP_TIME);
	blink_pin_forever(pio, 1, offset, LED_PIN2, 5);
	sleep_ms(SLEEP_TIME);
	blink_pin_forever(pio, 2, offset, LED_PIN3, 5);
	while(1) {
		i++;
		printf("Busy counting away i = %d\n",i);
	}
}

void blink_pin_forever(PIO pio, uint sm, uint offset, uint pin, uint freq) {
	blink_program_init(pio, sm, offset, pin, 65104.17f);
	pio_sm_set_enabled(pio, sm, true);

	printf("Blinkin pin %d at %d Hz\n", pin, freq);
	pio->txf[sm] = clock_get_hz(clk_sys) / freq / 65536;
}