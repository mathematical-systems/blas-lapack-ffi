#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fsgetri_(int* n, float* a, int* lda, int* ipiv, float* work, int* lwork, int* info)
{
	lapack_sgetri(*n, a, *lda, ipiv, work, *lwork, info);
}
