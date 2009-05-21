#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fsgbsv_(int* n, int* kl, int* ku, int* nrhs, float* ab, int* ldab, int* ipiv, float* b, int* ldb, int* info)
{
	lapack_sgbsv(*n, *kl, *ku, *nrhs, ab, *ldab, ipiv, b, *ldb, info);
}
