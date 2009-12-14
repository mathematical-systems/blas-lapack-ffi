#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fslasd2_(int* nl, int* nr, int* sqre, int* k, float* d, float* z, float* alpha, float* beta, float* u, int* ldu, float* vt, int* ldvt, float* dsigma, float* u2, int* ldu2, float* vt2, int* ldvt2, int* idxp, int* idx, int* idxc, int* idxq, int* coltyp, int* info)
{
	lapack_slasd2(*nl, *nr, *sqre, k, d, z, *alpha, *beta, u, *ldu, vt, *ldvt, dsigma, u2, *ldu2, vt2, *ldvt2, idxp, idx, idxc, idxq, coltyp, info);
}
