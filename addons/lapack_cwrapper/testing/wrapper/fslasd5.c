#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fslasd5_(int* i, float* d, float* z, float* delta, float* rho, float* dsigma, float* work)
{
	lapack_slasd5(*i, d, z, delta, *rho, dsigma, work);
}
