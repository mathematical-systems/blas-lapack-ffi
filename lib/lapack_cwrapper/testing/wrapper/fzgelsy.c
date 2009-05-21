#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fzgelsy_(int* m, int* n, int* nrhs, void* a, int* lda, void* b, int* ldb, int* jpvt, double* rcond, int* rank, void* work, int* lwork, double* rwork, int* info)
{
	lapack_zgelsy(*m, *n, *nrhs, a, *lda, b, *ldb, jpvt, *rcond, rank, work, *lwork, rwork, info);
}
