#include <stdio.h>
int main()
{
	int arr[2]={0,1};
	int i=10;
	/*alias i to arr[2].*/
	arr[2]=20;
	printf("element 0:%d\t\n",arr[0]);
	printf("element 1:%d\t\n",arr[1]);
	printf("element 2:%d\t\n",arr[2]);
	printf("i:%d\t\t\n",i);
	printf("array size:%d\t\n",sizeof(arr)/sizeof(int));
}
