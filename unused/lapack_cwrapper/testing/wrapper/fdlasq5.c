#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fdlasq5_(int* i0, int* n0, double* z, int* pp, double* tau, double* dmin, double* dmin1, double* dmin2, double* dn, double* dnm1, double* dnm2, long int* ieee)
{
	lapack_dlasq5(*i0, *n0, z, *pp, *tau, dmin, dmin1, dmin2, dn, dnm1, dnm2, *ieee);
}
