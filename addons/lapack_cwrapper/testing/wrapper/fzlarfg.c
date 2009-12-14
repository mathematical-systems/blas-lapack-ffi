#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fzlarfg_(int* n, void* alpha, void* x, int* incx, void* tau)
{
	lapack_zlarfg(*n, alpha, x, *incx, tau);
}
