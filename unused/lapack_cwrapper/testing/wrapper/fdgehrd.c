#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fdgehrd_(int* n, int* ilo, int* ihi, double* a, int* lda, double* tau, double* work, int* lwork, int* info)
{
	lapack_dgehrd(*n, *ilo, *ihi, a, *lda, tau, work, *lwork, info);
}
