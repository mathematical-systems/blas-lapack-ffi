#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fsspcon_(char* uplo, int* n, float* ap, int* ipiv, float* anorm, float* rcond, float* work, int* iwork, int* info)
{
	enum lapack_uplo_type uploC;
	if (*uplo=='U') uploC = lapack_upper;
	else if(*uplo=='L') uploC = lapack_lower;
	else uploC = 0;
	lapack_sspcon(uploC, *n, ap, ipiv, *anorm, rcond, work, iwork, info);
}
