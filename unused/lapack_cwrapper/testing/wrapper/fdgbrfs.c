#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fdgbrfs_(char* trans, int* n, int* kl, int* ku, int* nrhs, double* ab, int* ldab, double* afb, int* ldafb, int* ipiv, double* b, int* ldb, double* x, int* ldx, double* ferr, double* berr, double* work, int* iwork, int* info)
{
	enum lapack_trans_type transC;
	if (*trans=='N') transC = lapack_no_trans;
	else if(*trans=='T') transC = lapack_trans;
	else if(*trans=='C') transC = lapack_conj_trans;
	else transC = 0;
	lapack_dgbrfs(transC, *n, *kl, *ku, *nrhs, ab, *ldab, afb, *ldafb, ipiv, b, *ldb, x, *ldx, ferr, berr, work, iwork, info);
}
