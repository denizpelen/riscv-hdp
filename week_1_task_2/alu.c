#include <stdio.h>
#include <stdint.h>

int alu(int op1,int op2,char operation){
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
    int op1, op2;
    char operation;
	int result = 0;
    
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
