#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fdptcon_(int* n, double* d, double* e, double* anorm, double* rcond, double* work, int* info)
{
	lapack_dptcon(*n, d, e, *anorm, rcond, work, info);
}
