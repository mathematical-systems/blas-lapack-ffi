#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fddisna_(char* job, int* m, int* n, double* d, double* sep, int* info)
{
	enum lapack_balance_type jobC;
	if (*job=='N') jobC = lapack_nothing;
	else if(*job=='P') jobC = lapack_permute;
	else if(*job=='S') jobC = lapack_scale;
	else if(*job=='B') jobC = lapack_permute_scale;
	else jobC = 0;
	lapack_ddisna(jobC, *m, *n, d, sep, info);
}
