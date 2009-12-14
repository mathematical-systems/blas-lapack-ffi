#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fslaed9_(int* k, int* kstart, int* kstop, int* n, float* d, float* q, int* ldq, float* rho, float* dlamda, float* w, float* s, int* lds, int* info)
{
	lapack_slaed9(*k, *kstart, *kstop, *n, d, q, *ldq, *rho, dlamda, w, s, *lds, info);
}
