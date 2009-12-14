#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fdorgr2_(int* m, int* n, int* k, double* a, int* lda, double* tau, double* work, int* info)
{
	lapack_dorgr2(*m, *n, *k, a, *lda, tau, work, info);
}
