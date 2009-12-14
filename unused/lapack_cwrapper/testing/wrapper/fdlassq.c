#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fdlassq_(int* n, double* x, int* incx, double* scale, double* sumsq)
{
	lapack_dlassq(*n, x, *incx, scale, sumsq);
}
