#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fclacrt_(int* n, void* cx, int* incx, void* cy, int* incy, void* c, void* s)
{
	lapack_clacrt(*n, cx, *incx, cy, *incy, c, s);
}
