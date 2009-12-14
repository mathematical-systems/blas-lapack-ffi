#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fzlatzm_(char* side, int* m, int* n, void* v, int* incv, void* tau, void* c1, void* c2, int* ldc, void* work)
{
	enum lapack_side_type sideC;
	if (*side=='L') sideC = lapack_left_side;
	else if(*side=='R') sideC = lapack_right_side;
	else sideC = 0;
	lapack_zlatzm(sideC, *m, *n, v, *incv, tau, c1, c2, *ldc, work);
}
