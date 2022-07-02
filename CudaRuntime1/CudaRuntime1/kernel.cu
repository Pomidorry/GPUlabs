
#include "cuda_runtime.h"
#include "device_launch_parameters.h"
#include<iostream>
#include <stdio.h>
using namespace std;
__global__ void ab(int a, int b, int* c) {
	*c = a + b;
}
__global__ void Enter()
{
	printf("Enter 2 numbers\n");
}
int main() {
	int a, b;
	Enter << <1, 1 >> > ();
	cin >> a >> b;
	int c;
	int* c1;
	cudaMalloc((void**)&c1, sizeof(int));
	ab << <1, 1 >> > (a, b, c1);
	cudaMemcpy(&c, c1, sizeof(int), cudaMemcpyKind::cudaMemcpyDeviceToHost);
	cout << c;
	return 0;
}