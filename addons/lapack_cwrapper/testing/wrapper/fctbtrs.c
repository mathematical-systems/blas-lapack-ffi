#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fctbtrs_(char* uplo, char* trans, char* diag, int* n, int* kd, int* nrhs, void* ab, int* ldab, void* b, int* ldb, int* info)
{
	enum lapack_uplo_type uploC;
	if (*uplo=='U') uploC = lapack_upper;
	else if(*uplo=='L') uploC = lapack_lower;
	else uploC = 0;
	enum lapack_trans_type transC;
	if (*trans=='N') transC = lapack_no_trans;
	else if(*trans=='T') transC = lapack_trans;
	else if(*trans=='C') transC = lapack_conj_trans;
	else transC = 0;
	enum lapack_diag_type diagC;
	if (*diag=='N') diagC = lapack_non_unit_diag;
	else if(*diag=='U') diagC = lapack_unit_diag;
	else diagC = 0;
	lapack_ctbtrs(uploC, transC, diagC, *n, *kd, *nrhs, ab, *ldab, b, *ldb, info);
}
