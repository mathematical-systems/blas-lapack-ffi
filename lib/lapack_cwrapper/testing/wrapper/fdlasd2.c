#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fdlasd2_(int* nl, int* nr, int* sqre, int* k, double* d, double* z, double* alpha, double* beta, double* u, int* ldu, double* vt, int* ldvt, double* dsigma, double* u2, int* ldu2, double* vt2, int* ldvt2, int* idxp, int* idx, int* idxc, int* idxq, int* coltyp, int* info)
{
	lapack_dlasd2(*nl, *nr, *sqre, k, d, z, *alpha, *beta, u, *ldu, vt, *ldvt, dsigma, u2, *ldu2, vt2, *ldvt2, idxp, idx, idxc, idxq, coltyp, info);
}
