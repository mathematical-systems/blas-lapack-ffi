#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fizmax1_(int* output, int* n, void* cx, int* incx)
{
	*output = lapack_izmax1( *n, cx, *incx);
}
