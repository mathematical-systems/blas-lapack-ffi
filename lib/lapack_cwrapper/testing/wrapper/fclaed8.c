#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fclaed8_(int* k, int* n, int* qsiz, void* q, int* ldq, float* d, float* rho, int* cutpnt, float* z, float* dlamda, void* q2, int* ldq2, float* w, int* indxp, int* indx, int* indxq, int* perm, int* givptr, int* givcol, float* givnum, int* info)
{
	lapack_claed8(k, *n, *qsiz, q, *ldq, d, rho, *cutpnt, z, dlamda, q2, *ldq2, w, indxp, indx, indxq, perm, givptr, givcol, givnum, info);
}
