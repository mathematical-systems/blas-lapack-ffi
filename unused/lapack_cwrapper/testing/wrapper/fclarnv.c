#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fclarnv_(int* idist, int* iseed, int* n, void* x)
{
	lapack_clarnv(*idist, iseed, *n, x);
}
