#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fcgelsx_(int* m, int* n, int* nrhs, void* a, int* lda, void* b, int* ldb, int* jpvt, float* rcond, int* rank, void* work, float* rwork, int* info)
{
	lapack_cgelsx(*m, *n, *nrhs, a, *lda, b, *ldb, jpvt, *rcond, rank, work, rwork, info);
}
