#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fclassq_(int* n, void* x, int* incx, float* scale, float* sumsq)
{
	lapack_classq(*n, x, *incx, scale, sumsq);
}
