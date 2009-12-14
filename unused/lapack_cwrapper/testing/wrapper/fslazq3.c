#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fslazq3_(int* i0, int* n0, float* z, int* pp, float* dmin, float* sigma, float* desig, float* qmax, int* nfail, int* iter, int* ndiv, long int* ieee, int* ttype, float* dmin1, float* dmin2, float* dn, float* dn1, float* dn2, float* tau)
{
	lapack_slazq3(*i0, *n0, z, *pp, dmin, sigma, desig, *qmax, nfail, iter, ndiv, *ieee, ttype, dmin1, dmin2, dn, dn1, dn2, tau);
}
