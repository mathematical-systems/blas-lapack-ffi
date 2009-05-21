#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fsgehrd_(int* n, int* ilo, int* ihi, float* a, int* lda, float* tau, float* work, int* lwork, int* info)
{
	lapack_sgehrd(*n, *ilo, *ihi, a, *lda, tau, work, *lwork, info);
}
