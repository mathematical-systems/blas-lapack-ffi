#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fdgglse_(int* m, int* n, int* p, double* a, int* lda, double* b, int* ldb, double* c, double* d, double* x, double* work, int* lwork, int* info)
{
	lapack_dgglse(*m, *n, *p, a, *lda, b, *ldb, c, d, x, work, *lwork, info);
}
