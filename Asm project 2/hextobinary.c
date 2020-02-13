#include <stdio.h>
#include <stdlib.h>

int divid(int x, int y)
{
    int t = x/y;
    return t;
}

int main(int argc, char const *argv[])
{
    int number = atoi(argv[1]), num2=atoi(argv[2]);
    number=divid(number, num2);
    printf("%d\n", number);
    return 0;
}
