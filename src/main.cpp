/**
 * main module
 *
 * @author Viacheslav Lotsmanov
 * @license GNU/AGPLv3
 * @see {@link https://www.gnu.org/licenses/agpl-3.0.txt|License}
 */

#include "gpio.hpp"

volatile unsigned int *gpio;

int main(void)
{
	gpio = (unsigned int *)GPIO_BASE;
	gpio[GPIO_GPFSEL1] |= (1 << 16);
	gpio[GPIO_GPCLR0] = (1 << 16);

	while (1)
	{
	}
}

extern "C"
int _start(void)
{
	main();
}
