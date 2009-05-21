#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fdlasd5_(int* i, double* d, double* z, double* delta, double* rho, double* dsigma, double* work)
{
	lapack_dlasd5(*i, d, z, delta, *rho, dsigma, work);
}
