#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fsggglm_(int* n, int* m, int* p, float* a, int* lda, float* b, int* ldb, float* d, float* x, float* y, float* work, int* lwork, int* info)
{
	lapack_sggglm(*n, *m, *p, a, *lda, b, *ldb, d, x, y, work, *lwork, info);
}
