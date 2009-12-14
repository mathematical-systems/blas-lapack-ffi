#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fzlarfx_(char* side, int* m, int* n, void* v, void* tau, void* c, int* ldc, void* work)
{
	enum lapack_side_type sideC;
	if (*side=='L') sideC = lapack_left_side;
	else if(*side=='R') sideC = lapack_right_side;
	else sideC = 0;
	lapack_zlarfx(sideC, *m, *n, v, tau, c, *ldc, work);
}
