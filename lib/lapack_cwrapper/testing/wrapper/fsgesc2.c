#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fsgesc2_(int* n, float* a, int* lda, float* rhs, int* ipiv, int* jpiv, float* scale)
{
	lapack_sgesc2(*n, a, *lda, rhs, ipiv, jpiv, scale);
}
