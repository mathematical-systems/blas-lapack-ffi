#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fdorgqr_(int* m, int* n, int* k, double* a, int* lda, double* tau, double* work, int* lwork, int* info)
{
	lapack_dorgqr(*m, *n, *k, a, *lda, tau, work, *lwork, info);
}
