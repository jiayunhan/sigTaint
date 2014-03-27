#include <stdio.h>
#include <stdlib.h>
struct sock{
	int* array;
	int b;
	char c;
};
void recv(struct sock* socket){
	socket->b=0;
	socket->c='c';
}
int main()
{
	struct sock* socket=(struct sock*)malloc(sizeof(struct sock*));
	socket->array = (int *)malloc(sizeof(int[10]));
	recv(socket);
	return 0;
}

	
