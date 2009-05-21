#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fsgelsx_(int* m, int* n, int* nrhs, float* a, int* lda, float* b, int* ldb, int* jpvt, float* rcond, int* rank, float* work, int* info)
{
	lapack_sgelsx(*m, *n, *nrhs, a, *lda, b, *ldb, jpvt, *rcond, rank, work, info);
}
