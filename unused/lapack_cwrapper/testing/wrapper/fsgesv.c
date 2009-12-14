#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fsgesv_(int* n, int* nrhs, float* a, int* lda, int* ipiv, float* b, int* ldb, int* info)
{
	lapack_sgesv(*n, *nrhs, a, *lda, ipiv, b, *ldb, info);
}
