#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fclartv_(int* n, void* x, int* incx, void* y, int* incy, float* c, void* s, int* incc)
{
	lapack_clartv(*n, x, *incx, y, *incy, c, s, *incc);
}
