#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fcgesv_(int* n, int* nrhs, void* a, int* lda, int* ipiv, void* b, int* ldb, int* info)
{
	lapack_cgesv(*n, *nrhs, a, *lda, ipiv, b, *ldb, info);
}
