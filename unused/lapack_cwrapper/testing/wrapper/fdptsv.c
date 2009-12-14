#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fdptsv_(int* n, int* nrhs, double* d, double* e, double* b, int* ldb, int* info)
{
	lapack_dptsv(*n, *nrhs, d, e, b, *ldb, info);
}
