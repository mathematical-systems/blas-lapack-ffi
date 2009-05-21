#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fctgevc_(char* side, char* howmny, long int* select, int* n, void* s, int* lds, void* p, int* ldp, void* vl, int* ldvl, void* vr, int* ldvr, int* mm, int* m, void* work, float* rwork, int* info)
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
	lapack_ctgevc(sideC, howmnyC, select, *n, s, *lds, p, *ldp, vl, *ldvl, vr, *ldvr, *mm, m, work, rwork, info);
}
