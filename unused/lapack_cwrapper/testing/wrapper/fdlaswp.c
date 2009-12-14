#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fdlaswp_(int* n, double* a, int* lda, int* k1, int* k2, int* ipiv, int* incx)
{
	lapack_dlaswp(*n, a, *lda, *k1, *k2, ipiv, *incx);
}
