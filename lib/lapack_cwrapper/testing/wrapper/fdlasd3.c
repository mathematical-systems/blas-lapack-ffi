#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fdlasd3_(int* nl, int* nr, int* sqre, int* k, double* d, double* q, int* ldq, double* dsigma, double* u, int* ldu, double* u2, int* ldu2, double* vt, int* ldvt, double* vt2, int* ldvt2, int* idxc, int* ctot, double* z, int* info)
{
	lapack_dlasd3(*nl, *nr, *sqre, *k, d, q, *ldq, dsigma, u, *ldu, u2, *ldu2, vt, *ldvt, vt2, *ldvt2, idxc, ctot, z, info);
}
