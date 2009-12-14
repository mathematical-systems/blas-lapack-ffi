#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fdsprfs_(char* uplo, int* n, int* nrhs, double* ap, double* afp, int* ipiv, double* b, int* ldb, double* x, int* ldx, double* ferr, double* berr, double* work, int* iwork, int* info)
{
	enum lapack_uplo_type uploC;
	if (*uplo=='U') uploC = lapack_upper;
	else if(*uplo=='L') uploC = lapack_lower;
	else uploC = 0;
	lapack_dsprfs(uploC, *n, *nrhs, ap, afp, ipiv, b, *ldb, x, *ldx, ferr, berr, work, iwork, info);
}
