#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fslarfx_(char* side, int* m, int* n, float* v, float* tau, float* c, int* ldc, float* work)
{
	enum lapack_side_type sideC;
	if (*side=='L') sideC = lapack_left_side;
	else if(*side=='R') sideC = lapack_right_side;
	else sideC = 0;
	lapack_slarfx(sideC, *m, *n, v, *tau, c, *ldc, work);
}
