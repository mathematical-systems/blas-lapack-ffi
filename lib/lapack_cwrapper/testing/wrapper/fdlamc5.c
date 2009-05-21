#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fdlamc5_(int* beta, int* p, int* emin, long int* ieee, int* emax, double* rmax)
{
	lapack_dlamc5(*beta, *p, *emin, *ieee, emax, rmax);
}
