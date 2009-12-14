#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fslasd3_(int* nl, int* nr, int* sqre, int* k, float* d, float* q, int* ldq, float* dsigma, float* u, int* ldu, float* u2, int* ldu2, float* vt, int* ldvt, float* vt2, int* ldvt2, int* idxc, int* ctot, float* z, int* info)
{
	lapack_slasd3(*nl, *nr, *sqre, *k, d, q, *ldq, dsigma, u, *ldu, u2, *ldu2, vt, *ldvt, vt2, *ldvt2, idxc, ctot, z, info);
}
