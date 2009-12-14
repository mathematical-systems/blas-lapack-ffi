#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fzggglm_(int* n, int* m, int* p, void* a, int* lda, void* b, int* ldb, void* d, void* x, void* y, void* work, int* lwork, int* info)
{
	lapack_zggglm(*n, *m, *p, a, *lda, b, *ldb, d, x, y, work, *lwork, info);
}
