#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fsggbal_(char* job, int* n, float* a, int* lda, float* b, int* ldb, int* ilo, int* ihi, float* lscale, float* rscale, float* work, int* info)
{
	enum lapack_balance_type jobC;
	if (*job=='N') jobC = lapack_nothing;
	else if(*job=='P') jobC = lapack_permute;
	else if(*job=='S') jobC = lapack_scale;
	else if(*job=='B') jobC = lapack_permute_scale;
	else jobC = 0;
	lapack_sggbal(jobC, *n, a, *lda, b, *ldb, ilo, ihi, lscale, rscale, work, info);
}
