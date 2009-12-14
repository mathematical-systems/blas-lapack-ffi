#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fstrcon_(char* norm, char* uplo, char* diag, int* n, float* a, int* lda, float* rcond, float* work, int* iwork, int* info)
{
	enum lapack_norm_type normC;
	if (*norm=='1' || *norm=='O') normC = lapack_one_norm;
	else if(*norm=='I') normC = lapack_inf_norm;
	else if(*norm=='M') normC = lapack_max_norm;
	else if(*norm=='F') normC = lapack_frobenius_norm;
	else normC = 0;
	enum lapack_uplo_type uploC;
	if (*uplo=='U') uploC = lapack_upper;
	else if(*uplo=='L') uploC = lapack_lower;
	else uploC = 0;
	enum lapack_diag_type diagC;
	if (*diag=='N') diagC = lapack_non_unit_diag;
	else if(*diag=='U') diagC = lapack_unit_diag;
	else diagC = 0;
	lapack_strcon(normC, uploC, diagC, *n, a, *lda, rcond, work, iwork, info);
}
