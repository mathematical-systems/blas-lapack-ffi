#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fcgebal_(char* job, int* n, void* a, int* lda, int* ilo, int* ihi, float* scale, int* info)
{
	enum lapack_balance_type jobC;
	if (*job=='N') jobC = lapack_nothing;
	else if(*job=='P') jobC = lapack_permute;
	else if(*job=='S') jobC = lapack_scale;
	else if(*job=='B') jobC = lapack_permute_scale;
	else jobC = 0;
	lapack_cgebal(jobC, *n, a, *lda, ilo, ihi, scale, info);
}
