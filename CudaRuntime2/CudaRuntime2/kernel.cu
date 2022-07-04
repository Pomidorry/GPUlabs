#include <stdio.h>

#include <locale.h>

#include <stdlib.h>

#include <cuda_runtime.h>

#include "device_launch_parameters.h"

#include<iostream>

#include<cmath>
using namespace std;


__global__ void calc(double* a, int n) {

	int idx = blockIdx.x * blockDim.x + threadIdx.x;

	double val = a[idx];

	if (idx < n) {

		a[idx] = sqrt(1 - val * val);

	}

}

int main() {


	double* a_h; 

	double* a_d;

	const int numSteps = 10000000; 

	a_h = (double*)malloc(sizeof(double) * numSteps);

	cudaMalloc((void**)&a_d, sizeof(double) * numSteps); 

	int blockSize = 192;

	int blocks = numSteps / blockSize + (numSteps % blockSize == 0 ? 0 : 1);

	double left = 0.0;

	double right = 1.0;

	double step = (right - left) / numSteps;

	int i = 0;

	for (double x = left + 0.5 * step; x < right; x += step) {

		a_h[i] = x;

		i++;

	}

	cudaMemcpy(a_d, a_h, sizeof(double) * numSteps, cudaMemcpyHostToDevice);


	calc << < blocks, blockSize >> > (a_d, numSteps);

	cudaMemcpy(a_h, a_d, sizeof(double) * numSteps, cudaMemcpyDeviceToHost); 

	double sum = 0.0;

	for (int i = 0; i < numSteps; i++) {

		sum += a_h[i];

	}

	

	cout<<"PI="<< 4 * sum / numSteps;



	system("pause");

	free(a_h);

	cudaFree(a_d);


}