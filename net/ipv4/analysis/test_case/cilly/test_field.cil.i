# 1 "./test_field.cil.c"
# 1 "<command-line>"
# 1 "./test_field.cil.c"
# 213 "/usr/lib/gcc/x86_64-linux-gnu/4.7/include/stddef.h"
typedef unsigned long size_t;
# 3 "test_field.c"
struct sock {
   int *array ;
   int b ;
   char c ;
};
# 471 "/usr/include/stdlib.h"
extern __attribute__((__nothrow__)) void *malloc(size_t __size ) __attribute__((__malloc__)) ;
# 8 "test_field.c"
int recv(struct sock *socket )
{


  {
# 9 "test_field.c"
  socket->b = 0;
# 10 "test_field.c"
  socket->c = (char)100;
# 11 "test_field.c"
  return ((int )socket->c);
}
}
# 13 "test_field.c"
int main(void)
{
  struct sock *socket ;
  void *tmp ;
  void *tmp___0 ;

  {
# 15 "test_field.c"
  tmp = malloc(sizeof(struct sock *));
# 15 "test_field.c"
  socket = (struct sock *)tmp;
# 16 "test_field.c"
  tmp___0 = malloc(sizeof(int [10]));
# 16 "test_field.c"
  socket->array = (int *)tmp___0;
# 17 "test_field.c"
  recv(socket);
# 18 "test_field.c"
  return (0);
}
}
