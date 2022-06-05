#include <stdio.h>

int main(int argc, char** argv) {
	int result = fn(argc, argv);
	if (result != argc+1) {
		fprintf(stderr, "Error. function did not increment argc by 1\n");
	}
	return result-argc-1;
}
