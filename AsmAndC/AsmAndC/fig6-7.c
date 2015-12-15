// C code to test assembly for 3*x+7*y (fig7.sp.asm)

#include <stdio.h>

extern int fctn1(int, int);

int main(int argc, const char * argv[]){
	int number1;
	int number2;
	int result;

	printf("Enter the first number: ");
	scanf_s("%d", &number1);
	printf("Enter the second number: ");
	scanf_s("%d", &number2);
	
	result = fctn1(number1, number2);
	printf("Result: %d\n", result);

	getchar();		/*type any character to terminate the program*/
	
	return 0;
}