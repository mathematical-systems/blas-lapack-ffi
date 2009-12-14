#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fslaed3_(int* k, int* n, int* n1, float* d, float* q, int* ldq, float* rho, float* dlamda, float* q2, int* indx, int* ctot, float* w, float* s, int* lds, int* info)
{
	lapack_slaed3(*k, *n, *n1, d, q, *ldq, *rho, dlamda, q2, indx, ctot, w, s, *lds, info);
}
