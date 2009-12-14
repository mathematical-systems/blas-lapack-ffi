#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fdgbsv_(int* n, int* kl, int* ku, int* nrhs, double* ab, int* ldab, int* ipiv, double* b, int* ldb, int* info)
{
	lapack_dgbsv(*n, *kl, *ku, *nrhs, ab, *ldab, ipiv, b, *ldb, info);
}
