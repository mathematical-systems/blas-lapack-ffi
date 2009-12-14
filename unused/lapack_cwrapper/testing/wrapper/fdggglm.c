#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fdggglm_(int* n, int* m, int* p, double* a, int* lda, double* b, int* ldb, double* d, double* x, double* y, double* work, int* lwork, int* info)
{
	lapack_dggglm(*n, *m, *p, a, *lda, b, *ldb, d, x, y, work, *lwork, info);
}
