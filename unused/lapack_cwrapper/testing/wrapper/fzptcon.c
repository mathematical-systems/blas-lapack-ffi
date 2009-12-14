#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fzptcon_(int* n, double* d, void* e, double* anorm, double* rcond, double* rwork, int* info)
{
	lapack_zptcon(*n, d, e, *anorm, rcond, rwork, info);
}
