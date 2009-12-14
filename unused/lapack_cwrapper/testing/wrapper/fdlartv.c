#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fdlartv_(int* n, double* x, int* incx, double* y, int* incy, double* c, double* s, int* incc)
{
	lapack_dlartv(*n, x, *incx, y, *incy, c, s, *incc);
}
