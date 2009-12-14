#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fclargv_(int* n, void* x, int* incx, void* y, int* incy, float* c, int* incc)
{
	lapack_clargv(*n, x, *incx, y, *incy, c, *incc);
}
