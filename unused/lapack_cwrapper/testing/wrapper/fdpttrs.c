#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fdpttrs_(int* n, int* nrhs, double* d, double* e, double* b, int* ldb, int* info)
{
	lapack_dpttrs(*n, *nrhs, d, e, b, *ldb, info);
}
