#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fdlamc2_(int* beta, int* t, long int* rnd, double* eps, int* emin, double* rmin, int* emax, double* rmax)
{
	lapack_dlamc2(beta, t, rnd, eps, emin, rmin, emax, rmax);
}
