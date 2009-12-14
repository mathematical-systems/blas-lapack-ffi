#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fslapll_(int* n, float* x, int* incx, float* y, int* incy, float* ssmin)
{
	lapack_slapll(*n, x, *incx, y, *incy, ssmin);
}
