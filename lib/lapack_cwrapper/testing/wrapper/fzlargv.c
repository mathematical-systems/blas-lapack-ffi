#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fzlargv_(int* n, void* x, int* incx, void* y, int* incy, double* c, int* incc)
{
	lapack_zlargv(*n, x, *incx, y, *incy, c, *incc);
}
