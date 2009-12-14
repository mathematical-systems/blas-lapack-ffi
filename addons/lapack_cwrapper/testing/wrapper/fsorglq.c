#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fsorglq_(int* m, int* n, int* k, float* a, int* lda, float* tau, float* work, int* lwork, int* info)
{
	lapack_sorglq(*m, *n, *k, a, *lda, tau, work, *lwork, info);
}
