#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fsgerfs_(char* trans, int* n, int* nrhs, float* a, int* lda, float* af, int* ldaf, int* ipiv, float* b, int* ldb, float* x, int* ldx, float* ferr, float* berr, float* work, int* iwork, int* info)
{
	enum lapack_trans_type transC;
	if (*trans=='N') transC = lapack_no_trans;
	else if(*trans=='T') transC = lapack_trans;
	else if(*trans=='C') transC = lapack_conj_trans;
	else transC = 0;
	lapack_sgerfs(transC, *n, *nrhs, a, *lda, af, *ldaf, ipiv, b, *ldb, x, *ldx, ferr, berr, work, iwork, info);
}
