#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fslarfg_(int* n, float* alpha, float* x, int* incx, float* tau)
{
	lapack_slarfg(*n, alpha, x, *incx, tau);
}
