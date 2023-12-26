#include <stdio.h>
#include <time.h>

void delay(int n) {
    int us = n; // microseconds
    clock_t start_time = clock();
    while (clock() < start_time + (us * CLOCKS_PER_SEC / 1000000));
}

int main()
{
	int count = 0x00000002;
	while (1)
	{
		printf("Count value is: %d\n", count);
		count++;
        count++;
        if(count==16){
            count=2;
        }
		delay(500);   // delay by 0.5 microseconds
	}
}
