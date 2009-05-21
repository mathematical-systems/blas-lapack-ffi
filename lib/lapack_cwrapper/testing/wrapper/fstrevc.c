#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fstrevc_(char* side, char* howmny, long int* select, int* n, float* t, int* ldt, float* vl, int* ldvl, float* vr, int* ldvr, int* mm, int* m, float* work, int* info)
{
	enum lapack_eigenvectors_side_type sideC;
	if (*side=='R') sideC = lapack_right_eigenvectors;
	else if(*side=='L') sideC = lapack_left_eigenvectors;
	else if(*side=='B') sideC = lapack_both_eigenvectors;
	else sideC = 0;
	enum lapack_how_many_type howmnyC;
	if (*howmny=='A') howmnyC = lapack_all;
	else if(*howmny=='B') howmnyC = lapack_backtransform;
	else if(*howmny=='S') howmnyC = lapack_select;
	else howmnyC = 0;
	lapack_strevc(sideC, howmnyC, select, *n, t, *ldt, vl, *ldvl, vr, *ldvr, *mm, m, work, info);
}
