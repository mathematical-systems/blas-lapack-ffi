#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fzlaed8_(int* k, int* n, int* qsiz, void* q, int* ldq, double* d, double* rho, int* cutpnt, double* z, double* dlamda, void* q2, int* ldq2, double* w, int* indxp, int* indx, int* indxq, int* perm, int* givptr, int* givcol, double* givnum, int* info)
{
	lapack_zlaed8(k, *n, *qsiz, q, *ldq, d, rho, *cutpnt, z, dlamda, q2, *ldq2, w, indxp, indx, indxq, perm, givptr, givcol, givnum, info);
}
