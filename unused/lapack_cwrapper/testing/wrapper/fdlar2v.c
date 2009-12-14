#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fdlar2v_(int* n, double* x, double* y, double* z, int* incx, double* c, double* s, int* incc)
{
	lapack_dlar2v(*n, x, y, z, *incx, c, s, *incc);
}
