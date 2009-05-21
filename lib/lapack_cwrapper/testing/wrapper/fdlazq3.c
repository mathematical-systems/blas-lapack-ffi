#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fdlazq3_(int* i0, int* n0, double* z, int* pp, double* dmin, double* sigma, double* desig, double* qmax, int* nfail, int* iter, int* ndiv, long int* ieee, int* ttype, float* dmin1, float* dmin2, float* dn, float* dn1, float* dn2, float* tau)
{
	lapack_dlazq3(*i0, *n0, z, *pp, dmin, sigma, desig, *qmax, nfail, iter, ndiv, *ieee, ttype, dmin1, dmin2, dn, dn1, dn2, tau);
}
