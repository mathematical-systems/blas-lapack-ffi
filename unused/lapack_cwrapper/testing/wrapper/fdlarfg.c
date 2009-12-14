#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fdlarfg_(int* n, double* alpha, double* x, int* incx, double* tau)
{
	lapack_dlarfg(*n, alpha, x, *incx, tau);
}
