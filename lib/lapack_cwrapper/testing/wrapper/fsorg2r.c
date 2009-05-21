#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fsorg2r_(int* m, int* n, int* k, float* a, int* lda, float* tau, float* work, int* info)
{
	lapack_sorg2r(*m, *n, *k, a, *lda, tau, work, info);
}
