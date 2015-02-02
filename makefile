ARGS = 4

all:
	nvcc main.cu -Xcompiler -fopenmp -lgomp -lrt -o main

run:
	./main $(ARGS)

clear:
	rm main