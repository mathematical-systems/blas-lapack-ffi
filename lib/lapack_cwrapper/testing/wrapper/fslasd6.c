#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fslasd6_(int* icompq, int* nl, int* nr, int* sqre, float* d, float* vf, float* vl, float* alpha, float* beta, int* idxq, int* perm, int* givptr, int* givcol, int* ldgcol, float* givnum, int* ldgnum, float* poles, float* difl, float* difr, float* z, int* k, float* c, float* s, float* work, int* iwork, int* info)
{
	lapack_slasd6(*icompq, *nl, *nr, *sqre, d, vf, vl, alpha, beta, idxq, perm, givptr, givcol, *ldgcol, givnum, *ldgnum, poles, difl, difr, z, k, c, s, work, iwork, info);
}
