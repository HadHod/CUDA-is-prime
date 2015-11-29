__global__
void is_prime(bool isPrime, int number) {
    const unsigned int tid = blockIdx.x * blockDim.x + threadIdx.x;

    if (tid == 1) {
        isPrime = true;
    }

    __syncthreads();

}
