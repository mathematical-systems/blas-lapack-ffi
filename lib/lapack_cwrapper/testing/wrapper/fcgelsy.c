#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fcgelsy_(int* m, int* n, int* nrhs, void* a, int* lda, void* b, int* ldb, int* jpvt, float* rcond, int* rank, void* work, int* lwork, float* rwork, int* info)
{
	lapack_cgelsy(*m, *n, *nrhs, a, *lda, b, *ldb, jpvt, *rcond, rank, work, *lwork, rwork, info);
}
