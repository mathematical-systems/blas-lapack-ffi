#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fdlaed9_(int* k, int* kstart, int* kstop, int* n, double* d, double* q, int* ldq, double* rho, double* dlamda, double* w, double* s, int* lds, int* info)
{
	lapack_dlaed9(*k, *kstart, *kstop, *n, d, q, *ldq, *rho, dlamda, w, s, *lds, info);
}
