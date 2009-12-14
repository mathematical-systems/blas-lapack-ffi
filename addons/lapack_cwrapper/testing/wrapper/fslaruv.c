#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fslaruv_(int* iseed, int* n, float* x)
{
	lapack_slaruv(iseed, *n, x);
}
