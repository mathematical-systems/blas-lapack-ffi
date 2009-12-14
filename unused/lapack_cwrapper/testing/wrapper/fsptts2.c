#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fsptts2_(int* n, int* nrhs, float* d, float* e, float* b, int* ldb)
{
	lapack_sptts2(*n, *nrhs, d, e, b, *ldb);
}
