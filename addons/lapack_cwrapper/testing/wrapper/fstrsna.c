#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fstrsna_(char* job, char* howmny, long int* select, int* n, float* t, int* ldt, float* vl, int* ldvl, float* vr, int* ldvr, float* s, float* sep, int* mm, int* m, float* work, int* ldwork, int* iwork, int* info)
{
	enum lapack_compute_cond_type jobC;
	if (*job=='E') jobC = lapack_cond_eigenvalues;
	else if(*job=='V') jobC = lapack_cond_eigenvectors;
	else if(*job=='N') jobC = lapack_no_cond;
	else if(*job=='B') jobC = lapack_cond_both;
	else jobC = 0;
	enum lapack_how_many_type howmnyC;
	if (*howmny=='A') howmnyC = lapack_all;
	else if(*howmny=='B') howmnyC = lapack_backtransform;
	else if(*howmny=='S') howmnyC = lapack_select;
	else howmnyC = 0;
	lapack_strsna(jobC, howmnyC, select, *n, t, *ldt, vl, *ldvl, vr, *ldvr, s, sep, *mm, m, work, *ldwork, iwork, info);
}
