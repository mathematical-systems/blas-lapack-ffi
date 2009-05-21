#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fcgesc2_(int* n, void* a, int* lda, void* rhs, int* ipiv, int* jpiv, float* scale)
{
	lapack_cgesc2(*n, a, *lda, rhs, ipiv, jpiv, scale);
}
