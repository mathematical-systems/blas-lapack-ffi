#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fdlapll_(int* n, double* x, int* incx, double* y, int* incy, double* ssmin)
{
	lapack_dlapll(*n, x, *incx, y, *incy, ssmin);
}
