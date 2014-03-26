#include <stdio.h>
#include <stdint.h>
uint32_t swap_words(uint32_t arg);
int main()
{
	uint32_t u=101010;
	//uint32_t result=swap_words(u);
	uint32_t result=u;
	printf("result=%ld\n",result);
	return 0;
}
uint32_t swap_words(uint32_t arg)
{
	uint16_t* const sp = (uint16_t*)&arg;
	uint16_t hi=sp[0];
	uint16_t lo=sp[1];
	sp[1]=hi;
	sp[0]=lo;
	return (arg);
}
