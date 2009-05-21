#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fslasq5_(int* i0, int* n0, float* z, int* pp, float* tau, float* dmin, float* dmin1, float* dmin2, float* dn, float* dnm1, float* dnm2, long int* ieee)
{
	lapack_slasq5(*i0, *n0, z, *pp, *tau, dmin, dmin1, dmin2, dn, dnm1, dnm2, *ieee);
}
