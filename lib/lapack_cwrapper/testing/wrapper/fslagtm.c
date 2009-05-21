#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fslagtm_(char* trans, int* n, int* nrhs, float* alpha, float* dl, float* d, float* du, float* x, int* ldx, float* beta, float* b, int* ldb)
{
	enum lapack_trans_type transC;
	if (*trans=='N') transC = lapack_no_trans;
	else if(*trans=='T') transC = lapack_trans;
	else if(*trans=='C') transC = lapack_conj_trans;
	else transC = 0;
	lapack_slagtm(transC, *n, *nrhs, *alpha, dl, d, du, x, *ldx, *beta, b, *ldb);
}
