#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fdlaed5_(int* i, double* d, double* z, double* delta, double* rho, double* dlam)
{
	lapack_dlaed5(*i, d, z, delta, *rho, dlam);
}
