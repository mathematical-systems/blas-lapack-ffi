#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fsgelss_(int* m, int* n, int* nrhs, float* a, int* lda, float* b, int* ldb, float* s, float* rcond, int* rank, float* work, int* lwork, int* info)
{
	lapack_sgelss(*m, *n, *nrhs, a, *lda, b, *ldb, s, *rcond, rank, work, *lwork, info);
}
