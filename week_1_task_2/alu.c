#include <stdio.h>
#include <stdint.h>

uint8_t alu(uint8_t op1,uint8_t op2,char operation){
	if(operation == '+')
		return op1 + op2;
	else if(operation == '-')
		return op1 - op2;
	else if(operation == '*')
		return op1 * op2;
	else if(operation == '/')
		return op1 / op2;
	else if(operation == '|')
		return op1 | op2;
	else if(operation == '&')
		return op1 & op2;
	else
		return -1;

}

int main() {
    uint8_t op1, op2;
    char operation;
	uint8_t result = 0;
    
	while (1){
		printf("Enter first operant ");
	    scanf("%d", &op1);
		printf("Enter second operant ");
	    scanf("%d", &op2);
	    
	    printf("Enter the operation (+, -, *, /, |, &) ");
	    scanf(" %c", &operation);
	
	    printf("Result: %d\n", alu(op1,op2,operation));
	}
    return 0;
}
