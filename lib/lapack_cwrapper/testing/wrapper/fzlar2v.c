#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fzlar2v_(int* n, void* x, void* y, void* z, int* incx, double* c, void* s, int* incc)
{
	lapack_zlar2v(*n, x, y, z, *incx, c, s, *incc);
}
