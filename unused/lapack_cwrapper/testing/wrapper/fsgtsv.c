#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fsgtsv_(int* n, int* nrhs, float* dl, float* d, float* du, float* b, int* ldb, int* info)
{
	lapack_sgtsv(*n, *nrhs, dl, d, du, b, *ldb, info);
}
