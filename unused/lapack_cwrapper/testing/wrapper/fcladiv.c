#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fcladiv_(void* output, void* x, void* y)
{
	(float*) output = lapack_cladiv( x, y);
}
