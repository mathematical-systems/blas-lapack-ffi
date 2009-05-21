#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fcggrqf_(int* m, int* p, int* n, void* a, int* lda, void* taua, void* b, int* ldb, void* taub, void* work, int* lwork, int* info)
{
	lapack_cggrqf(*m, *p, *n, a, *lda, taua, b, *ldb, taub, work, *lwork, info);
}
