#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fdlarfx_(char* side, int* m, int* n, double* v, double* tau, double* c, int* ldc, double* work)
{
	enum lapack_side_type sideC;
	if (*side=='L') sideC = lapack_left_side;
	else if(*side=='R') sideC = lapack_right_side;
	else sideC = 0;
	lapack_dlarfx(sideC, *m, *n, v, *tau, c, *ldc, work);
}
