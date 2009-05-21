#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fslarnv_(int* idist, int* iseed, int* n, float* x)
{
	lapack_slarnv(*idist, iseed, *n, x);
}
