#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fslapy2_(float* output, float* x, float* y)
{
	*output = lapack_slapy2( *x, *y);
}
