#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fdlamc3_(double* output, double* a, double* b)
{
	*output = lapack_dlamc3( *a, *b);
}
