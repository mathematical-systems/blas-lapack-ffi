#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fcgtrfs_(char* trans, int* n, int* nrhs, void* dl, void* d, void* du, void* dlf, void* df, void* duf, void* du2, int* ipiv, void* b, int* ldb, void* x, int* ldx, float* ferr, float* berr, void* work, float* rwork, int* info)
{
	enum lapack_trans_type transC;
	if (*trans=='N') transC = lapack_no_trans;
	else if(*trans=='T') transC = lapack_trans;
	else if(*trans=='C') transC = lapack_conj_trans;
	else transC = 0;
	lapack_cgtrfs(transC, *n, *nrhs, dl, d, du, dlf, df, duf, du2, ipiv, b, *ldb, x, *ldx, ferr, berr, work, rwork, info);
}
