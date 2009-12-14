#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fscsum1_(float* output, int* n, void* cx, int* incx)
{
	*output = lapack_scsum1( *n, cx, *incx);
}
