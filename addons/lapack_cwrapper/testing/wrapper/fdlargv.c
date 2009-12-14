#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fdlargv_(int* n, double* x, int* incx, double* y, int* incy, double* c, int* incc)
{
	lapack_dlargv(*n, x, *incx, y, *incy, c, *incc);
}
