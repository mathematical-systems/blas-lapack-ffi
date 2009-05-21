#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fdtprfs_(char* uplo, char* trans, char* diag, int* n, int* nrhs, double* ap, double* b, int* ldb, double* x, int* ldx, double* ferr, double* berr, double* work, int* iwork, int* info)
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
	lapack_dtprfs(uploC, transC, diagC, *n, *nrhs, ap, b, *ldb, x, *ldx, ferr, berr, work, iwork, info);
}
