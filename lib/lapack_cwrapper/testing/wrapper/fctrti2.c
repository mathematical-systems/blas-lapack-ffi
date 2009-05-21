#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fctrti2_(char* uplo, char* diag, int* n, void* a, int* lda, int* info)
{
	enum lapack_uplo_type uploC;
	if (*uplo=='U') uploC = lapack_upper;
	else if(*uplo=='L') uploC = lapack_lower;
	else uploC = 0;
	enum lapack_diag_type diagC;
	if (*diag=='N') diagC = lapack_non_unit_diag;
	else if(*diag=='U') diagC = lapack_unit_diag;
	else diagC = 0;
	lapack_ctrti2(uploC, diagC, *n, a, *lda, info);
}
