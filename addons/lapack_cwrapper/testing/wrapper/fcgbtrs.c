#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fcgbtrs_(char* trans, int* n, int* kl, int* ku, int* nrhs, void* ab, int* ldab, int* ipiv, void* b, int* ldb, int* info)
{
	enum lapack_trans_type transC;
	if (*trans=='N') transC = lapack_no_trans;
	else if(*trans=='T') transC = lapack_trans;
	else if(*trans=='C') transC = lapack_conj_trans;
	else transC = 0;
	lapack_cgbtrs(transC, *n, *kl, *ku, *nrhs, ab, *ldab, ipiv, b, *ldb, info);
}
