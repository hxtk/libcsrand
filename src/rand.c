#include <stdlib.h>
#include <stdint.h>

int rand(void) {
	uint64_t result;
	asm (
		"rdrand %%rax\n"
		"movq %%rax, %0"
		: "=rm" (result)
	);

	return (int) (result % ((uint64_t) (RAND_MAX) + 1));
}
