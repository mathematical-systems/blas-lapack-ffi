#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fdlarnv_(int* idist, int* iseed, int* n, double* x)
{
	lapack_dlarnv(*idist, iseed, *n, x);
}
