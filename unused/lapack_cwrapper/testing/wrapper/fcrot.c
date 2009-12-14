#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fcrot_(int* n, void* cx, int* incx, void* cy, int* incy, float* c, void* s)
{
	lapack_crot(*n, cx, *incx, cy, *incy, *c, s);
}
