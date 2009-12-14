#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fslar2v_(int* n, float* x, float* y, float* z, int* incx, float* c, float* s, int* incc)
{
	lapack_slar2v(*n, x, y, z, *incx, c, s, *incc);
}
