#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fslaed5_(int* i, float* d, float* z, float* delta, float* rho, float* dlam)
{
	lapack_slaed5(*i, d, z, delta, *rho, dlam);
}
