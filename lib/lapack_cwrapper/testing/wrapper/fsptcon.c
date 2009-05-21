#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fsptcon_(int* n, float* d, float* e, float* anorm, float* rcond, float* work, int* info)
{
	lapack_sptcon(*n, d, e, *anorm, rcond, work, info);
}
