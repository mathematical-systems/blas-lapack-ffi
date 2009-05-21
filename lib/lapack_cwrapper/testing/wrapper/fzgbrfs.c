#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fzgbrfs_(char* trans, int* n, int* kl, int* ku, int* nrhs, void* ab, int* ldab, void* afb, int* ldafb, int* ipiv, void* b, int* ldb, void* x, int* ldx, double* ferr, double* berr, void* work, double* rwork, int* info)
{
	enum lapack_trans_type transC;
	if (*trans=='N') transC = lapack_no_trans;
	else if(*trans=='T') transC = lapack_trans;
	else if(*trans=='C') transC = lapack_conj_trans;
	else transC = 0;
	lapack_zgbrfs(transC, *n, *kl, *ku, *nrhs, ab, *ldab, afb, *ldafb, ipiv, b, *ldb, x, *ldx, ferr, berr, work, rwork, info);
}
