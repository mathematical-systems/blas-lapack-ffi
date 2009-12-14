#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fslarz_(char* side, int* m, int* n, int* l, float* v, int* incv, float* tau, float* c, int* ldc, float* work)
{
	enum lapack_side_type sideC;
	if (*side=='L') sideC = lapack_left_side;
	else if(*side=='R') sideC = lapack_right_side;
	else sideC = 0;
	lapack_slarz(sideC, *m, *n, *l, v, *incv, *tau, c, *ldc, work);
}
