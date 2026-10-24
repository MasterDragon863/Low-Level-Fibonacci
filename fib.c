#include <stdio.h>
#include <stdint.h>

int main(void)
{
	int count;

	(void)scanf("%d", &count);

	uint64_t num1 = 0;
	uint64_t num2 = 1;
	uint64_t swap;
	while (count > 0) {
		swap = num2;
		num2 += num1;
		num1 = swap;
		count--;
	}

	printf("The fibonacci number  is %lu\n", num1);
	
	return 0;
}
