#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fslamc2_(int* beta, int* t, long int* rnd, float* eps, int* emin, float* rmin, int* emax, float* rmax)
{
	lapack_slamc2(beta, t, rnd, eps, emin, rmin, emax, rmax);
}
