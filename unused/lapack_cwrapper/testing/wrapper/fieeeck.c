#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fieeeck_(int* output, int* ispec, float* zero, float* one)
{
	*output = lapack_ieeeck( *ispec, *zero, *one);
}
