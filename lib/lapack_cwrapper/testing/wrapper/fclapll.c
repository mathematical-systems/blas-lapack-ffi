#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fclapll_(int* n, void* x, int* incx, void* y, int* incy, float* ssmin)
{
	lapack_clapll(*n, x, *incx, y, *incy, ssmin);
}
