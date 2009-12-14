#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fdlamc4_(int* emin, double* start, int* base)
{
	lapack_dlamc4(emin, *start, *base);
}
