#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fclaswp_(int* n, void* a, int* lda, int* k1, int* k2, int* ipiv, int* incx)
{
	lapack_claswp(*n, a, *lda, *k1, *k2, ipiv, *incx);
}
