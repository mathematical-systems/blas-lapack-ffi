#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fdorgql_(int* m, int* n, int* k, double* a, int* lda, double* tau, double* work, int* lwork, int* info)
{
	lapack_dorgql(*m, *n, *k, a, *lda, tau, work, *lwork, info);
}
