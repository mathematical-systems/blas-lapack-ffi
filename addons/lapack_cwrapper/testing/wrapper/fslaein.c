#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fslaein_(long int* rightv, long int* noinit, int* n, float* h, int* ldh, float* wr, float* wi, float* vr, float* vi, float* b, int* ldb, float* work, float* eps3, float* smlnum, float* bignum, int* info)
{
	lapack_slaein(*rightv, *noinit, *n, h, *ldh, *wr, *wi, vr, vi, b, *ldb, work, *eps3, *smlnum, *bignum, info);
}
