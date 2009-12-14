#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fslaswp_(int* n, float* a, int* lda, int* k1, int* k2, int* ipiv, int* incx)
{
	lapack_slaswp(*n, a, *lda, *k1, *k2, ipiv, *incx);
}
