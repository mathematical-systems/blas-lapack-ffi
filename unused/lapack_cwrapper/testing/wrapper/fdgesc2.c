#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fdgesc2_(int* n, double* a, int* lda, double* rhs, int* ipiv, int* jpiv, double* scale)
{
	lapack_dgesc2(*n, a, *lda, rhs, ipiv, jpiv, scale);
}
