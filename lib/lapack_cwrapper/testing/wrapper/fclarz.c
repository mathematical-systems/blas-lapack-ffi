#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fclarz_(char* side, int* m, int* n, int* l, void* v, int* incv, void* tau, void* c, int* ldc, void* work)
{
	enum lapack_side_type sideC;
	if (*side=='L') sideC = lapack_left_side;
	else if(*side=='R') sideC = lapack_right_side;
	else sideC = 0;
	lapack_clarz(sideC, *m, *n, *l, v, *incv, tau, c, *ldc, work);
}
