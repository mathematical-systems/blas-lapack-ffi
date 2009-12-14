#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fcgtts2_(int* itrans, int* n, int* nrhs, void* dl, void* d, void* du, void* du2, int* ipiv, void* b, int* ldb)
{
	lapack_cgtts2(*itrans, *n, *nrhs, dl, d, du, du2, ipiv, b, *ldb);
}
