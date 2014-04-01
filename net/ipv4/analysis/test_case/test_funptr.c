#include <stdio.h>
int my_int_func(int x)
{
	printf("%d\n",x);
}
int main(){
	int  (*foo)(int);
	foo = &my_int_func;
	(foo)(2);
	return 0;
}
