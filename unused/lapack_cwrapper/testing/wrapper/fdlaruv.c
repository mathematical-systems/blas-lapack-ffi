#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fdlaruv_(int* iseed, int* n, double* x)
{
	lapack_dlaruv(iseed, *n, x);
}
