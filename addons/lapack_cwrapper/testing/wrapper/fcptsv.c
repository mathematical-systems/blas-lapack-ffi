#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fcptsv_(int* n, int* nrhs, float* d, void* e, void* b, int* ldb, int* info)
{
	lapack_cptsv(*n, *nrhs, d, e, b, *ldb, info);
}
