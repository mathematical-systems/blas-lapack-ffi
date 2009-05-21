#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fslasd1_(int* nl, int* nr, int* sqre, float* d, float* alpha, float* beta, float* u, int* ldu, float* vt, int* ldvt, int* idxq, int* iwork, float* work, int* info)
{
	lapack_slasd1(*nl, *nr, *sqre, d, alpha, beta, u, *ldu, vt, *ldvt, idxq, iwork, work, info);
}
