#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fzgelsd_(int* m, int* n, int* nrhs, void* a, int* lda, void* b, int* ldb, double* s, double* rcond, int* rank, void* work, int* lwork, double* rwork, int* iwork, int* info)
{
	lapack_zgelsd(*m, *n, *nrhs, a, *lda, b, *ldb, s, *rcond, rank, work, *lwork, rwork, iwork, info);
}
