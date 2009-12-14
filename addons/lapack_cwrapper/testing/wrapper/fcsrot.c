#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fcsrot_(int* n, void* cx, int* incx, void* cy, int* incy, float* c, float* s)
{
	lapack_csrot(*n, cx, *incx, cy, *incy, *c, *s);
}
