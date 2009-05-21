#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fdgbtrs_(char* trans, int* n, int* kl, int* ku, int* nrhs, double* ab, int* ldab, int* ipiv, double* b, int* ldb, int* info)
{
	enum lapack_trans_type transC;
	if (*trans=='N') transC = lapack_no_trans;
	else if(*trans=='T') transC = lapack_trans;
	else if(*trans=='C') transC = lapack_conj_trans;
	else transC = 0;
	lapack_dgbtrs(transC, *n, *kl, *ku, *nrhs, ab, *ldab, ipiv, b, *ldb, info);
}
