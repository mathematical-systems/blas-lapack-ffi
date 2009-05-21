#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fdorg2r_(int* m, int* n, int* k, double* a, int* lda, double* tau, double* work, int* info)
{
	lapack_dorg2r(*m, *n, *k, a, *lda, tau, work, info);
}
