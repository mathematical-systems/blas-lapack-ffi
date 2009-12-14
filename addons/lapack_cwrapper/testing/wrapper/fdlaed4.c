#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fdlaed4_(int* n, int* i, double* d, double* z, double* delta, double* rho, double* dlam, int* info)
{
	lapack_dlaed4(*n, *i, d, z, delta, *rho, dlam, info);
}
