#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fclar2v_(int* n, void* x, void* y, void* z, int* incx, float* c, void* s, int* incc)
{
	lapack_clar2v(*n, x, y, z, *incx, c, s, *incc);
}
