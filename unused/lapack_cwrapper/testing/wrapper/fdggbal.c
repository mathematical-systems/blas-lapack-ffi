#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fdggbal_(char* job, int* n, double* a, int* lda, double* b, int* ldb, int* ilo, int* ihi, double* lscale, double* rscale, float* work, int* info)
{
	enum lapack_balance_type jobC;
	if (*job=='N') jobC = lapack_nothing;
	else if(*job=='P') jobC = lapack_permute;
	else if(*job=='S') jobC = lapack_scale;
	else if(*job=='B') jobC = lapack_permute_scale;
	else jobC = 0;
	lapack_dggbal(jobC, *n, a, *lda, b, *ldb, ilo, ihi, lscale, rscale, work, info);
}
