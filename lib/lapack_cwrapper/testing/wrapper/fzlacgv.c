#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fzlacgv_(int* n, void* x, int* incx)
{
	lapack_zlacgv(*n, x, *incx);
}
