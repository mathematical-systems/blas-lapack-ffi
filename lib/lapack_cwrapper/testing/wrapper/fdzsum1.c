#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fdzsum1_(double* output, int* n, void* cx, int* incx)
{
	*output = lapack_dzsum1( *n, cx, *incx);
}
