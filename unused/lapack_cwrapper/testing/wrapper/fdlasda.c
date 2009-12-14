#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fdlasda_(int* icompq, int* smlsiz, int* n, int* sqre, double* d, double* e, double* u, int* ldu, double* vt, int* k, double* difl, double* difr, double* z, double* poles, int* givptr, int* givcol, int* ldgcol, int* perm, double* givnum, double* c, double* s, double* work, int* iwork, int* info)
{
	lapack_dlasda(*icompq, *smlsiz, *n, *sqre, d, e, u, *ldu, vt, k, difl, difr, z, poles, givptr, givcol, *ldgcol, perm, givnum, c, s, work, iwork, info);
}
