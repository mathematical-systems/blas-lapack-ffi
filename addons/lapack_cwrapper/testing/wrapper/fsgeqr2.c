#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fsgeqr2_(int* m, int* n, float* a, int* lda, float* tau, float* work, int* info)
{
	lapack_sgeqr2(*m, *n, a, *lda, tau, work, info);
}
