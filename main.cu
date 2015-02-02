#include <iostream>

#include "kernel/isPrime.cu"

using namespace std;

int main(int argc, char* argv[]) {

    if (argc != 2) {
        cout << "Pass 1 integer" << endl;
        return EXIT_FAILURE;
    }

    int number = atoi(argv[1]);
    int* dev_number;

    bool* result;
    bool* dev_result;

    cudaMalloc((void**) &dev_result, sizeof(bool));
    cudaMalloc((void**) &dev_number, sizeof(int));

    cudaMemcpy(dev_number, number, sizeof(int), cudaMemcpyHostToDevice);

    dim3 dimGrid(number / 4, 1, 1);
    dim3 dimBlock(4, 1, 1);
    isPrime<<<dimGrid, dimBlock>>>(dev_result, number);

    cudaDeviceSynchronize();

    cudaMemcpy(result, dev_result, sizeof(bool), cudaMemcpyDeviceToHost);

    cudaFree(dev_result);
    cudaFree(dev_number);

    return EXIT_SUCCESS;
}