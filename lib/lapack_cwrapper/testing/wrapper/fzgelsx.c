#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fzgelsx_(int* m, int* n, int* nrhs, void* a, int* lda, void* b, int* ldb, int* jpvt, double* rcond, int* rank, void* work, double* rwork, int* info)
{
	lapack_zgelsx(*m, *n, *nrhs, a, *lda, b, *ldb, jpvt, *rcond, rank, work, rwork, info);
}
