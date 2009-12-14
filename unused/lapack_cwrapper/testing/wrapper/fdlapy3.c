#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fdlapy3_(double* output, double* x, double* y, double* z)
{
	*output = lapack_dlapy3( *x, *y, *z);
}
