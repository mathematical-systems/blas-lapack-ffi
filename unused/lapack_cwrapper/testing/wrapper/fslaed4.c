#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fslaed4_(int* n, int* i, float* d, float* z, float* delta, float* rho, float* dlam, int* info)
{
	lapack_slaed4(*n, *i, d, z, delta, *rho, dlam, info);
}
