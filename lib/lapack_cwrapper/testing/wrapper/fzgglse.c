#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fzgglse_(int* m, int* n, int* p, void* a, int* lda, void* b, int* ldb, void* c, void* d, void* x, void* work, int* lwork, int* info)
{
	lapack_zgglse(*m, *n, *p, a, *lda, b, *ldb, c, d, x, work, *lwork, info);
}
