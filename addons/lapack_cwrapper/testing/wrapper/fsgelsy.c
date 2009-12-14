#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fsgelsy_(int* m, int* n, int* nrhs, float* a, int* lda, float* b, int* ldb, int* jpvt, float* rcond, int* rank, float* work, int* lwork, int* info)
{
	lapack_sgelsy(*m, *n, *nrhs, a, *lda, b, *ldb, jpvt, *rcond, rank, work, *lwork, info);
}
