#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fdlarf_(char* side, int* m, int* n, double* v, int* incv, double* tau, double* c, int* ldc, double* work)
{
	enum lapack_side_type sideC;
	if (*side=='L') sideC = lapack_left_side;
	else if(*side=='R') sideC = lapack_right_side;
	else sideC = 0;
	lapack_dlarf(sideC, *m, *n, v, *incv, *tau, c, *ldc, work);
}
