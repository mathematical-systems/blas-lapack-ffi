#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fdggbak_(char* job, char* side, int* n, int* ilo, int* ihi, double* lscale, double* rscale, int* m, double* v, int* ldv, int* info)
{
	enum lapack_balance_type jobC;
	if (*job=='N') jobC = lapack_nothing;
	else if(*job=='P') jobC = lapack_permute;
	else if(*job=='S') jobC = lapack_scale;
	else if(*job=='B') jobC = lapack_permute_scale;
	else jobC = 0;
	enum lapack_side_type sideC;
	if (*side=='L') sideC = lapack_left_side;
	else if(*side=='R') sideC = lapack_right_side;
	else sideC = 0;
	lapack_dggbak(jobC, sideC, *n, *ilo, *ihi, lscale, rscale, *m, v, *ldv, info);
}
