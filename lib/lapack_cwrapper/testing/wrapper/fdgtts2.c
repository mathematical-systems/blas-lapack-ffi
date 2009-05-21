#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fdgtts2_(int* itrans, int* n, int* nrhs, double* dl, double* d, double* du, double* du2, int* ipiv, double* b, int* ldb)
{
	lapack_dgtts2(*itrans, *n, *nrhs, dl, d, du, du2, ipiv, b, *ldb);
}
