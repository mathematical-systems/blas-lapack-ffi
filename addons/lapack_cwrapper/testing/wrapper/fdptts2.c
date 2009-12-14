#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fdptts2_(int* n, int* nrhs, double* d, double* e, double* b, int* ldb)
{
	lapack_dptts2(*n, *nrhs, d, e, b, *ldb);
}
