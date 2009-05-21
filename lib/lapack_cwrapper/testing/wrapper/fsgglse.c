#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fsgglse_(int* m, int* n, int* p, float* a, int* lda, float* b, int* ldb, float* c, float* d, float* x, float* work, int* lwork, int* info)
{
	lapack_sgglse(*m, *n, *p, a, *lda, b, *ldb, c, d, x, work, *lwork, info);
}
