#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fdlasd4_(int* n, int* i, double* d, double* z, double* delta, double* rho, double* sigma, double* work, int* info)
{
	lapack_dlasd4(*n, *i, d, z, delta, *rho, sigma, work, info);
}
