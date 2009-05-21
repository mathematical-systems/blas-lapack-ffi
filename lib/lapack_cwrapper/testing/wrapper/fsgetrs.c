#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fsgetrs_(char* trans, int* n, int* nrhs, float* a, int* lda, int* ipiv, float* b, int* ldb, int* info)
{
	enum lapack_trans_type transC;
	if (*trans=='N') transC = lapack_no_trans;
	else if(*trans=='T') transC = lapack_trans;
	else if(*trans=='C') transC = lapack_conj_trans;
	else transC = 0;
	lapack_sgetrs(transC, *n, *nrhs, a, *lda, ipiv, b, *ldb, info);
}
