#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fzlassq_(int* n, void* x, int* incx, double* scale, double* sumsq)
{
	lapack_zlassq(*n, x, *incx, scale, sumsq);
}
