#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fslartv_(int* n, float* x, int* incx, float* y, int* incy, float* c, float* s, int* incc)
{
	lapack_slartv(*n, x, *incx, y, *incy, c, s, *incc);
}
