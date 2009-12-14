#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fcggglm_(int* n, int* m, int* p, void* a, int* lda, void* b, int* ldb, void* d, void* x, void* y, void* work, int* lwork, int* info)
{
	lapack_cggglm(*n, *m, *p, a, *lda, b, *ldb, d, x, y, work, *lwork, info);
}
