#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fdggqrf_(int* n, int* m, int* p, double* a, int* lda, double* taua, double* b, int* ldb, double* taub, double* work, int* lwork, int* info)
{
	lapack_dggqrf(*n, *m, *p, a, *lda, taua, b, *ldb, taub, work, *lwork, info);
}
