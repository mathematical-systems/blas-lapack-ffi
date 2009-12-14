#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fzgerfs_(char* trans, int* n, int* nrhs, void* a, int* lda, void* af, int* ldaf, int* ipiv, void* b, int* ldb, void* x, int* ldx, double* ferr, double* berr, void* work, double* rwork, int* info)
{
	enum lapack_trans_type transC;
	if (*trans=='N') transC = lapack_no_trans;
	else if(*trans=='T') transC = lapack_trans;
	else if(*trans=='C') transC = lapack_conj_trans;
	else transC = 0;
	lapack_zgerfs(transC, *n, *nrhs, a, *lda, af, *ldaf, ipiv, b, *ldb, x, *ldx, ferr, berr, work, rwork, info);
}
