#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fdgttrs_(char* trans, int* n, int* nrhs, double* dl, double* d, double* du, double* du2, int* ipiv, double* b, int* ldb, int* info)
{
	enum lapack_trans_type transC;
	if (*trans=='N') transC = lapack_no_trans;
	else if(*trans=='T') transC = lapack_trans;
	else if(*trans=='C') transC = lapack_conj_trans;
	else transC = 0;
	lapack_dgttrs(transC, *n, *nrhs, dl, d, du, du2, ipiv, b, *ldb, info);
}
