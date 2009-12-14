#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fdgttrf_(int* n, double* dl, double* d, double* du, double* du2, int* ipiv, int* info)
{
	lapack_dgttrf(*n, dl, d, du, du2, ipiv, info);
}
