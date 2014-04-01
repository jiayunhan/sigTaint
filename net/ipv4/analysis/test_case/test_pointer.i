# 1 "test_pointer.c"
# 1 "<command-line>"
# 1 "test_pointer.c"
int main(){
 int *p,i=100,j=1,*q,*r;
 p=&j;
 q=&i;
 r=p;
 r=q;
 return 0;
}
