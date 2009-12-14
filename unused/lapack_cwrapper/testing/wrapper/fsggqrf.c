#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fsggqrf_(int* n, int* m, int* p, float* a, int* lda, float* taua, float* b, int* ldb, float* taub, float* work, int* lwork, int* info)
{
	lapack_sggqrf(*n, *m, *p, a, *lda, taua, b, *ldb, taub, work, *lwork, info);
}
