#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fdlasd7_(int* icompq, int* nl, int* nr, int* sqre, int* k, double* d, double* z, double* zw, double* vf, double* vfw, double* vl, double* vlw, double* alpha, double* beta, double* dsigma, int* idx, int* idxp, int* idxq, int* perm, int* givptr, int* givcol, int* ldgcol, double* givnum, int* ldgnum, double* c, double* s, int* info)
{
	lapack_dlasd7(*icompq, *nl, *nr, *sqre, k, d, z, zw, vf, vfw, vl, vlw, *alpha, *beta, dsigma, idx, idxp, idxq, perm, givptr, givcol, *ldgcol, givnum, *ldgnum, c, s, info);
}
