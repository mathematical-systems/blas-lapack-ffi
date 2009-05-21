#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fzrot_(int* n, void* cx, int* incx, void* cy, int* incy, double* c, void* s)
{
	lapack_zrot(*n, cx, *incx, cy, *incy, *c, s);
}
