#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void ficmax1_(int* output, int* n, void* cx, int* incx)
{
	*output = lapack_icmax1( *n, cx, *incx);
}
