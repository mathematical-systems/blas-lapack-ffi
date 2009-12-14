#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fslasq4_(int* i0, int* n0, float* z, int* pp, int* n0in, float* dmin, float* dmin1, float* dmin2, float* dn, float* dn1, float* dn2, float* tau, int* ttype)
{
	lapack_slasq4(*i0, *n0, z, *pp, *n0in, *dmin, *dmin1, *dmin2, *dn, *dn1, *dn2, tau, ttype);
}
