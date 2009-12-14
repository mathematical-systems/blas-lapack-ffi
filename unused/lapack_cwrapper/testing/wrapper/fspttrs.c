#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fspttrs_(int* n, int* nrhs, float* d, float* e, float* b, int* ldb, int* info)
{
	lapack_spttrs(*n, *nrhs, d, e, b, *ldb, info);
}
