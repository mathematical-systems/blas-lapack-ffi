#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fslasq6_(int* i0, int* n0, float* z, int* pp, float* dmin, float* dmin1, float* dmin2, float* dn, float* dnm1, float* dnm2)
{
	lapack_slasq6(*i0, *n0, z, *pp, dmin, dmin1, dmin2, dn, dnm1, dnm2);
}
