#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fcgttrf_(int* n, void* dl, void* d, void* du, void* du2, int* ipiv, int* info)
{
	lapack_cgttrf(*n, dl, d, du, du2, ipiv, info);
}
