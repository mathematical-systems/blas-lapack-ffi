#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fdlasd6_(int* icompq, int* nl, int* nr, int* sqre, double* d, double* vf, double* vl, double* alpha, double* beta, int* idxq, int* perm, int* givptr, int* givcol, int* ldgcol, double* givnum, int* ldgnum, double* poles, double* difl, double* difr, double* z, int* k, double* c, double* s, double* work, int* iwork, int* info)
{
	lapack_dlasd6(*icompq, *nl, *nr, *sqre, d, vf, vl, alpha, beta, idxq, perm, givptr, givcol, *ldgcol, givnum, *ldgnum, poles, difl, difr, z, k, c, s, work, iwork, info);
}
