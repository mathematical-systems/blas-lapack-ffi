#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fcgbrfs_(char* trans, int* n, int* kl, int* ku, int* nrhs, void* ab, int* ldab, void* afb, int* ldafb, int* ipiv, void* b, int* ldb, void* x, int* ldx, float* ferr, float* berr, void* work, float* rwork, int* info)
{
	enum lapack_trans_type transC;
	if (*trans=='N') transC = lapack_no_trans;
	else if(*trans=='T') transC = lapack_trans;
	else if(*trans=='C') transC = lapack_conj_trans;
	else transC = 0;
	lapack_cgbrfs(transC, *n, *kl, *ku, *nrhs, ab, *ldab, afb, *ldafb, ipiv, b, *ldb, x, *ldx, ferr, berr, work, rwork, info);
}
