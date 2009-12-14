#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fsgetrf_(int* m, int* n, float* a, int* lda, int* ipiv, int* info)
{
	lapack_sgetrf(*m, *n, a, *lda, ipiv, info);
}
