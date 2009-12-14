#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fdlals0_(int* icompq, int* nl, int* nr, int* sqre, int* nrhs, double* b, int* ldb, double* bx, int* ldbx, int* perm, int* givptr, int* givcol, int* ldgcol, double* givnum, int* ldgnum, double* poles, double* difl, double* difr, double* z, int* k, double* c, double* s, double* work, int* info)
{
	lapack_dlals0(*icompq, *nl, *nr, *sqre, *nrhs, b, *ldb, bx, *ldbx, perm, *givptr, givcol, *ldgcol, givnum, *ldgnum, poles, difl, difr, z, *k, *c, *s, work, info);
}
