#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fdlapy2_(double* output, double* x, double* y)
{
	*output = lapack_dlapy2( *x, *y);
}
