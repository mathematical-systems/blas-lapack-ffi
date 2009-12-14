#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fslamc4_(int* emin, float* start, int* base)
{
	lapack_slamc4(emin, *start, *base);
}
