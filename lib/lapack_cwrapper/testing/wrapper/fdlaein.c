#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fdlaein_(long int* rightv, long int* noinit, int* n, double* h, int* ldh, double* wr, double* wi, double* vr, double* vi, double* b, int* ldb, double* work, double* eps3, double* smlnum, double* bignum, int* info)
{
	lapack_dlaein(*rightv, *noinit, *n, h, *ldh, *wr, *wi, vr, vi, b, *ldb, work, *eps3, *smlnum, *bignum, info);
}
