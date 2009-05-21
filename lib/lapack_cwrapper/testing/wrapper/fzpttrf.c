#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fzpttrf_(int* n, double* d, void* e, int* info)
{
	lapack_zpttrf(*n, d, e, info);
}
