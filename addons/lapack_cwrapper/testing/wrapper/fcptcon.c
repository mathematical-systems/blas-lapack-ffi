#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fcptcon_(int* n, float* d, void* e, float* anorm, float* rcond, float* rwork, int* info)
{
	lapack_cptcon(*n, d, e, *anorm, rcond, rwork, info);
}
