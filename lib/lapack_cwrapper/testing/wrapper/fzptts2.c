#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fzptts2_(int* iuplo, int* n, int* nrhs, double* d, void* e, double* b, int* ldb)
{
	lapack_zptts2(*iuplo, *n, *nrhs, d, e, b, *ldb);
}
