#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fdlasd1_(int* nl, int* nr, int* sqre, double* d, double* alpha, double* beta, double* u, int* ldu, double* vt, int* ldvt, int* idxq, int* iwork, double* work, int* info)
{
	lapack_dlasd1(*nl, *nr, *sqre, d, alpha, beta, u, *ldu, vt, *ldvt, idxq, iwork, work, info);
}
