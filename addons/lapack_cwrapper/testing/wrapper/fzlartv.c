#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fzlartv_(int* n, void* x, int* incx, void* y, int* incy, double* c, void* s, int* incc)
{
	lapack_zlartv(*n, x, *incx, y, *incy, c, s, *incc);
}
