#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fzdrot_(int* n, void* cx, int* incx, void* cy, int* incy, double* c, double* s)
{
	lapack_zdrot(*n, cx, *incx, cy, *incy, *c, *s);
}
