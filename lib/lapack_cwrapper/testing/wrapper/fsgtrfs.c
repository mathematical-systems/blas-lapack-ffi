#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fsgtrfs_(char* trans, int* n, int* nrhs, float* dl, float* d, float* du, float* dlf, float* df, float* duf, float* du2, int* ipiv, float* b, int* ldb, float* x, int* ldx, float* ferr, float* berr, float* work, int* iwork, int* info)
{
	enum lapack_trans_type transC;
	if (*trans=='N') transC = lapack_no_trans;
	else if(*trans=='T') transC = lapack_trans;
	else if(*trans=='C') transC = lapack_conj_trans;
	else transC = 0;
	lapack_sgtrfs(transC, *n, *nrhs, dl, d, du, dlf, df, duf, du2, ipiv, b, *ldb, x, *ldx, ferr, berr, work, iwork, info);
}
