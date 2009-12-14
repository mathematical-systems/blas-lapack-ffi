#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fzgesv_(int* n, int* nrhs, void* a, int* lda, int* ipiv, void* b, int* ldb, int* info)
{
	lapack_zgesv(*n, *nrhs, a, *lda, ipiv, b, *ldb, info);
}
