#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fdlaed8_(int* icompq, int* k, int* n, int* qsiz, double* d, double* q, int* ldq, int* indxq, double* rho, int* cutpnt, double* z, double* dlamda, double* q2, int* ldq2, double* w, int* perm, int* givptr, int* givcol, double* givnum, int* indxp, int* indx, int* info)
{
	lapack_dlaed8(*icompq, k, *n, *qsiz, d, q, *ldq, indxq, rho, *cutpnt, z, dlamda, q2, *ldq2, w, perm, givptr, givcol, givnum, indxp, indx, info);
}
