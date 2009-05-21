#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fslamc3_(float* output, float* a, float* b)
{
	*output = lapack_slamc3( *a, *b);
}
