#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fsggrqf_(int* m, int* p, int* n, float* a, int* lda, float* taua, float* b, int* ldb, float* taub, float* work, int* lwork, int* info)
{
	lapack_sggrqf(*m, *p, *n, a, *lda, taua, b, *ldb, taub, work, *lwork, info);
}
