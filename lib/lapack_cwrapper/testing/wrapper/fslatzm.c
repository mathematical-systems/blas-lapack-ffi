#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fslatzm_(char* side, int* m, int* n, float* v, int* incv, float* tau, float* c1, float* c2, int* ldc, float* work)
{
	enum lapack_side_type sideC;
	if (*side=='L') sideC = lapack_left_side;
	else if(*side=='R') sideC = lapack_right_side;
	else sideC = 0;
	lapack_slatzm(sideC, *m, *n, v, *incv, *tau, c1, c2, *ldc, work);
}
