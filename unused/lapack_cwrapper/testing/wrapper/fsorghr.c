#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fsorghr_(int* n, int* ilo, int* ihi, float* a, int* lda, float* tau, float* work, int* lwork, int* info)
{
	lapack_sorghr(*n, *ilo, *ihi, a, *lda, tau, work, *lwork, info);
}
