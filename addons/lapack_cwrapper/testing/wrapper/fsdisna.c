#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fsdisna_(char* job, int* m, int* n, float* d, float* sep, int* info)
{
	enum lapack_balance_type jobC;
	if (*job=='N') jobC = lapack_nothing;
	else if(*job=='P') jobC = lapack_permute;
	else if(*job=='S') jobC = lapack_scale;
	else if(*job=='B') jobC = lapack_permute_scale;
	else jobC = 0;
	lapack_sdisna(jobC, *m, *n, d, sep, info);
}
