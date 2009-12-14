#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fdggrqf_(int* m, int* p, int* n, double* a, int* lda, double* taua, double* b, int* ldb, double* taub, double* work, int* lwork, int* info)
{
	lapack_dggrqf(*m, *p, *n, a, *lda, taua, b, *ldb, taub, work, *lwork, info);
}
