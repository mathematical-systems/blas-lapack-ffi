#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fdgehd2_(int* n, int* ilo, int* ihi, double* a, int* lda, double* tau, double* work, int* info)
{
	lapack_dgehd2(*n, *ilo, *ihi, a, *lda, tau, work, info);
}
