#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fslargv_(int* n, float* x, int* incx, float* y, int* incy, float* c, int* incc)
{
	lapack_slargv(*n, x, *incx, y, *incy, c, *incc);
}
