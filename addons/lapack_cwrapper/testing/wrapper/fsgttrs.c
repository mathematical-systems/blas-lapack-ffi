#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fsgttrs_(char* trans, int* n, int* nrhs, float* dl, float* d, float* du, float* du2, int* ipiv, float* b, int* ldb, int* info)
{
	enum lapack_trans_type transC;
	if (*trans=='N') transC = lapack_no_trans;
	else if(*trans=='T') transC = lapack_trans;
	else if(*trans=='C') transC = lapack_conj_trans;
	else transC = 0;
	lapack_sgttrs(transC, *n, *nrhs, dl, d, du, du2, ipiv, b, *ldb, info);
}
