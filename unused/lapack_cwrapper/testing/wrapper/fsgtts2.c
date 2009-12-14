#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fsgtts2_(int* itrans, int* n, int* nrhs, float* dl, float* d, float* du, float* du2, int* ipiv, float* b, int* ldb)
{
	lapack_sgtts2(*itrans, *n, *nrhs, dl, d, du, du2, ipiv, b, *ldb);
}
