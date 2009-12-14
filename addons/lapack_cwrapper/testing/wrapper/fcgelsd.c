#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fcgelsd_(int* m, int* n, int* nrhs, void* a, int* lda, void* b, int* ldb, float* s, float* rcond, int* rank, void* work, int* lwork, float* rwork, int* iwork, int* info)
{
	lapack_cgelsd(*m, *n, *nrhs, a, *lda, b, *ldb, s, *rcond, rank, work, *lwork, rwork, iwork, info);
}
