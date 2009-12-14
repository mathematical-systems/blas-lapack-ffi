#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fzlagtm_(char* trans, int* n, int* nrhs, double* alpha, void* dl, void* d, void* du, void* x, int* ldx, double* beta, void* b, int* ldb)
{
	enum lapack_trans_type transC;
	if (*trans=='N') transC = lapack_no_trans;
	else if(*trans=='T') transC = lapack_trans;
	else if(*trans=='C') transC = lapack_conj_trans;
	else transC = 0;
	lapack_zlagtm(transC, *n, *nrhs, *alpha, dl, d, du, x, *ldx, *beta, b, *ldb);
}
