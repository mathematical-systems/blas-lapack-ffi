#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fdorghr_(int* n, int* ilo, int* ihi, double* a, int* lda, double* tau, double* work, int* lwork, int* info)
{
	lapack_dorghr(*n, *ilo, *ihi, a, *lda, tau, work, *lwork, info);
}
