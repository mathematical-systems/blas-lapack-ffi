#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fdspcon_(char* uplo, int* n, double* ap, int* ipiv, double* anorm, double* rcond, double* work, int* iwork, int* info)
{
	enum lapack_uplo_type uploC;
	if (*uplo=='U') uploC = lapack_upper;
	else if(*uplo=='L') uploC = lapack_lower;
	else uploC = 0;
	lapack_dspcon(uploC, *n, ap, ipiv, *anorm, rcond, work, iwork, info);
}
