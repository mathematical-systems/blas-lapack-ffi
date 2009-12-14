#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fdgtsv_(int* n, int* nrhs, double* dl, double* d, double* du, double* b, int* ldb, int* info)
{
	lapack_dgtsv(*n, *nrhs, dl, d, du, b, *ldb, info);
}
