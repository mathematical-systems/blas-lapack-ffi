#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fztgsna_(char* job, char* howmny, long int* select, int* n, void* a, int* lda, void* b, int* ldb, void* vl, int* ldvl, void* vr, int* ldvr, double* s, double* dif, int* mm, int* m, void* work, int* lwork, int* iwork, int* info)
{
	enum lapack_balance_type jobC;
	if (*job=='N') jobC = lapack_nothing;
	else if(*job=='P') jobC = lapack_permute;
	else if(*job=='S') jobC = lapack_scale;
	else if(*job=='B') jobC = lapack_permute_scale;
	else jobC = 0;
	enum lapack_how_many_type howmnyC;
	if (*howmny=='A') howmnyC = lapack_all;
	else if(*howmny=='B') howmnyC = lapack_backtransform;
	else if(*howmny=='S') howmnyC = lapack_select;
	else howmnyC = 0;
	lapack_ztgsna(jobC, howmnyC, select, *n, a, *lda, b, *ldb, vl, *ldvl, vr, *ldvr, s, dif, *mm, m, work, *lwork, iwork, info);
}
