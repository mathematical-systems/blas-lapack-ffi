#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fcunghr_(int* n, int* ilo, int* ihi, void* a, int* lda, void* tau, void* work, int* lwork, int* info)
{
	lapack_cunghr(*n, *ilo, *ihi, a, *lda, tau, work, *lwork, info);
}
