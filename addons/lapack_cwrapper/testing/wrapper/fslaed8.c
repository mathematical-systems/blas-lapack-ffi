#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fslaed8_(int* icompq, int* k, int* n, int* qsiz, float* d, float* q, int* ldq, int* indxq, float* rho, int* cutpnt, float* z, float* dlamda, float* q2, int* ldq2, float* w, int* perm, int* givptr, int* givcol, float* givnum, int* indxp, int* indx, int* info)
{
	lapack_slaed8(*icompq, k, *n, *qsiz, d, q, *ldq, indxq, rho, *cutpnt, z, dlamda, q2, *ldq2, w, perm, givptr, givcol, givnum, indxp, indx, info);
}
