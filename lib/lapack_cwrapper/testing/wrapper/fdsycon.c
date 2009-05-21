#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fdsycon_(char* uplo, int* n, double* a, int* lda, int* ipiv, double* anorm, double* rcond, double* work, int* iwork, int* info)
{
	enum lapack_uplo_type uploC;
	if (*uplo=='U') uploC = lapack_upper;
	else if(*uplo=='L') uploC = lapack_lower;
	else uploC = 0;
	lapack_dsycon(uploC, *n, a, *lda, ipiv, *anorm, rcond, work, iwork, info);
}
