#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fssprfs_(char* uplo, int* n, int* nrhs, float* ap, float* afp, int* ipiv, float* b, int* ldb, float* x, int* ldx, float* ferr, float* berr, float* work, int* iwork, int* info)
{
	enum lapack_uplo_type uploC;
	if (*uplo=='U') uploC = lapack_upper;
	else if(*uplo=='L') uploC = lapack_lower;
	else uploC = 0;
	lapack_ssprfs(uploC, *n, *nrhs, ap, afp, ipiv, b, *ldb, x, *ldx, ferr, berr, work, iwork, info);
}
