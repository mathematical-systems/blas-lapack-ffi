#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fdlaed3_(int* k, int* n, int* n1, double* d, double* q, int* ldq, double* rho, double* dlamda, double* q2, int* indx, int* ctot, double* w, double* s, int* lds, int* info)
{
	lapack_dlaed3(*k, *n, *n1, d, q, *ldq, *rho, dlamda, q2, indx, ctot, w, s, *lds, info);
}
