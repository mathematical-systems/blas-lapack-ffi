#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fclarfg_(int* n, void* alpha, void* x, int* incx, void* tau)
{
	lapack_clarfg(*n, alpha, x, *incx, tau);
}
