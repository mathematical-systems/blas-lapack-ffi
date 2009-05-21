#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fsptrfs_(int* n, int* nrhs, float* d, float* e, float* df, float* ef, float* b, int* ldb, float* x, int* ldx, float* ferr, float* berr, float* work, int* info)
{
	lapack_sptrfs(*n, *nrhs, d, e, df, ef, b, *ldb, x, *ldx, ferr, berr, work, info);
}
