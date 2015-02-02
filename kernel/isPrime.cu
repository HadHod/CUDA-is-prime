__global__
void isPrime(bool isPrime, int number) {
    const unsigned int tid = blockIdx.x * blockDim.x + threadIdx.x;

    if (tid == 1) {
        isPrime = true;
    }

    __syncthreads();

}