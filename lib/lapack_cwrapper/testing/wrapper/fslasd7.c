#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fslasd7_(int* icompq, int* nl, int* nr, int* sqre, int* k, float* d, float* z, float* zw, float* vf, float* vfw, float* vl, float* vlw, float* alpha, float* beta, float* dsigma, int* idx, int* idxp, int* idxq, int* perm, int* givptr, int* givcol, int* ldgcol, float* givnum, int* ldgnum, float* c, float* s, int* info)
{
	lapack_slasd7(*icompq, *nl, *nr, *sqre, k, d, z, zw, vf, vfw, vl, vlw, *alpha, *beta, dsigma, idx, idxp, idxq, perm, givptr, givcol, *ldgcol, givnum, *ldgnum, c, s, info);
}
