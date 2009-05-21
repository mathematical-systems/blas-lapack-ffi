#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fsgehd2_(int* n, int* ilo, int* ihi, float* a, int* lda, float* tau, float* work, int* info)
{
	lapack_sgehd2(*n, *ilo, *ihi, a, *lda, tau, work, info);
}
