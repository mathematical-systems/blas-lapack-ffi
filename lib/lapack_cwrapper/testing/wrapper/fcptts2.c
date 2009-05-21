#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fcptts2_(int* iuplo, int* n, int* nrhs, float* d, void* e, float* b, int* ldb)
{
	lapack_cptts2(*iuplo, *n, *nrhs, d, e, b, *ldb);
}
