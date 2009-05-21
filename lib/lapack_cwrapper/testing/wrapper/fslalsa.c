#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fslalsa_(int* icompq, int* smlsiz, int* n, int* nrhs, float* b, int* ldb, float* bx, int* ldbx, float* u, int* ldu, float* vt, int* k, float* difl, float* difr, float* z, float* poles, int* givptr, int* givcol, int* ldgcol, int* perm, float* givnum, float* c, float* s, float* work, int* iwork, int* info)
{
	lapack_slalsa(*icompq, *smlsiz, *n, *nrhs, b, *ldb, bx, *ldbx, u, *ldu, vt, k, difl, difr, z, poles, givptr, givcol, *ldgcol, perm, givnum, c, s, work, iwork, info);
}
