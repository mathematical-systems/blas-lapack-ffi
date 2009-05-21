#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fzgbsv_(int* n, int* kl, int* ku, int* nrhs, void* ab, int* ldab, int* ipiv, void* b, int* ldb, int* info)
{
	lapack_zgbsv(*n, *kl, *ku, *nrhs, ab, *ldab, ipiv, b, *ldb, info);
}
