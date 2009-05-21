#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fzgesc2_(int* n, void* a, int* lda, void* rhs, int* ipiv, int* jpiv, double* scale)
{
	lapack_zgesc2(*n, a, *lda, rhs, ipiv, jpiv, scale);
}
