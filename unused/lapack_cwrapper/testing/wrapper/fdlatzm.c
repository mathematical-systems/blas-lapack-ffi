#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fdlatzm_(char* side, int* m, int* n, double* v, int* incv, double* tau, double* c1, double* c2, int* ldc, double* work)
{
	enum lapack_side_type sideC;
	if (*side=='L') sideC = lapack_left_side;
	else if(*side=='R') sideC = lapack_right_side;
	else sideC = 0;
	lapack_dlatzm(sideC, *m, *n, v, *incv, *tau, c1, c2, *ldc, work);
}
