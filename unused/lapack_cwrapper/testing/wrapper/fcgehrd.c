#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fcgehrd_(int* n, int* ilo, int* ihi, void* a, int* lda, void* tau, void* work, int* lwork, int* info)
{
	lapack_cgehrd(*n, *ilo, *ihi, a, *lda, tau, work, *lwork, info);
}
