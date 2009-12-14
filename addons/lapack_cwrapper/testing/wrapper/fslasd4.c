#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fslasd4_(int* n, int* i, float* d, float* z, float* delta, float* rho, float* sigma, float* work, int* info)
{
	lapack_slasd4(*n, *i, d, z, delta, *rho, sigma, work, info);
}
