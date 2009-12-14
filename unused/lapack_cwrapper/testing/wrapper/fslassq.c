#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fslassq_(int* n, float* x, int* incx, float* scale, float* sumsq)
{
	lapack_slassq(*n, x, *incx, scale, sumsq);
}
