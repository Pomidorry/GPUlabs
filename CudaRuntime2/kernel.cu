#include "cuda_runtime.h"
#include "device_launch_parameters.h"
#include<iostream>
#include <stdio.h>
using namespace std;

int main() {
	cudaDeviceProp deviceProp;
	cudaGetDeviceProperties(&deviceProp, 0);
	cout<<"Device name"<<" "<<deviceProp.name<<endl;
	cout<<"Total global memory :  MB"<<" "<<deviceProp.totalGlobalMem / 1024 / 1024<<endl;
	cout<<"Shared memory per block : "<<deviceProp.sharedMemPerBlock<<endl;
	cout<<"Registers per block :"<<deviceProp.regsPerBlock<<endl;
	cout<<"Warp size :"<< deviceProp.warpSize<<endl;
	cout<<"Memory pitch :"<< deviceProp.memPitch<<endl;
	cout<<"Max threads per block :"<<deviceProp.maxThreadsPerBlock<<endl;
	printf("Max threads dimensions : x = %d, y = %d, z = % d\n", deviceProp.maxThreadsDim[0], deviceProp.maxThreadsDim[1],deviceProp.maxThreadsDim[2]);
	printf("Max grid size: x = %d, y = %d, z = %d\n",
		deviceProp.maxGridSize[0], deviceProp.maxGridSize[1],
		deviceProp.maxGridSize[2]);
	cout<<"Clock rate: "<<deviceProp.clockRate<<endl;
	cout<<"Total constant memory:"<<deviceProp.totalConstMem<<endl;
	printf("Compute capability: %d.%d\n",
		deviceProp.major, deviceProp.minor);
	cout<<"Texture alignment: "<<deviceProp.textureAlignment<<endl;
	cout<<"Device overlap:"<<" "<<deviceProp.deviceOverlap<<endl;
	cout<<"Multiprocessor count: "<<deviceProp.multiProcessorCount<<endl;
		cout<<"Kernel execution timeout enabled:"<<deviceProp.kernelExecTimeoutEnabled ? "true" :"false";

}