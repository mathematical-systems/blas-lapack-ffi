#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fzlarnv_(int* idist, int* iseed, int* n, void* x)
{
	lapack_zlarnv(*idist, iseed, *n, x);
}
