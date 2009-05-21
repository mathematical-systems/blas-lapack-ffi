#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fcgttrs_(char* trans, int* n, int* nrhs, void* dl, void* d, void* du, void* du2, int* ipiv, void* b, int* ldb, int* info)
{
	enum lapack_trans_type transC;
	if (*trans=='N') transC = lapack_no_trans;
	else if(*trans=='T') transC = lapack_trans;
	else if(*trans=='C') transC = lapack_conj_trans;
	else transC = 0;
	lapack_cgttrs(transC, *n, *nrhs, dl, d, du, du2, ipiv, b, *ldb, info);
}
