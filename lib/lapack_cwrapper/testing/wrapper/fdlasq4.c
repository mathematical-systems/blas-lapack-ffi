#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fdlasq4_(int* i0, int* n0, double* z, int* pp, int* n0in, double* dmin, double* dmin1, double* dmin2, double* dn, double* dn1, double* dn2, double* tau, int* ttype)
{
	lapack_dlasq4(*i0, *n0, z, *pp, *n0in, *dmin, *dmin1, *dmin2, *dn, *dn1, *dn2, tau, ttype);
}
