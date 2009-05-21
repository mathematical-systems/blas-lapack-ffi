#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fslasda_(int* icompq, int* smlsiz, int* n, int* sqre, float* d, float* e, float* u, int* ldu, float* vt, int* k, float* difl, float* difr, float* z, float* poles, int* givptr, int* givcol, int* ldgcol, int* perm, float* givnum, float* c, float* s, float* work, int* iwork, int* info)
{
	lapack_slasda(*icompq, *smlsiz, *n, *sqre, d, e, u, *ldu, vt, k, difl, difr, z, poles, givptr, givcol, *ldgcol, perm, givnum, c, s, work, iwork, info);
}
