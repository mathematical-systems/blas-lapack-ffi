#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fdlasq3_(int* i0, int* n0, double* z, int* pp, double* dmin, double* sigma, double* desig, double* qmax, int* nfail, int* iter, int* ndiv, int* ttype, long int* ieee)
{
	lapack_dlasq3(*i0, *n0, z, *pp, dmin, sigma, desig, *qmax, nfail, iter, ndiv, ttype, *ieee);
}
