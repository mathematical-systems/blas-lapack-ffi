#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fdlasq6_(int* i0, int* n0, double* z, int* pp, double* dmin, double* dmin1, double* dmin2, double* dn, double* dnm1, double* dnm2)
{
	lapack_dlasq6(*i0, *n0, z, *pp, dmin, dmin1, dmin2, dn, dnm1, dnm2);
}
