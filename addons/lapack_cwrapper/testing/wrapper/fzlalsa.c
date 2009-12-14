#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fzlalsa_(int* icompq, int* smlsiz, int* n, int* nrhs, void* b, int* ldb, void* bx, int* ldbx, double* u, int* ldu, double* vt, int* k, double* difl, double* difr, double* z, double* poles, int* givptr, int* givcol, int* ldgcol, int* perm, double* givnum, double* c, double* s, double* rwork, int* iwork, int* info)
{
	lapack_zlalsa(*icompq, *smlsiz, *n, *nrhs, b, *ldb, bx, *ldbx, u, *ldu, vt, k, difl, difr, z, poles, givptr, givcol, *ldgcol, perm, givnum, c, s, rwork, iwork, info);
}
