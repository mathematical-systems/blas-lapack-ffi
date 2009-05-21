#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fslaed2_(int* k, int* n, int* n1, float* d, float* q, int* ldq, int* indxq, float* rho, float* z, float* dlamda, float* w, float* q2, int* indx, int* indxc, int* indxp, int* coltyp, int* info)
{
	lapack_slaed2(k, *n, *n1, d, q, *ldq, indxq, rho, z, dlamda, w, q2, indx, indxc, indxp, coltyp, info);
}
