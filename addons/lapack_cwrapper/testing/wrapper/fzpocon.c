#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fzpocon_(char* uplo, int* n, void* a, int* lda, double* anorm, double* rcond, void* work, double* rwork, int* info)
{
	enum lapack_uplo_type uploC;
	if (*uplo=='U') uploC = lapack_upper;
	else if(*uplo=='L') uploC = lapack_lower;
	else uploC = 0;
	lapack_zpocon(uploC, *n, a, *lda, *anorm, rcond, work, rwork, info);
}
