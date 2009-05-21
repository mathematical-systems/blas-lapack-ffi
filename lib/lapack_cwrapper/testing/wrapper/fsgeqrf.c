#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fsgeqrf_(int* m, int* n, float* a, int* lda, float* tau, float* work, int* lwork, int* info)
{
	lapack_sgeqrf(*m, *n, a, *lda, tau, work, *lwork, info);
}
