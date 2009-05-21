#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fdlaed2_(int* k, int* n, int* n1, double* d, double* q, int* ldq, int* indxq, double* rho, double* z, double* dlamda, double* w, double* q2, int* indx, int* indxc, int* indxp, int* coltyp, int* info)
{
	lapack_dlaed2(k, *n, *n1, d, q, *ldq, indxq, rho, z, dlamda, w, q2, indx, indxc, indxp, coltyp, info);
}
