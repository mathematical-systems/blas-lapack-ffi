#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fsgttrf_(int* n, float* dl, float* d, float* du, float* du2, int* ipiv, int* info)
{
	lapack_sgttrf(*n, dl, d, du, du2, ipiv, info);
}
