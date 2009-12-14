#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fzptsv_(int* n, int* nrhs, double* d, void* e, void* b, int* ldb, int* info)
{
	lapack_zptsv(*n, *nrhs, d, e, b, *ldb, info);
}
