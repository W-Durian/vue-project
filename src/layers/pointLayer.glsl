#include <stdio.h>

#define PI 3.14159


int sum;
int s = 1 | 2 | 3;

int add(int a, int b);

int main() {
  int num1, num2, num3;
  printf("Enter three numbers: ");
  scanf("%d %d %d");
  sum = add(num1, num2);

  // 输出结果
  printf("Sum: %d\n", sum);

  return 0;        // 返回
}

int add(int a, int b) {
  return a + b;
}
