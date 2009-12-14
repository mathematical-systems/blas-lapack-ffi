#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fcggqrf_(int* n, int* m, int* p, void* a, int* lda, void* taua, void* b, int* ldb, void* taub, void* work, int* lwork, int* info)
{
	lapack_cggqrf(*n, *m, *p, a, *lda, taua, b, *ldb, taub, work, *lwork, info);
}
