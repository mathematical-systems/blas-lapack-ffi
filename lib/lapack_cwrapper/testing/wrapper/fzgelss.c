#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fzgelss_(int* m, int* n, int* nrhs, void* a, int* lda, void* b, int* ldb, double* s, double* rcond, int* rank, void* work, int* lwork, double* rwork, int* info)
{
	lapack_zgelss(*m, *n, *nrhs, a, *lda, b, *ldb, s, *rcond, rank, work, *lwork, rwork, info);
}
