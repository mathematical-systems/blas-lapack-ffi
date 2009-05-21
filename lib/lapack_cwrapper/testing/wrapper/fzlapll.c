#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fzlapll_(int* n, void* x, int* incx, void* y, int* incy, double* ssmin)
{
	lapack_zlapll(*n, x, *incx, y, *incy, ssmin);
}
