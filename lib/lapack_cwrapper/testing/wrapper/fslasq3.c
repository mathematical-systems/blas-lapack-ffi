#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fslasq3_(int* i0, int* n0, float* z, int* pp, float* dmin, float* sigma, float* desig, float* qmax, int* nfail, int* iter, int* ndiv, int* ttype, long int* ieee)
{
	lapack_slasq3(*i0, *n0, z, *pp, dmin, sigma, desig, *qmax, nfail, iter, ndiv, ttype, *ieee);
}
