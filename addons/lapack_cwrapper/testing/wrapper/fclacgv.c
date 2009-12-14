#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fclacgv_(int* n, void* x, int* incx)
{
	lapack_clacgv(*n, x, *incx);
}
