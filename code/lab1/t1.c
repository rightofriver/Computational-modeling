#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#define len 10000
int main()
{   
    long int num = 0;
    srand((unsigned)time(NULL));
    for(int i = 1;i <= len;i++)
    {
        for(int j = 1;j <= len;j++)
        {
            float x = rand()/(RAND_MAX+1.0) * 2 - 1;
            float y = rand()/(RAND_MAX+1.0) * 2 - 1;
            if(x * x + y * y <= 1)
            {
                num++;
            }
        }
    }
    float pi = num / (float)(len * len);
    printf("pi=%f",pi * 4);
    return 0;
}
