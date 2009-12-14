#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fdgtrfs_(char* trans, int* n, int* nrhs, double* dl, double* d, double* du, double* dlf, double* df, double* duf, double* du2, int* ipiv, double* b, int* ldb, double* x, int* ldx, double* ferr, double* berr, double* work, int* iwork, int* info)
{
	enum lapack_trans_type transC;
	if (*trans=='N') transC = lapack_no_trans;
	else if(*trans=='T') transC = lapack_trans;
	else if(*trans=='C') transC = lapack_conj_trans;
	else transC = 0;
	lapack_dgtrfs(transC, *n, *nrhs, dl, d, du, dlf, df, duf, du2, ipiv, b, *ldb, x, *ldx, ferr, berr, work, iwork, info);
}
