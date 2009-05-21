#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fdgesv_(int* n, int* nrhs, double* a, int* lda, int* ipiv, double* b, int* ldb, int* info)
{
	lapack_dgesv(*n, *nrhs, a, *lda, ipiv, b, *ldb, info);
}
