#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fslagts_(int* job, int* n, float* a, float* b, float* c, float* d, int* in, float* y, float* tol, int* info)
{
	lapack_slagts(*job, *n, a, b, c, d, in, y, tol, info);
}
