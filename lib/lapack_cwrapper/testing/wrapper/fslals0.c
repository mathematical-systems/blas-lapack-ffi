#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fslals0_(int* icompq, int* nl, int* nr, int* sqre, int* nrhs, float* b, int* ldb, float* bx, int* ldbx, int* perm, int* givptr, int* givcol, int* ldgcol, float* givnum, int* ldgnum, float* poles, float* difl, float* difr, float* z, int* k, float* c, float* s, float* work, int* info)
{
	lapack_slals0(*icompq, *nl, *nr, *sqre, *nrhs, b, *ldb, bx, *ldbx, perm, *givptr, givcol, *ldgcol, givnum, *ldgnum, poles, difl, difr, z, *k, *c, *s, work, info);
}
