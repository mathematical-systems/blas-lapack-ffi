#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fzladiv_(double* output, void* x, void* y)
{
	*output = lapack_zladiv( x, y);
}
