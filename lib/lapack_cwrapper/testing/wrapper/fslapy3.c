#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fslapy3_(float* output, float* x, float* y, float* z)
{
	*output = lapack_slapy3( *x, *y, *z);
}
