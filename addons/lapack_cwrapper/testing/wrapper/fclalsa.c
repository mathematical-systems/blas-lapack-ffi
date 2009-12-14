#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fclalsa_(int* icompq, int* smlsiz, int* n, int* nrhs, void* b, int* ldb, void* bx, int* ldbx, float* u, int* ldu, float* vt, int* k, float* difl, float* difr, float* z, float* poles, int* givptr, int* givcol, int* ldgcol, int* perm, float* givnum, float* c, float* s, float* rwork, int* iwork, int* info)
{
	lapack_clalsa(*icompq, *smlsiz, *n, *nrhs, b, *ldb, bx, *ldbx, u, *ldu, vt, k, difl, difr, z, poles, givptr, givcol, *ldgcol, perm, givnum, c, s, rwork, iwork, info);
}
