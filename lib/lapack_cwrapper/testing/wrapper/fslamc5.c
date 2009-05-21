#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fslamc5_(int* beta, int* p, int* emin, long int* ieee, int* emax, float* rmax)
{
	lapack_slamc5(*beta, *p, *emin, *ieee, emax, rmax);
}
