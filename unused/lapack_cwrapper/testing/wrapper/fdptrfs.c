#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fdptrfs_(int* n, int* nrhs, double* d, double* e, double* df, double* ef, double* b, int* ldb, double* x, int* ldx, double* ferr, double* berr, double* work, int* info)
{
	lapack_dptrfs(*n, *nrhs, d, e, df, ef, b, *ldb, x, *ldx, ferr, berr, work, info);
}
