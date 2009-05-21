#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fzlacrt_(int* n, void* cx, int* incx, void* cy, int* incy, void* c, void* s)
{
	lapack_zlacrt(*n, cx, *incx, cy, *incy, c, s);
}
